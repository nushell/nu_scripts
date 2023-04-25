### configuration
```
use power.nu
    use power_git.nu
    power inject 0 1 {source: git,   color: '#504945'}
    use power_kube.nu
    power inject 1 2 {source: kube,  color: '#504945'} {
        context: (ansi magenta)
    }
power init
```
or
```
let-env NU_POWER_SCHEMA = [
    [
        {source: pwd,   color: '#353230'}
        {source: git,   color: '#504945'}
    ]
    [
        {source: proxy, color: 'dark_gray'}
        {source: host,  color: '#353230'}
        {source: kube,  color: '#504945'}
        {source: time,  color: '#666560'}
    ]
]

use power.nu
    use power_git.nu
    use power_kube.nu
power init
```
`$env.NU_POWER_SCHEMA` support configuring dynamically

## mode
- `let-env NU_POWER_DECORATOR = '<power|plain>'` power mode and plain mode
- `let-env NU_POWER_FRAME = '<default|fill>'` two line prompt (experimental)

## todo
- [x] source return `$nothing` for hiding
- [ ] proxy stat invalid in plain mode
- [ ] implement `power eject`
- [ ] `$env.config.menus[].maker` can be restored
- [x] support color theme
- [x] refactor: theme/decorator/frame/schema

