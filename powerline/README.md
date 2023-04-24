```
use power.nu *
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

use power.nu *
    use power_git.nu
    use power_kube.nu
power init
```
