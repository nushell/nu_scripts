# Nix

Commands for working with [nix](https://nixos.org/).

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

