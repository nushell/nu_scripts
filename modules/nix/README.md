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
╭─────────────────┬─────────────┬─────────────┬───────────╮
│     Package     │ Old_Version │ New_Version │   Diff    │
├─────────────────┼─────────────┼─────────────┼───────────┤
│ xwayland        │ ∅           │ 24.1.0      │    5.3 MB │
│ lsp-plugins     │ 1.2.15      │ 1.2.16      │    1.1 MB │
│ libei           │ ∅           │ 1.2.1       │  547.6 KB │
│ libXfont2       │ ∅           │ 2.0.6       │  270.0 KB │
│ xkbcomp         │ ∅           │ 1.4.7       │  235.7 KB │
│ font-util       │ ∅           │ 1.4.1       │  234.1 KB │
│ libxkbfile      │ ∅           │ 1.1.3       │  174.6 KB │
│ xfsprogs        │ 6.6.0       │ 6.8.0       │   61.0 KB │
│ xcb-util-errors │ ∅           │ 1.0.1       │   48.5 KB │
│ libieee1284     │ 0.2.11      │ ∅           │ -123.1 KB │
│ libgnomekbd     │ 3.28.1      │ ∅           │ -702.0 KB │
│ xwayland        │ 24.1.0      │ ∅           │   -5.3 MB │
│ libgweather     │ 4.4.0       │ ∅           │  -23.8 MB │
╰─────────────────┴─────────────┴─────────────┴───────────╯

╭──────┬──────────╮
│ Diff │ -22.0 MB │
╰──────┴──────────╯
```

