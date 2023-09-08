def main [n: int]: nothing -> binary {
    seq 1 ($n / 8 + 1)
        | each { random integer }
        | into binary
        | enumerate
        | reduce -f 0x[] {|it, acc|
            $acc | bytes add $it.item
        }
        | first $n
}
