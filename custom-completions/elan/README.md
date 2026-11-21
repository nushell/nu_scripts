# `elan` custom completions

[`elan`](https://github.com/leanprover/elan) is the Lean version manager. This script provides custom completions for
`elan`. It can be used by importing its exported commands via:

```nu
source path/to/elan/elan-completions.nu *
```

With `path/to/` being either the relative path of the file to your current
working directory or its absolute path.

In light of Nushell Issue [#16510](https://github.com/nushell/nushell/issues/16510),
the `--help` (or `-h`) option is intentionally ignored.
