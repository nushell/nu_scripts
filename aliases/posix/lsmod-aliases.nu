def --wrapped lsmod [...rest] {
    ^lsmod ...$rest|from ssv -m 1|rename module size n used-by|default '' used-by|update size {|| into int}|update n {|| into int}|update used-by {|| split row ,}
}
