Working dir task runner, similar to `pwd-module`, but supports completion and description through custom data formats
- `,` or `*` need to be exported in order to use `,` directly
- Directly execute `,` to create a new template file or edit an existing file
- Custom tasks are written in `$env.comma` and can be nested
    - no spaces allowed in name (except testing)
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
    - children sub s
    - description desc dsc d
    - action act a
    - completion cmp c
    - filter flt f
    - computed cpu u
    - watch wth w
    - tag
    - expect exp e x
    - mock test_args m
    - report rpt r


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
- [x] complete
    - [x] with args
- [x] scoped test
    - [x] tree map
    - [x] test
    - [ ] tag
    - [ ] watch mode
        - [x] override sub node watch
    - [x] args
    - [x] allow running on leaf node
    - [x] test action
        - [x] scope
        - [ ] filter
    - [x] support many expect (list) for one spec
    - [ ] curl integration
    - [ ] report
        - [x] `$x.report` in `test_message` should be `list<string>`
        - [x] diff
    - [ ] run with `nu -c` (dynamic source nu file)
- [ ] gen vscode task json file
    - [x] tree map
    - [x] batch mode
        - [x] run complete in batch mode
    - [ ] augustocdias.tasks-shell-input
- [x] refactor with `resolve node`
    - [x] run
    - [x] complete
        - [x] fix redundant filter in description
- [x] theme
    - [x] poll sep bar
    - [x] tips
