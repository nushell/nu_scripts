Working dir task runner, similar to `pwd-module`, but supports completion and description through custom data formats
- `,` or `*` need to be exported in order to use `,` directly
- Directly execute `,` to create a new template file or edit an existing file
- Custom tasks are written in `$env.comma` and can be nested
- Generate completions based on the structure of `$env.comma`
- You can use closure to customize completion
- In `$env.commax.act` of default closure, you can receive parameters after the current position
- In `$env.commax.cmp` , you can receive the parameter before the current position
- Supports `computed`, the definition method refers to `$env.comma_scope.computed`, accepts two parameters, runtime parameters and `$env.comma_scope`
- Supports `filter`, similar to `computed`, but only runs when declared, specified through `$env.comm.flt`
- Supports `watch`, specified through `$env.comm.wth`. Support polling like 'poll:2sec'

example:
```
$env.comma_scope = {
    created: '2023-12-21{4}10:35:31'
    computed: {$env.comm.cpu:{|a, s| $'($s.created)($a)' }}
    say: {|s| print $'(ansi yellow_italic)($s)(ansi reset)' }
    quick: {$env.comm.flt:{|a, s| do $s.say 'run a `quick` filter' }}
    slow: {$env.comm.flt:{|a, s|
        do $s.say 'run a `slow` filter'
        sleep 1sec
        do $s.say 'filter need to be declared'
        sleep 1sec
        $'($s.computed)<($a)>'
    }}
}

$env.comma = {
    created: {|a, s| $s.computed }
    open: {
        $env.comm.sub: {
            any: {
                $env.comm.act: {|a, s| open $a.0}
                $env.comm.cmp: {ls | get name}
                $env.comm.dsc: 'open a file'
            }
            json: {
                $env.comm.act: {|a, s| open $a.0}
                $env.comm.cmp: {ls *.json | get name}
                $env.comm.dsc: 'open a json file'
                $env.comm.wth: '*.json'
            }
            scope: {
                $env.comm.act: {|a, s| print $'args: ($a)'; $s }
                $env.comm.flt: ['slow']
                $env.comm.dsc: 'open scope'
                $env.comm.wth: 'poll:2sec'
            }
        }
        $env.comm.dsc: 'open something'
        $env.comm.flt: ['quick']
    }
    # Nest as you like
    a: {
        b: {
            c: {
                $env.commax.act: {|x| print $x }
                $env.commax.dsc: 'description'
                $env.commax.cmp: {|| ls | get name }
            }
            d: { pwd }
        }
        x: {
            $env.commax.sub: {
                y: {
                    $env.commax.act: {|x| print y}
                    $env.commax.cmp: {|| [y1 y2 y3]}
                    $env.commax.dsc: 'description'
                }
            }
            $env.commax.dsc: 'xxx'
        }
    }
}

```
