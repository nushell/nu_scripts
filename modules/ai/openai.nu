export-env {
    $env.OPENAI_HOST = "http://localhost:11434"
    $env.OPENAI_CHAT = {}
    $env.OPENAI_API_KEY = 'secret'
    $env.OPENAI_ORG_ID = ''
    $env.OPENAI_PROJECT_ID = ''
}


def "nu-complete models" [] {
    http get --headers [
        Authorization $"Bearer ($env.OPENAI_API_KEY)"
        OpenAI-Organization $env.OPENAI_ORG_ID
        OpenAI-Project $env.OPENAI_PROJECT_ID
    ] $"($env.OPENAI_HOST)/v1/models"
    | get data.id
}


export def --env "ai chat" [
    model: string@"nu-complete models"
    message: string
    --image(-i): path
    --reset(-r)
    --forget(-f)
    --placehold(-p): string = '{}'
    --out(-o)
    --debug
] {
    let content = $in | default ""
    let img = if ($image | is-empty) {
        {}
    } else {
        {images: [(open $image | encode base64)]}
    }
    let msg = {
        role: "user"
        content: ($message | str replace -m $placehold $content)
        ...$img
    }
    if $debug {
        print $"(ansi grey)($message)\n---\n($placehold)\n---(ansi reset)"
        print $"(ansi grey)($msg.content)\n---(ansi reset)"
    }
    if not $forget {
        if ($env.OPENAI_CHAT | is-empty) or ($model not-in $env.OPENAI_CHAT) {
            $env.OPENAI_CHAT = ($env.OPENAI_CHAT | insert $model [])
        }
        if $reset {
            $env.OPENAI_CHAT = ($env.OPENAI_CHAT | update $model [])
            print '✨'
        }
        $env.OPENAI_CHAT = ($env.OPENAI_CHAT | update $model {|x| $x | get $model | append $msg})
    }

    let r = http post -t application/json --headers [
        Authorization $"Bearer ($env.OPENAI_API_KEY)"
    ] $"($env.OPENAI_HOST)/v1/chat/completions" {
        model: $model
        messages: [
            ...(if $forget { [] } else { $env.OPENAI_CHAT | get $model })
            $msg
        ]
        stream: true
    }
    | lines
    | reduce -f {msg: '', token: 0} {|i,a|
        let x = $i | parse -r '.*?(?<data>\{.*)'
        if ($x | is-empty) { return $a }
        let x = $x | get 0.data | from json
        let m = $x.choices | each { $in.delta.content } | str join
        print -n $m
        $a
        | update msg {|x| $x.msg + $m }
        | update token {|x| $x.token + 1 }
    }
    if not $forget {
        let r = {role: 'assistant', content: $r.msg, token: $r.token}
        $env.OPENAI_CHAT = ($env.OPENAI_CHAT | update $model {|x| $x | get $model | append $r })
    }
    if $out { $r.msg }
}


export def "ai embed" [
    model: string@"nu-complete models"
    input: string
] {
    http post -t application/json $"($env.OPENAI_HOST)/v1/embeddings" {
        model: $model, input: [$input], encoding_format: 'float'
    }
    | get data.0.embedding
}


def 'nu-complete role' [ctx] {
    let args = $ctx | split row '|' | last | str trim -l | split row ' ' | range 2..
    let len = $args | length
    match $len {
        1 => {
            $env.OPENAI_PROMPT | items {|k, v| {value: $k, description: $v.description? } }
        }
        _ => {
            let role = $env.OPENAI_PROMPT | get $args.0
            let ph = $role.placeholder? | get ($len - 2)
            $ph | columns
        }
    }
}

export def 'ai do' [
    ...args: string@"nu-complete role"
    --out(-o)
    --model(-m): string@"nu-complete models"
    --debug
] {
    let input = if ($in | is-empty) { $args | last } else { $in }
    let argv = if ($in | is-empty) { $args | range 1..<-1 } else { $args | range 1.. }
    let role = $env.OPENAI_PROMPT | get $args.0
    let placehold = $"<(random chars -l 6)>"
    let model = if ($model | is-empty) {
        $role | get model
    } else {
        $model
    }
    let prompt = $role | get prompt | each {|x|
        if ($x | str replace -ar "['\"`]+" '' | $in == '{}') {
            $x | str replace '{}' $placehold
        } else {
            $x
        }
    } | str join (char newline)
    let prompt = $argv | enumerate
    | reduce -f $prompt {|i,a|
        $a | str replace '{}' (($role.placeholder? | get $i.index) | get $i.item)
    }

    $input | ai chat $model -p $placehold --out=$out --debug=$debug $prompt
}
