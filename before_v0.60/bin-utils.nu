# bin-utils.nu
def "get bits" [x: int, bits] {
    if $x == 0 {
        $bits
    } else {
        let new-x = ($x / 2 | into int)
        let bit = if $new-x == ($x / 2 | math ceil | into int) {
            0
        } else {
            1
        }

        get bits $new-x ($bits | append $bit)
    }
}

def "get bits2" [x: int] {
    let inp = $in

    if $x != 0 {
        let new-x = ($x / 2 | into int)
        let bit = if $new-x == ($x / 2 | math ceil | into int) {
            0
        } else {
            1
        }

        $inp | append $bit | get bits2 $new-x
    } else {
        $inp
    }
}

export def "into bits" [] {
    let inp = $in
    let span = (metadata $inp).span
    let type = ($inp | describe)

    if "list" in $type {
        $inp | each {
            $it | into bits
        }
    } else if "int" in $type {
        [] | get bits2 $inp
    } else {
        error make {
            msg: "Cannot convert to bits",
            label: {
                text: "This value cannot be converted to bits"
                start: $span.start
                end: $span.end
            }
        }
    }
}

export def "bits into int" [] {
    reverse | reduce -f 0 { 2 * $it.acc + $it.item }
}

export def "test bits" [] {
    0..4 | each {
        let bits = ($it | into bits)
        let res = ($bits | bits into int)
        let span = (metadata $res).span
        if $it == 1 {
            error make {
                msg: "Test mismatch",
                label: {
                    text: $"Expected: ($it), bits: ($bits | str collect ''), result: ($res)"
                    start: $span.start
                    end: $span.end
                }
            }
        }
    } | compact
}