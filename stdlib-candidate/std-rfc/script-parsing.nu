# #!/usr/bin/env nu
#
# def main [x: list<int>] {
#     print $x
# }
#
# #!/usr/bin/env nu
#
# def main [
#     x: string, # list<int>
# ] {
#     let x = $x | parse-arg (metadata $x).span "list<int>"
#     print $x
# }
export def parse-arg [
    span: record<start: int, end: int>, # the span of the input variable
    expected_type: string, # the expected type for the input variable
]: [ string -> any ] {
    let val = try {
        $in | from nuon
    } catch {
        error make {
            msg: "invalid NUON",
            label: {
                text: "invalid NUON",
                span: $span,
            },
        }
    }

    if ($val | describe) != $expected_type {
        error make {
            msg: "bad type",
            label: {
                text: $"type: ($val | describe)",
                span: $span,
            },
            help: $"expected ($expected_type)",
        }
    }

    $val
}
