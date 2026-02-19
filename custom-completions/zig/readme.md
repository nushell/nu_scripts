# `zig` custom completions

This script provides custom completions for `zig` and `zvm`.
It can be used by importing its exported commands via:

```
use path/to/zig/zig-completions.nu *
```

With `path/to/` being either the relative path of the file to your current working directory or its absolute path.

The completion for `zig build` has a side-effect of rebuilding the build script to list the configured build steps.
