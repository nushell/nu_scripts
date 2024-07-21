# Background tasks with pueue

Makes Nushell "support" background tasks.

## Prerequisite

Install [pueue](https://github.com/Nukesor/pueue) and make sure `pueued` is running and that `pueue` is in `PATH`.

## Usage

You will get tab completions and suggestions when you install the module.
Please check those.

To install the module, copy the `task.nu` to the `$env.NU_LIB_DIRS` directory, then do:

```nu
use task.nu
```

In your Nushell config under `~/.config/nushell`.

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

### How can I reuse custom commands in a background task?

You can define these commands in a separate module, like so:

```nu
# --- in foo.nu ---
export def bar [] { echo bar }

# --- in main.nu ---
task spawn {
  use foo.nu

  foo bar
}
```
## Troubleshooting

- On some setups (e.g. NixOS with `nu` installed as a binary in user's `$HOME`), `sh` (which `pueue` delegates tasks to run) might fail to find `nu` in the `$PATH`. In this case hard-coding the location of your nu binary in the `task spawn` function definition in `task.nu` can solve the issue.
