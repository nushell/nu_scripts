# A proposal for improving the original `std bench` command by @amtoine
# https://github.com/nushell/nushell/blob/31f3d2f6642b585f0d88192724723bf0ce330ecf/crates/nu-std/std/mod.nu#L134

use ./math

# convert an integer amount of nanoseconds to a real duration
def "from ns" [
    --sign-digits: int = 4 # a number of first non-zero digits to keep (default 4; set 0 to disable rounding)
] {
    if $sign_digits == 0 {} else {
        math significant-digits $sign_digits
    }
    | $"($in)ns"
    | into duration
}

# run a piece of `nushell` code multiple times and measure the time of execution.
#
# this command returns a benchmark report of the following form:
# ```
# record<
#   mean: duration
#   min: duration
#   max: duration
#   std: duration
#   times: list<duration>
# >
# ```
#
# > **Note**
# > `std bench --pretty` will return a `string`.
#
# # Examples
#     measure the performance of simple addition
#     > bench {1 + 2}
#     ╭──────┬───────────╮
#     │ mean │ 716ns     │
#     │ min  │ 583ns     │
#     │ max  │ 4µs 541ns │
#     │ std  │ 549ns     │
#     ╰──────┴───────────╯
#
#     get a pretty benchmark report
#     > std bench {1 + 2} --pretty
#     922ns +/- 2µs 40ns
#
#     measure the performance of simple addition with 1ms delay and output each timing
#     > bench {sleep 1ms; 1 + 2} --rounds 2 --list-timings | table -e
#     ╭───────┬─────────────────────╮
#     │ mean  │ 1ms 272µs           │
#     │ min   │ 1ms 259µs           │
#     │ max   │ 1ms 285µs           │
#     │ std   │ 13µs 370ns          │
#     │       │ ╭─────────────────╮ │
#     │ times │ │ 1ms 285µs 791ns │ │
#     │       │ │  1ms 259µs 42ns │ │
#     │       │ ╰─────────────────╯ │
#     ╰───────┴─────────────────────╯
export def main [
    code: closure  # the piece of `nushell` code to measure the performance of
    --rounds (-n): int = 50  # the number of benchmark rounds (hopefully the more rounds the less variance)
    --verbose (-v) # be more verbose (namely prints the progress)
    --pretty # shows the results in human-readable format: "<mean> +/- <stddev>"
    --list-timings # list all rounds' timings in a `times` field
] {
    let times = seq 1 $rounds
        | each {|i|
            if $verbose { print -n $"($i) / ($rounds)\r" }
            timeit { do $code } | into int | into float
        }

    if $verbose { print $"($rounds) / ($rounds)" }

    {
        mean: ($times | math avg | from ns)
        min: ($times | math min | from ns)
        max: ($times | math max | from ns)
        std: ($times | math stddev | from ns)
    }
    | if $pretty {
        $"($in.mean) +/- ($in.std)"
    } else {
        if $list_timings {
            merge { times: ($times | each { from ns --sign-digits 0 }) }
        } else {}
    }
}
