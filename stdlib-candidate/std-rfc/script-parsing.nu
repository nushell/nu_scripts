# helps parsing CLI arguments for Nushell scripts
#
# the following Nushell script does not make sense to be used as an external
# command because there is no such thing as a `list<string>` in Bash for
# instance.
# ```nushell
# def main [x: list<int>] {
#     print $x
# }
# ```
#
# one needs to write something less strict at parse-time and thus looses type
# information...
# ```nushell
# def main [
#     x: string, # list<int>
# ] {
#     print $x
# }
# ```
#
# it's possible to write a much stronger script whith `parse-arg`
# ```nushell
# def main [
#     x: string, # list<int>
# ] {
#     let x = $x | parse-arg (metadata $x).span "list<int>" # the script would crash if either
#                                                           # `$x: string` is not valid NUON or if
#                                                           # the resulting value is not a `list<int>`
#     print $x                                              # here, `$x` is a `list<int>` as intended
# }
# ```
export def parse-arg [
    span: record<start: int, end: int>, # the span of the input variable
    expected_type: string, # the expected type for the input variable
]: [ string -> any ] {
    let val = try {
        $in | from nuon
    } catch {
        error make {
            msg: $"(ansi red_bold)invalid NUON(ansi reset)",
            label: {
                text: "invalid NUON",
                span: $span,
            },
        }
    }

    if ($val | describe) != $expected_type {
        error make {
            msg: $"(ansi red_bold)bad type(ansi reset)",
            label: {
                text: $"type: ($val | describe)",
                span: $span,
            },
            help: $"expected ($expected_type)",
        }
    }

    $val
}
