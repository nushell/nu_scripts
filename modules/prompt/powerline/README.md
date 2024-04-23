### configuration
```
use power/power.nu
    use power/plugin/git.nu *
    power inject 0 1 {source: git,   color: '#504945'}
    use power/plugin/kube.nu *
    power inject 1 2 {source: kube,  color: '#504945'} {
        theme: {
            context: cyan
        }
        config: {
            reverse: true
            separator: '@'
        }
    }
    power set time {
        config: { style: compact }
    }
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
    use power/plugin/git.nu
    use power/plugin/kube.nu
power init
```
`$env.NU_POWER_SCHEMA` support configuring dynamically

## mode
- `$env.NU_POWER_DECORATOR = '<power|plain>'` power mode and plain mode
- `$env.NU_POWER_FRAME = '<default|fill>'` two line prompt (experimental)

### benchmark
```
$env.NU_POWER_BENCHMARK = true
```
Then execute a few commands casually, such as pressing the Enter key continuously.
then execute

Execute power timelog to analyze the results.
```
power analyze
```

## todo
- [x] source return `null` for hiding
- [x] proxy stat invalid in plain mode
- [ ] implement `power eject`
- [ ] `$env.config.menus[].maker` can be restored
- [x] support color theme
- [x] refactor: theme/decorator/frame/schema

