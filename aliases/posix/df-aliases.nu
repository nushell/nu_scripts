export def --wrapped df [...rest] {
    ^df ...$rest| from ssv -m 1 |
    update Available {|| ($in | into int ) / 1024 * 1000000 | into filesize} |
    update Used      {|| ($in | into int ) / 1024 * 1000000 | into filesize} |
    update "1K-blocks" {|| ($in | into int ) / 1024 * 1000000 | into filesize} |
    update Use% {|| str trim -rc '%'|into int}
}
