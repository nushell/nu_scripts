Working dir task runner, similar to `pwd-module`, but supports completion and description through custom data formats
- `,` or `*` need to be exported in order to use `,` directly
- Directly execute `,` to create a new template file or edit an existing file
- Custom tasks are written in `$env.comma` and can be nested
- Generate completions based on the structure of `$env.comma`
- You can use closure to customize completion
- In `$env.comm.act` of default closure, you can receive parameters after the current position
- In `$env.comm.cmp` , you can receive the parameter before the current position

example:
```
$env.comma_vars = {
    created: '2023-12-20{3}23:46:07'
    computed: {|a, e| $'($e.created)($a)' }
}

$env.comma = {
    created: {|a, e| $e.computed }
    hello: {
        $env.comm.act: {|args, vars| print $'hello ($args)' }
        $env.comm.dsc: 'hello (x)'
        $env.comm.cmp: {|args, vars| $args}
    }
    open: {
        $env.comm.sub: {
            any: {
                $env.comm.act: {|a, e| open $a.0}
                $env.comm.cmp: {ls | get name}
                $env.comm.dsc: 'open a file'
            }
            json: {
                $env.comm.act: {|a, e| open $a.0}
                $env.comm.cmp: {ls *.json | get name}
                $env.comm.dsc: 'open a json file'
            }
        }
        $env.comm.dsc: 'open a file'
    }
    # Nest as you like
    a: {
        b: {
            c: {
                $env.comm.act: {|x| print $x }
                $env.comm.dsc: 'description'
                $env.comm.cmp: {|| ls | get name }
            }
            d: { pwd }
        }
        x: {
            $env.comm.sub: {
                y: {
                    $env.comm.act: {|x| print y}
                    $env.comm.cmp: {|| [y1 y2 y3]}
                    $env.comm.dsc: 'description'
                }
            }
            $env.comm.dsc: 'xxx'
        }
    }
}

```
