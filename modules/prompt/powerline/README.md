### configuration
```
use power.nu
    use power_git.nu
    power inject 0 1 {source: git,   color: '#504945'}
    use power_kube.nu
    power inject 1 2 {source: kube,  color: '#504945'} {
        context: purple
    }
    use power_utils.nu
    power inject 0 1 {source: atuin, color: '#3B4E32'}
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
- `let-env NU_POWER_MODE = '<power|fast>'` fast mode and default mode (experimental)
- `let-env NU_POWER_DECORATOR = '<power|plain>'` power mode and plain mode
- `let-env NU_POWER_FRAME = '<default|fill>'` two line prompt (experimental)

### benchmark
```
let-env NU_POWER_BENCHMARK = true
```
Then execute a few commands casually, such as pressing the Enter key continuously.
then execute

```
let-env NU_POWER_MODE = 'fast' # or 'power'
```

Go ahead and press enter,
Execute power timelog to analyze the results.
```
power analyze
```

## todo
- [x] source return `$nothing` for hiding
- [ ] in fast mode, there is still a problem with hideable components on the left
- [x] proxy stat invalid in plain mode
    - '<<' not longer hide separator in `fast` mode
- [ ] implement `power eject`
- [ ] `$env.config.menus[].maker` can be restored
- [x] support color theme
- [x] refactor: theme/decorator/frame/schema

