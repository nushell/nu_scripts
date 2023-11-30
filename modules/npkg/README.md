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

## Purpose

the original purpose was to replace the shell script in `Dockerfile`, because shell script was unstructured. it can also be used to manage the operating system.

it is still generating shell scripts, which has the advantage of placing scripts and assets on the http site, then you can setup system through curl without nushell, like `curl http://npkg-site/setup/a,b,c,d | sh` . by adding similar configurations to openresty
```
location ~ /setup/(.*) {
    set $target $1;
    content_by_lua_block {
        local shell = require "resty.shell"
        local host = ngx.var.scheme.."://".. ngx.var.http_host
        local cmd = 'nu npkg.nu setup --config ' .. host
        local ok, stdout, stderr, reason, status = shell.run(cmd..ngx.var.target, nil, 3000, 409600)
        if ok then
            ngx.say(stdout)
            ngx.exit(200)
        else
            ngx.say(stderr)
            ngx.exit(500)
        end
    }
}
```
> http is supported as a cache and assets can be downloaded at once

and there's a very important feature that manifest can be fully customised, for example.
````
- git:
    url: https://github.com/your/nushell-configuration.git
    target: /etc/nushell
````
it's a way to customize a package management system that suits you perfectly.
