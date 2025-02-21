# Zig Version Manager (zvm)

Manage several versions of [Zig](https://ziglang.org/) using your favorite shell.

## Dependencies

- [ouch](https://github.com/ouch-org/ouch)
- [minisign](https://github.com/jedisct1/minisign)

## Install and setup

Clone this repo or copy the `zvm.nu` file wherever you prefer to keep your Nushell scripts.

Edit your Nushell config file (`$nu.config-path`) and add the line:

```nu
use `~/.config/nushell/scripts/zvm.nu` *
```

List available Zig versions:

```nu
zvm list
```

**Install** a specific version:

```nu
zvm install master
```

At this point, the nightly build of Zig should be installed in `~/.local/share/zvm/`.

You can then **use** this version:

```nu
zvm use master
```

A symlink to Zig’s binary is created in the zvm folder: `~/.local/share/zvm/zig`.  
Add this to your `$env.PATH` to make zig accessible.

## Roadmap

- [zls](https://github.com/zigtools/zls) support
