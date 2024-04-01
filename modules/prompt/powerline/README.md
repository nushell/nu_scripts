### configuration
```
use power/power.nu
    use power/lib/git.nu *
    power inject 0 1 {source: git,   color: '#504945'}
    use power/lib/kube.nu *
    power inject 1 2 {source: kube,  color: '#504945'} {
        context: cyan
    } {
        reverse: true
        separator: '@'
    }
    power set time null { style: compact }
power init
```
or
```
$env.NU_POWER_SCHEMA = [
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

use power/power.nu
    use power/lib/git.nu
    use power/lib/kube.nu
power init
```
`$env.NU_POWER_SCHEMA` support configuring dynamically

## mode
- `$env.NU_POWER_MODE = '<power|fast>'` fast mode and default mode (experimental)
- `$env.NU_POWER_DECORATOR = '<power|plain>'` power mode and plain mode
- `$env.NU_POWER_FRAME = '<default|fill>'` two line prompt (experimental)

### benchmark
```
$env.NU_POWER_BENCHMARK = true
```
Then execute a few commands casually, such as pressing the Enter key continuously.
then execute

```
$env.NU_POWER_MODE = 'fast' # or 'power'
```

Go ahead and press enter,
Execute power timelog to analyze the results.
```
power analyze
```

## todo
- [x] source return `null` for hiding
- [ ] in fast mode, there is still a problem with hideable components on the left
- [x] proxy stat invalid in plain mode
    - '<<' not longer hide separator in `fast` mode
- [ ] implement `power eject`
- [ ] `$env.config.menus[].maker` can be restored
- [x] support color theme
- [x] refactor: theme/decorator/frame/schema

