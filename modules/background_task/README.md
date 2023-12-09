# Background tasks with pueue

Makes Nushell "support" background tasks.

## Prerequisite

Install [pueue](https://github.com/Nukesor/pueue) and make sure `pueued` is running and that `pueue` is in `PATH`.

## Usage

You will get tab completions and suggestions when you insall the module.
Please check those.

## Q&A

### How can I pass data to a background task?

You can use environment variables, since they
are inherited from the parent when spawning a process.

```nu
$env.FOO = 123

task spawn {
  echo $env.FOO
}
```

If you want to pass serialized data, you can do this:

```nu
let foo = { a: 1 b: 2 c: 3 }

with-env { FOO: ($foo | to json) } {
  task spawn {
    let foo = ($env.FOO | from json)

    echo $foo
  }
}
```

## How can I reuse custom commands in a background task?

You can define these commands in a seperate module, like so:

```nu
# --- in foo.nu ---
export def bar [] { echo bar }

# --- in main.nu ---
task spawn {
  use foo.nu

  foo bar
}
```
