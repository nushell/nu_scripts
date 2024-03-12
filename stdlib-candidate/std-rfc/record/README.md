# Record module

A module to manipulate nu's records.

## `record list merge`

### Input/output types:

|#|input|output|
|-|-|-|
|1|list\<record>|record|

### Example

```nu
> [{a:1} {b:2} {c:3}] | record list merge 
╭───┬───╮
│ a │ 1 │
│ b │ 2 │
│ c │ 3 │
╰───┴───╯
```

## `record filter-name predicate`

Filter a record by validating fields name with a predicate.

### Input/output types:

|#|input|output|
|-|-|-|
|1|record|record|

## Arguments

* `pred`: Predicate closure that checks fields name

### Example

```nu
> $env | record filter-name predicate { $in | str contains VS}
╭───────────────────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ VSCODE_GIT_ASKPASS_EXTRA_ARGS │ --ms-enable-electron-run-as-node                                                                                      │
│ VSCODE_GIT_ASKPASS_MAIN       │ /Applications/Visual Studio Code.app/Contents/Resources/app/extensions/git/dist/askpass-main.js                       │
│ VSCODE_GIT_ASKPASS_NODE       │ /Applications/Visual Studio Code.app/Contents/Frameworks/Code Helper (Plugin).app/Contents/MacOS/Code Helper (Plugin) │
│ VSCODE_GIT_IPC_HANDLE         │ /var/folders/_x/25cgjd3n2sn62x6jfc9ccjjw0000gn/T/vscode-git-56538693f8.sock                                           │
╰───────────────────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## `record filter-name text`

Filter a record by validating fields name with text.

### Input/output types:

|#|input|output|
|-|-|-|
|1|record|record|

## Arguments

* `filter`: Text to match with
* `--regex(-r)`: Match by regex

### Examples

```nu
> $env | record filter-name text VS
╭───────────────────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│ VSCODE_GIT_ASKPASS_EXTRA_ARGS │ --ms-enable-electron-run-as-node                                                                                      │
│ VSCODE_GIT_ASKPASS_MAIN       │ /Applications/Visual Studio Code.app/Contents/Resources/app/extensions/git/dist/askpass-main.js                       │
│ VSCODE_GIT_ASKPASS_NODE       │ /Applications/Visual Studio Code.app/Contents/Frameworks/Code Helper (Plugin).app/Contents/MacOS/Code Helper (Plugin) │
│ VSCODE_GIT_IPC_HANDLE         │ /var/folders/_x/25cgjd3n2sn62x6jfc9ccjjw0000gn/T/vscode-git-56538693f8.sock                                           │
╰───────────────────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯

> $env | record filter-name text --regex V.*S
╭───────────────────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╮
│                               │ ╭──────┬──────────────────────────────────╮                                                                           │
│ ENV_CONVERSIONS               │ │      │ ╭─────────────┬────────────────╮ │                                                                           │
│                               │ │ PATH │ │ from_string │ <Closure 1399> │ │                                                                           │
│                               │ │      │ │ to_string   │ <Closure 1401> │ │                                                                           │
│                               │ │      │ ╰─────────────┴────────────────╯ │                                                                           │
│                               │ │      │ ╭─────────────┬────────────────╮ │                                                                           │
│                               │ │ Path │ │ from_string │ <Closure 1403> │ │                                                                           │
│                               │ │      │ │ to_string   │ <Closure 1405> │ │                                                                           │
│                               │ │      │ ╰─────────────┴────────────────╯ │                                                                           │
│                               │ ╰──────┴──────────────────────────────────╯                                                                           │
│ LC_TERMINAL_VERSION           │ 3.4.22                                                                                                                │
│ NU_VERSION                    │ 0.87.0                                                                                                                │
│ PROMPT_INDICATOR_VI_INSERT    │ <Closure 1395>                                                                                                        │
│ TERM_PROGRAM_VERSION          │ 1.84.2                                                                                                                │
│ VSCODE_GIT_ASKPASS_EXTRA_ARGS │ --ms-enable-electron-run-as-node                                                                                      │
│ VSCODE_GIT_ASKPASS_MAIN       │ /Applications/Visual Studio Code.app/Contents/Resources/app/extensions/git/dist/askpass-main.js                       │
│ VSCODE_GIT_ASKPASS_NODE       │ /Applications/Visual Studio Code.app/Contents/Frameworks/Code Helper (Plugin).app/Contents/MacOS/Code Helper (Plugin) │
│ VSCODE_GIT_IPC_HANDLE         │ /var/folders/_x/25cgjd3n2sn62x6jfc9ccjjw0000gn/T/vscode-git-56538693f8.sock                                           │
╰───────────────────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────╯
```

## `record filter-value predicate`

Filter a record by validating fields value with predicate.

### Input/output types:

|#|input|output|
|-|-|-|
|1|record|record|

## Arguments

* `pred`: Predicate closure that checks fields value

### Example

```nu
> {a:1 b:2 c:3 d:4} | record filter-value predicate { $in mod 2 == 0 }
╭───┬───╮
│ b │ 2 │
│ d │ 4 │
╰───┴───╯
```