Working dir task runner, similar to `pwd-module`, but supports completion and description through custom data formats
- `,` or `*` need to be exported in order to use `,` directly
- Directly execute `,` to create a new template file or edit an existing file
- Custom tasks are written in `$env.comma` and can be nested
- Generate completions based on the structure of `$env.comma`
- You can use closure to customize completion
- In `$env.commax.act` of default closure, you can receive parameters after the current position
- In `$env.commax.cmp` , you can receive the parameter before the current position

example:
```
$env.commav = {

}
$env.comma = {
    created: { '2023-12-20[3]16:02:56' }
    hello: {
        $env.commax.act: {|x| print $'hello ($x)' }
        $env.commax.dsc: 'hello (x)'
        $env.commax.cmp: {|args| $args}
    }
    open: {
        $env.commax.sub: {
            any: {
                $env.commax.act: {|x| open $x.0}
                $env.commax.cmp: {ls | get name}
                $env.commax.dsc: 'open a file'
            }
            json: {
                $env.commax.act: {|x| open $x.0}
                $env.commax.cmp: {ls *.json | get name}
                $env.commax.dsc: 'open a json file'
            }
        }
        $env.commax.dsc: 'open a file'
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
