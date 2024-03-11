```
use resolvenv.nu
resolvenv select wlan0 [
    [{screen: {port: 'hdmi'}, wifi: 'pandorabox'}, {
        NEOVIM_LINE_SPACE: '2'
        NEOVIDE_SCALE_FACTOR: '0.7'
    }]
    [{screen: {port: 'dp-2'}}, {
        NEOVIM_LINE_SPACE: '2'
        NEOVIDE_SCALE_FACTOR: '0.5'
    }]
    [_, { print $in }]
]
```
