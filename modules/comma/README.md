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
    created: '2023-12-24{0}01:46:27'
    computed: {$_.computed:{|a, s| $'($s.created)($a)' }}
    say: {|s| print $'(ansi $_.settings.theme.info)($s)(ansi reset)' }
    quick: {$_.filter:{|a, s| do $s.say 'run a `quick` filter' }}
    slow: {$_.filter:{|a, s|
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
                $_.action: {|a, s| $s | get $_.watch }
                $_.completion: {ls *.json | get name}
                $_.desc: 'inspect watch context'
                $_.watch: {
                    glob: '*'
                    op: ['Write', 'Create']
                    postpone: true
                }
            }
            open_file: {
                $_.action: {|a, s| open $a.0 }
                $_.completion: {ls | get name}
                $_.desc: 'open a file'
                $_.filter: ['slow']
            }
            ping: {
                $_.action: {|a, s| ping -c 2 localhost }
                $_.watch: {
                    interval: 2sec
                    clear: true
                }
            }
        }
        $_.desc: 'run test'
        $_.filter: ['quick']
    }
}}
```

### todo
- [ ] scoped test
    - [ ] tree map
    - [x] test
- [ ] gen vscode task json file
    - [ ] tree map
    - [x] batch mode
    - [ ] shell input
- [x] resolve-node
- [x] theme
    - [x] poll sep bar
