use std bench

def "random bytes" [n: int]: nothing -> binary {
    seq 1 ($n / 8 + 1)
        | each { random int }
        | into binary
        | enumerate
        | reduce -f 0x[] {|it, acc|
            $acc | bytes add $it.item
        }
        | first $n
}

let ns = [10, 100, 1_000, 10_000, 100_000]

let report = $ns | each {|n|
    bench { random bytes $n } --rounds 10 --pretty --verbose
} | wrap time | merge ($ns | wrap n)

$report
