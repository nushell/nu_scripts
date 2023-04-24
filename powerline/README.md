```
use power.nu *

    use power_git.nu *
    power inject 0 1 {source: git,   power: '#504945'}

    use power_kube.nu *
    power inject 1 2 {source: kube power: '#504945'}

power init
```
