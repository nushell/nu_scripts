# Comma, task and test runner of nu script

Working dir task runner, similar to `pwd-module`, but supports completion and description through custom data formats

## Quick Start
`,` or `*` need to be exported in order to use `,` Directly

```
use comma/main.nu *
use comma/utils.nu *
```

When you enter a directory, if a `,.nu` file exists, it will be loaded. (Currently you need to press the Enter key again to take effect)

Or `source` any file that defines `$env.comma_scope` and `$env.comma` variables

If there is no `,.nu` file in the current directory, executing `,` without arguments will create a new one from the template. If the file exists, edit it

### Task Definition
Tasks are written in `$env.comma` and can be nested, and no spaces allowed in name (except testing).

The nodes of the tree can be ordinary records, and the tasks are defined in the closure of the leaf nodes.

This tree will be traversed during completion. For tasks, you can customize the completion behavior.

Customize completion behavior, as well as descriptions, filters, watches, tests, etc. Need to add some special attributes to the record, such as `$_.children`, `$_.action`, `$_.completion` (so `$env.comma` and `$env.comma_scope` accepts a closure to avoid potential naming conflicts).

```
$env.comma = {|_|{
    dev: {
        run: {
            $_.action: {|a,s| nu $a.0 }
            $_.watch: { glob: '*.nu', clear: true }
            $_.completion: { ls *.nu | get name }
            $_.desc: "develop a nu script"
        }
    }
}}
```

These attributes support aliases like:

|  attribute  |      alias     |
|-------------|----------------|
| children    | sub, s         |
| description | desc, dsc, d   |
| action      | act, a         |
| completion  | cmp, c         |
| filter      | flt, f         |
| computed    | cpu, u         |
| watch       | wth, w         |
| tag         |                |
| expect      | exp, e, x      |
| mock        | test_args, m   |
| report      | rpt, r         |

The closure of the task's `action`, `completion` accepts two parameters, the rest arguments after the breadcrumbs and `$env.comma_scope`.

`computed` and `filter` are defined in `$env.comma_scope` which is used to share data, alse accept these two parameters.

`computed` is calculated in the defined order and replaced with the result.
```
$env.comma_scope = {|_|{
    hello: 'hello'
    greet: {$_.computed:{|a, s| $'($s.hello): ($a)' }}
}}
```

`filter` is called when it is declared. If a record is returned, it will be merged back to the $env.comma_scope.
```
$env.comma_scope = {|_|{
    log: {$_.filter:{|a, s| do $_.tips 'run filter' `foo` }}
}}

$env.comma = {|_|{
    foo: {
        $_.sub: {
            bar: {
                $_.action: { echo 'hello' }
                $_.filter: ['log']
            }
        }
        $_.filter: ['log']
    }
}}
```

#### Dry run
If execute the command in `$_.action` with `pp`, and pass `--print` flag with `,`, only prints the arguments received by `pp` without actually executing it.

`pp` can be run alone with flag `--print`.
```
pp --print aaa bbbb ccccc dddddd eeeeee  [
    ffffff gggggggggg [
        hhhhhhhhh iiiiiiiiii lllllllll
    ] mmmmmmmmmmmmm nnnnnnnnnnnn
    aaaaaaaaaaaaaaa
    xxxxxxxxxxxxxxxx
    yyyyyyyyyyyyyyyy
    zzzzzzzzzzzzzzz
    jjjjjjjjjjjjj
] oooooooo ppppppppp [qqqqqq [rrrrrr ssssss tttttt] uuuuuu]
```

### Watch and polling
If `$_.watch` is defined and run with `--watch` flag, it will be run in watch mode.
```
$env.comma = {|_|{
    foo: {
        $_.watch: {
            glob: '*'
            op: ['Write', 'Create']
            postpone: true
        }
    }
}}
```
- `glob` defaults to `*`, `op` defaults to `['Write']`, `postpone` defaults to `false`
- In watch mode (not Polling) inject `$_.watch`(op, path, new_path) into parameter `$s`
- when the `interval` field is included, it is polling mode(`clear` defaults to 'false')

### Test
If run with the `--test` flag, it will detect that all nodes with `$_.expect` under the current and run their actions.

If there is also the --watch flag, it will run in watch mode without defining `$_.watch`.

If `$_.mock` exists, it will be passed as arguments to the `$_.action` and `$_.expect`.

If `$_.expect` is closure, pass it the result of `$_.action`, rest arguments and `$_.comma_scope`, if return True and the test passes.

If `$_.expect` is list, will use the closures in it as a set of tests.

If `$_.expect` is a scalar, it is compared directly with the result of actions.

If `$_.report` exists and the test fails, execute `$_.report` (has a predefined report  `$_.diff`)

### vscode-tasks
The default template contains `vscode-tasks` and outputs a `.vscode/tasks.json`.

```
$env.comma = {|_|{
    vscode-tasks: {
        $_.a: {
            mkdir .vscode
            ', --vscode -j' | do $_.batch ',.nu' | save -f .vscode/tasks.json
        }
        $_.d: "generate .vscode/tasks.json"
        $_.w: { glob: ',.nu' }
    }
}}
```
> requires `augustocdias.tasks-shell-input` to run `$_.completion` closure.

## variables
### $_.wd
### $_.distro
## tips

### outdent
### ll & spy
### T, F, I & diff
### docker image template
```
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
```


## todo
- [x] run
    - [x] dry
        - [x] dry wrap lines
        - [x] accept list<string>
    - [x] formatter: outdent
- [x] complete
    - [x] with args
- [x] scoped test
    - [x] pass scoped
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
- [ ] template
    - [x] vscode-tasks
    - [ ] should panic when identity not exists
- [ ] integration
    - [x] gen vscode task json file
        - [x] tree map
        - [x] batch mode
            - [x] run complete in batch mode
        - [x] Input variables
            - [ ] pickString
            - [x] augustocdias.tasks-shell-input
            - [x] allow rest args as `promptString`
        - [x] clean filter output
        - [x] add gen vscode-tasks to template
        - [ ] test and watch
- [x] modulize
    - [x] refactor with `resolve node`
        - [x] run
        - [x] complete
            - [x] fix redundant filter in description
- [x] theme
    - [x] poll sep bar
    - [x] tips
