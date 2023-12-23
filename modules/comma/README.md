Working dir task runner, similar to `pwd-module`, but supports completion and description through custom data formats
- `,` or `*` need to be exported in order to use `,` directly
- Directly execute `,` to create a new template file or edit an existing file
- Custom tasks are written in `$env.comma` and can be nested
- Generate completions based on the structure of `$env.comma`
- You can use closure to customize completion
- In `$_.act` of default closure, you can receive parameters after the current position
- In `$_.cmp` , you can receive the parameter before the current position
- Supports `computed`, the definition method refers to `$env.comma_scope.computed`, accepts two parameters, runtime parameters and `$env.comma_scope`
- Supports `filter`, similar to `computed`, but only runs when declared, specified through `$_.flt`
- Supports `watch` (and polling), specified through `$_.wth`.
    - `glob` defaults to `*`, `op` defaults to `['Write']`, `postpone` defaults to `false`
    - In watch mode (not Polling) inject `$_.wth`(op, path, new_path) into parameter `$s`
    - when the `interval` field is included, it is polling mode(`clear` defaults to 'false')
- Identity supports alias
  - children sub
  - description desc dsc
  - action act
  - completion cmp
  - filter flt
  - computed cpu
  - watch wth
  - expect exp


example:
```
$env.comma_scope = {|_|{
    created: '2023-12-23{6}11:09:04'
    computed: {$_.cpu:{|a, s| $'($s.created)($a)' }}
    say: {|s| print $'(ansi $_.settings.theme.info)($s)(ansi reset)' }
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
    inspect: {|a, s| {index: $_, scope: $s, args: $a} | table -e }
    test: {
        $_.sub: {
            batch: { 'created; inspect' | do $_.batch }
            watch: {
                $_.act: {|a, s| $s | get $_.wth }
                $_.cmp: {ls *.json | get name}
                $_.dsc: 'inspect watch context'
                $_.wth: {
                    glob: '*'
                    op: ['Write', 'Create']
                    postpone: true
                }
            }
            open_file: {
                $_.act: {|a, s| open $a.0 }
                $_.cmp: {ls | get name}
                $_.dsc: 'open a file'
                $_.flt: ['slow']
            }
            ping: {
                $_.act: {|a, s| ping -c 2 localhost }
                $_.wth: {
                    interval: 2sec
                    clear: true
                }
            }
        }
        $_.dsc: 'run test'
        $_.flt: ['quick']
    }
}}
```

### todo
- [ ] resolve-node
- [ ] theme
    - [ ] poll sep bar
