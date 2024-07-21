# Nix

Commands for working with [nix/nixos](https://nixos.org/).

### ns
Shorthand search (`nix search nixpkgs ...`) with much nicer output.
```shell
❯ > nix search nixpkgs diesel
* legacyPackages.x86_64-linux.diesel-cli (2.1.0)
  Database tool for working with Rust projects that use Diesel

* legacyPackages.x86_64-linux.diesel-cli-ext (0.3.13)
  Provides different tools for projects using the diesel_cli
```
```shell
❯ > ns diesel
╭───┬────────────────┬──────────────────────────────────────────────────────────────┬─────────╮
│ # │    package     │                         description                          │ version │
├───┼────────────────┼──────────────────────────────────────────────────────────────┼─────────┤
│ 0 │ diesel-cli     │ Database tool for working with Rust projects that use Diesel │ 2.1.0   │
│ 1 │ diesel-cli-ext │ Provides different tools for projects using the diesel_cli   │ 0.3.13  │
├───┼────────────────┼──────────────────────────────────────────────────────────────┼─────────┤
│ # │    package     │                         description                          │ version │
╰───┴────────────────┴──────────────────────────────────────────────────────────────┴─────────╯
```

### activation-script

Shows changed packages after running `nixos-rebuild switch/boot` and change in total size of installed packages. Changes that don't affect the installed size are filtered out. Intended to be added to `configuration.nix` of `NixOS`.

```
╭────┬──────────────────┬───────────────────────┬────────┬────────────╮
│  # │     Package      │          Old          │  New   │    Diff    │
├────┼──────────────────┼───────────────────────┼────────┼────────────┤
│  0 │ nushell          │ 0.94.1                │ 0.95.0 │  192.1 KiB │
│  1 │ hyprland         │ 0.41.1                │ 0.41.2 │   52.9 KiB │
│  2 │ qtdeclarative    │ 6.7.1                 │ 6.7.2  │   36.2 KiB │
│  3 │ linux            │ 6.9.6                 │ 6.9.7  │   17.7 KiB │
│  4 │ qtbase           │ 6.7.1                 │ 6.7.2  │   16.1 KiB │
│  5 │ networkmanager   │ 1.48.0                │ 1.48.2 │    8.3 KiB │
│  6 │ wireplumber      │ 0.5.3                 │ 0.5.4  │  -21.4 KiB │
│  7 │ libbacktrace     │ 0-unstable-2024-03-02 │ ∅      │ -110.4 KiB │
│  8 │ woff2            │ 1.0.2                 │ ∅      │ -155.5 KiB │
│  9 │ libmanette       │ 0.2.7                 │ ∅      │ -226.0 KiB │
│ 10 │ webkitgtk        │ 2.44.2+abi=6.0        │ ∅      │ -147.6 MiB │
│ 11 │ telegram-desktop │ 5.1.8                 │ ∅      │ -219.4 MiB │
│ 12 │                  │                       │        │            │
│ 13 │                  │                       │ Total: │ -367.2 MiB │
╰────┴──────────────────┴───────────────────────┴────────┴────────────╯
```

