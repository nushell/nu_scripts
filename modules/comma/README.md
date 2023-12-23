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
- Supports `watch` (and polling), specified through `$env.comm.wth`.
    - `glob` defaults to `*`, `op` defaults to `['Write']`
    - In watch mode (not Polling) inject `$env.comm.wth`(op, path, new_path) into parameter `s`
    - when the `interval` field is included, it is polling mode(`clear` defaults to 'false')


example:
```
$env.comma_scope = {|_|{
    created: '2023-12-21{4}22:26:47'
    computed: {$_.cpu:{|a, s| $'($s.created)($a)' }}
    say: {|s| print $'(ansi yellow_italic)($s)(ansi reset)' }
    quick: {$_.flt:{|a, s| do $s.say 'run a `quick` filter' }}
    slow: {$_.flt:{|a, s|
        do $s.say 'run a `slow` filter'
        sleep 1sec
        do $s.say 'filter need to be declared'
        sleep 1sec
        $'($s.computed)<($a)>'
    }}
}}

$env.comma = {|_|{
    created: {|a, s| $s.computed }
    open: {
        $_.sub: {
            any: {
                $_.act: {|a, s| open $a.0}
                $_.cmp: {ls | get name}
                $_.dsc: 'open a file'
            }
            json: {
                $_.act: {|a, s| $s | get $_.wth }
                $_.cmp: {ls *.json | get name}
                $_.dsc: 'open a json file'
                $_.wth: {
                    glob: '*.json'
                    op: ['Write', 'Create']
                }
            }
            scope: {
                $_.act: {|a, s| print $'args: ($a)'; $s }
                $_.flt: ['slow']
                $_.dsc: 'open scope'
                $_.wth: {
                    interval: 2sec
                }
            }
        }
        $_.dsc: 'open something'
        $_.flt: ['quick']
    }
    # Nest as you like
    a: {
        b: {
            c: {
                $_.act: {|x| print $x }
                $_.dsc: 'description'
                $_.cmp: {|| ls | get name }
            }
            d: { pwd }
        }
        x: {
            $_.sub: {
                y: {
                    $_.act: {|x| print y}
                    $_.cmp: {|| [y1 y2 y3]}
                    $_.dsc: 'description'
                }
            }
            $_.dsc: 'xxx'
        }
    }
}}
```
