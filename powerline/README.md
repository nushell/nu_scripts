### configuration
```
use power.nu
    use power_git.nu
    power inject 0 1 {source: git,   power: '#504945'}
    use power_kube.nu
    power inject 1 2 {source: kube,  power: '#504945'}
power init
```
or
```
let-env NU_PROMPT_SCHEMA = [
    [
        {source: pwd,   power: '#353230'}
        {source: git,   power: '#504945'}
    ]
    [
        {source: proxy, power: 'dark_gray'}
        {source: host,  power: '#353230'}
        {source: kube,  power: '#504945'}
        {source: time,  power: '#666560'}
    ]
]

use power.nu
    use power_git.nu
    use power_kube.nu
power init
```
`$env.NU_PROMPT_SCHEMA` support configuring dynamically

## mode
- `let-env NU_POWERLINE = true|false` power mode and plain mode
- `let-env NU_UPPROMPT = <no empty>` two line prompt (experimental)

## todo
- [ ] proxy stat invalid in plain mode
- [ ] implement `power eject`
- [ ] `$env.config.menus[].maker` can be restored
- [ ] support colorschema

