$env.comma_scope = {|_|{
    created: '{{time}}'
    computed: {$_.computed:{|a, s| $'($s.created)($a)' }}
    log_args: {$_.filter:{|a, s| do $_.tips 'received arguments' $a }}
}}

$env.comma = {|_|{
    created: {|a, s| $s.computed }
    inspect: {|a, s| {index: $_, scope: $s, args: $a} | table -e }
    vscode-tasks: {
        $_.a: {
            mkdir .vscode
            ', --vscode -j' | do $_.batch ',.nu' | save -f .vscode/tasks.json
        }
        $_.d: "generate .vscode/tasks.json"
        $_.w: { glob: ',.nu' }
    }
    dev: {
        run: {
            $_.action: {|a,s| nu $a.0 }
            $_.watch: { glob: '*.nu', clear: true }
            $_.completion: { ls *.nu | get name }
            $_.desc: "develop a nu script"
        }
        build: {
            image: {
                $_.a: {|a,s|
                    ^$env.docker-cli pull $a.0
                    let tmp = mktemp
                    $"
                    FROM ($a.0)

                    RUN apt update \\
                     && apt-get upgrade -y \\
                     && DEBIAN_FRONTEND=noninteractive \\
                        apt-get install -y --no-install-recommends \\
                            curl ca-certificates \\
                     && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* \\
                     && curl -sSL ($a.2) | tar zxf - -C /opt/vendor \\
                     && chown -R 33:33 /opt/vendor"
                    | do $_.outdent
                    | save -f $tmp

                    ^$env.docker-cli build -f $tmp -t $a.1 .
                    rm -f $tmp
                    ^$env.docker-cli push $a.1
                }
                $_.c: {|a,s|
                    let l = $a | length
                    if $l < 1 {
                        ['ubuntu', 'alpine', 'nginx']
                    } else if $l < 2 {
                        ['target']
                    } else {
                        ['vendor']
                    }
                }
                $_.d: 'build docker image'
                $_.f: ['log_args']
            }
        }
    }
}}
