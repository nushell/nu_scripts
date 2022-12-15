export def index-need-update [index path] {
    let ts = do -i { ls $path | sort-by modified | reverse | get 0.modified }
    if ($ts | is-empty) { return false }
    let tc = do -i { ls $index | get 0.modified }
    if not (($index | path exists) and ($ts < $tc)) {
        mkdir (dirname $index)
        return true
    }
    return false
}

export def 'str max-length' [] {
    $in | reduce -f 0 {|x, a|
        if ($x|is-empty) { return $a }
        let l = ($x | str length)
        if $l > $a { $l } else { $a }
    }
}

def "nu-complete ssh host" [] {
    rg -LNI '^Host [a-z0-9_\-\.]+' ~/.ssh | lines | each {|x| $x | split row ' '| get 1}
}

export def parse-ssh-file [group] {
    $in
    | parse -r '(?P<k>Host|HostName|User|Port|IdentityFile)\s+(?P<v>.+)'
    | append { k: Host, v: null}
    | reduce -f { rst: [], item: {Host: null} } {|it, acc|
          if $it.k == 'Host' {
              $acc | upsert rst ($acc.rst | append $acc.item)
                   | upsert item { Host : $it.v, HostName: null, Port: null, User: null, IdentityFile: null, Group: $group }
          } else {
              $acc | upsert item ($acc.item | upsert $it.k $it.v)
          }
      }
    | get rst
    | where {|x| not (($x.Host | is-empty) or $x.Host =~ '\*')}
}

export def ssh-list [] {
    rg -L -l 'Host' ~/.ssh
    | lines
    | each {|x| cat $x | parse-ssh-file $x}
    | flatten
}

def fmt-group [p] {
    $p | str replace $"($env.HOME)/.ssh/" ''
}

def "nu-complete ssh" [] {
    let cache = $'($env.HOME)/.cache/nu-complete/ssh.json'
    if index-need-update $cache ~/.ssh/**/* {
        let data = (ssh-list | each {|x|
                let uri = $"($x.User)@($x.HostName):($x.Port)"
                {
                    value: $x.Host,
                    uri: $uri,
                    group: $"(fmt-group $x.Group)",
                    identfile: $x.IdentityFile,
                }
        })

        let max = {
            value: ($data.value | str max-length),
            uri: ($data.uri | str max-length),
            group: ($data.group | str max-length),
            identfile: ($data.identfile | str max-length),
        }

        {max: $max, completion: $data} | save $cache
    }

    let d = (cat $cache | from json)

    $d
    | get completion
    | each { |x|
        let uri = ($x.uri | str lpad -l $d.max.uri -c ' ')
        let group = ($x.group | str rpad -l $d.max.group -c ' ')
        let id = ($x.identfile | str rpad -l $d.max.identfile -c ' ')
        {value: $x.value, description: $"\t($uri) ($group) ($id)" }
    }
}

export extern ssh [
    host: string@"nu-complete ssh"      # host
    ...cmd                              # cmd
    -v                                  # verbose
    -i: string                          # key
    -p: int                             # port
    -N                                  # n
    -T                                  # t
    -L                                  # l
    -R                                  # r
    -D                                  # d
    -J: string                          # j
    -W: string                          # w
]
