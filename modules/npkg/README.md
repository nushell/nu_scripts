# nushell pkgs

## Features
- the metadata declaration in a separate `manifest.yml`
- declares dependency in `pkgs` fields
    - require: other npkg
    - use: npkg for build phase
    - include: os, defs, pip, npm, cargo, etc
- custom package declaration in `defs` field
    - update version number in `data.yml '
    - support download, cloning, shell, etc
- support cache and predown
- there are plans to support deletion

## Quick start

update version of asset that need to download
```sh
npkg update
```

download asset and upload
```
npkg download --cache http://file.s/npkg
```

generate sh script
```sh
npkg gensh 'debian' --clean nu nvim exec http
```

execute script
```sh
npkg setup --clean nu nvim exec http
```

