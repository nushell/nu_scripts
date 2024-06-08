# A proposal for improving the original `std bench` command by @amtoine
# https://github.com/nushell/nushell/blob/31f3d2f6642b585f0d88192724723bf0ce330ecf/crates/nu-std/std/mod.nu#L134

# round an integer amount of nanoseconds to 4th digit and convert to a real duration
def "from ns" [] {
    if $in == 0 {0} else { #math log errors on 0
        math round -p (3 - ($in | math log 10 | math floor)) # rounds to 4th digit including, with maximum realtive err 0.05%
        | math round # second math round as a fix for `> 123456 | math round -p -5` = 99999.99999999999
    }
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
#     > bench {1 + 2} --pretty
#     716ns ± 76.67%
#
#     measure the performance of simple addition with 1ms delay and output each timing
#     > bench {sleep 1ms; 1 + 2} --rounds 2 --timings | table -e
#     ╭───────┬───────────────╮
#     │ mean  │ 1ms 272µs     │
#     │ min   │ 1ms 259µs     │
#     │ max   │ 1ms 285µs     │
#     │ std   │ 13µs 370ns    │
#     │       │ ╭───────────╮ │
#     │ times │ │ 1ms 285µs │ │
#     │       │ │ 1ms 259µs │ │
#     │       │ ╰───────────╯ │
#     ╰───────┴───────────────╯
export def main [
    code: closure  # the piece of `nushell` code to measure the performance of
    --rounds (-n): int = 50  # the number of benchmark rounds (hopefully the more rounds the less variance)
    --verbose (-v) # be more verbose (namely prints the progress)
    --pretty # shows the results in human-readable format: "<mean> +/- <stddev>"
    --timings (-t) # list all rounds' timings in a `times` field
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
        $"($in.mean) ± (($in.std / $in.mean) * 100 | math round -p 2)%"
    } else {
        if $timings {
            merge { times: ($times | each { from ns }) }
        } else {}
    }
}
