$env.comma_scope = {|_|{
    created: '{{time}}'
    computed: {$_.computed:{|a, s| $'($s.created)($a)' }}
    log_args: {$_.filter:{|a, s| do $_.tips 'received arguments' $a }}
}}

$env.comma = {|_|{
    created: {|a, s| $s.computed }
    inspect: {|a, s| {index: $_, scope: $s, args: $a} | table -e }
    vscode-tasks: {
        $_.action: {
            mkdir .vscode
            ', --vscode -j' | do $_.batch ',.nu' | save -f .vscode/tasks.json
        }
        $_.desc: "generate .vscode/tasks.json"
        $_.watch: { glob: ',.nu' }
    }
    start: {
        do $_.log 1 'start'
    }
    stop: {
        l1 'stop'
    }
    dev: {
        nu: {
            $_.action: {|a,s| nu $a.0 }
            $_.watch: { glob: '*.nu', clear: true }
            $_.completion: { ls *.nu | get name }
            $_.desc: "develop a nu script"
        }
    }
}}
