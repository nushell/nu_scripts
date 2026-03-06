# Nushell Advanced Patterns

## Custom Commands with Full Signatures

```nu
def search [
    pattern: string           # required positional
    path?: string             # optional positional
    --case-sensitive(-c)      # boolean flag (defaults false)
    --max-depth(-d): int      # flag with value
    ...extra: string          # rest params
]: nothing -> list<string> {
    # implementation
}
```

### Pipeline Input/Output Types
```nu
def "str stats" []: string -> record {
    let input = $in
    {length: ($input | str length), words: ($input | split words | length)}
}

# Multiple input types
def process []: [string -> record, list -> table] { ... }
```

### Environment-Modifying Commands
```nu
def --env goto [dir: string] {
    cd $dir
    $env.LAST_DIR = (pwd)
}
```

### Wrapped External Commands
```nu
def --wrapped mygrep [...rest] {
    ^grep --color=always ...$rest
}
```

## Modules

```nu
module utils {
    export def double [x: number] { $x * 2 }
    export def triple [x: number] { $x * 3 }
    export-env { $env.UTILS_LOADED = true }
}

use utils double         # import specific command
use utils *              # import all exports
use utils []             # import only environment
```

## Generate (Stateful Sequences)

Closure comes first, initial value second. Returns `{out: value, next: state}`. Omit `next` to stop.

```nu
# Fibonacci
generate {|fib| {out: $fib.0, next: [$fib.1, ($fib.0 + $fib.1)]}} [0, 1] | first 10

# Counter
generate {|i| if $i <= 5 { {out: $i, next: ($i + 1)} }} 0

# With input stream (two-arg closure)
1..5 | generate {|e, sum=0| let sum = $e + $sum; {out: $sum, next: $sum}}
```

## Functional Alternatives to Mutable State

```nu
# Instead of: mut sum = 0; for x in list { $sum += $x }
[1 2 3 4 5] | reduce {|it, acc| $acc + $it}

# With initial value
[2 3 4 5] | reduce --fold 1 {|it, acc| $acc * $it}

# Instead of: mut results = []; for x in list { $results = ($results | append (f $x)) }
$list | each {|x| process $x}

# Instead of: while with mutation
generate {|state| if $state.done { null } else { {out: $state.val, next: (advance $state)} }} $initial
```

## Error Handling

```nu
# Basic try/catch
try { open nonexistent.json } catch {|e| $"Failed: ($e.msg)" }

# With finally (v0.111.0+)
try { do-work } catch {|e| log-error $e.msg } finally { cleanup }

# Custom errors
error make {msg: "Value must be non-negative"}
error make {msg: "Bad value", label: {text: "here", span: (metadata $value).span}}
```

## External Commands

```nu
^external_cmd args              # explicit external invocation
ls | to text | ^grep pattern    # pipe structured data to external
^cmd arg1 arg2 o+e>| str trim  # capture stdout+stderr
^cmd | complete                 # get {exit_code, stdout, stderr} record
$env.LAST_EXIT_CODE             # check last exit code

# External output to structured data
^git log --oneline -5 | lines | parse "{hash} {message}"

# Pipe structured data to external
{data: "value"} | to json | ^curl -X POST -d @- https://api.example.com
```

## Background Jobs

```nu
job spawn { long_running_cmd }                    # returns job ID
job spawn --tag "server" { uvicorn main:app }     # with description
job list                                          # list running jobs
job kill $id                                      # terminate job

# Getting results back via mailbox (main thread = job 0)
job spawn { expensive_calc | job send 0 }; job recv
job spawn { cmd | job send 0 --tag 1 }; job recv --tag 1  # filtered
job recv --timeout 5sec                           # with timeout
```

**Key rules:** `job recv` reads from current job's mailbox only (no job ID arg). Background jobs send to main with `job send 0`. Use `--tag` for filtering.

## Environment & Configuration

```nu
$env.PATH                      # PATH (list with ENV_CONVERSIONS, string otherwise)
$env.Path                      # PATH on Windows
$env.PATH = ($env.PATH | append "/new/path")
$env.MY_VAR = "value"
$env.MY_VAR? | default "fallback"  # safe access with default
hide-env MY_VAR                # unset variable

# Configuration
$env.config.show_banner = false    # set individual config values
$nu.default-config-dir             # config directory path
$nu.home-dir                       # home directory
config nu                          # edit config in $EDITOR
```

## Using nu -c from Bash

```bash
# Simple command
nu -c 'ls | where size > 1mb | to json'

# String interpolation (outer single quotes to avoid $ conflicts)
nu -c 'let x = 42; $"answer: ($x)"'

# Multi-statement
nu -c 'let data = (open file.json); $data | get field'
```

Use single quotes for the outer wrapper since Nushell uses `$` for variables.
