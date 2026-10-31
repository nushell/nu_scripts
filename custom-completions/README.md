# Custom completions

This current directory provides custom completions. They can be used by importing their exported commands via:

```nushell
use path/to/<command>/<command>-completions.nu *
# or
source path/to/<command>/<command>-completions.nu
# without the `*` at the end
```

With `path/to/<command>` being either the relative path of the file to your current working directory or its absolute path.

Bear in mind that if you import the `use <path> *`, it is important that you don't name a function with the same name of the file

```nu
# file: rustup.nu 

export extern rustup [
    ...args
]
```
`use ./rustup.nu *` won't work here

## For packagers

Preferred layout per tool:

```text
custom-completions/<tool>/
  readme.md
  <tool>-completions.nu
```

Pin a git revision and path into that folder (or the whole tree). Prefer stable directory names; renames break links and package ids. This repo does not host release zip/tar assets for these trees.
