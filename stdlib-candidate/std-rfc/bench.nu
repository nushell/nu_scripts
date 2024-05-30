# A proposal for improving the original `std bench` command by @amtoine
# https://github.com/nushell/nushell/blob/31f3d2f6642b585f0d88192724723bf0ce330ecf/crates/nu-std/std/mod.nu#L134

# convert an integer amount of nanoseconds to a real duration
def "from ns" [
    --units: string # units to convert duration to (min, sec, ms, µs, ns)
] {
    round-significant-digits
    | $"($in)ns"
    | into duration
    | if $units != null {
        format duration $units
    } else {}
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
# > the `--units` option will convert all durations to strings
#
# # Examples
#     measure the performance of simple addition
#     > std bench {1 + 2}
#     ╭──────┬────────────╮
#     │ mean │ 3µs 30ns   │
#     │ min  │ 542ns      │
#     │ max  │ 12µs 900ns │
#     │ std  │ 3µs 550ns  │
#     ╰──────┴────────────╯
#
#     measure the performance of simple addition and output each timing
#     > std bench {1 + 2} --list_timings -n 3 | table -e
#     ╭───────┬───────────────╮
#     │ mean  │ 2µs 970ns     │
#     │ min   │ 833ns         │
#     │ max   │ 7µs 210ns     │
#     │ std   │ 3µs           │
#     │       │ ╭───────────╮ │
#     │ times │ │ 7µs 210ns │ │
#     │       │ │     875ns │ │
#     │       │ │     833ns │ │
#     │       │ ╰───────────╯ │
#     ╰───────┴───────────────╯
#
#     Output results of a benchmark in `ms`
#     > std bench {sleep 1sec} --units ms
#     ╭──────┬─────────╮
#     │ mean │ 1000 ms │
#     │ min  │ 1000 ms │
#     │ max  │ 1010 ms │
#     │ std  │ 1.87 ms │
#     ╰──────┴─────────╯
#
#     get a pretty benchmark report
#     > std bench {1 + 2} --pretty
#     922ns +/- 2µs 40ns
export def bench [
    code: closure  # the piece of `nushell` code to measure the performance of
    --rounds (-n): int = 50  # the number of benchmark rounds (hopefully the more rounds the less variance)
    --verbose (-v) # be more verbose (namely prints the progress)
    --pretty # shows the results in human-readable format: "<mean> +/- <stddev>"
    --units: string # units to convert duration to (min, sec, ms, µs, ns)
    --list_timings # list all rounds' timings in a `times` cell
] {
    let times = seq 1 $rounds
        | each {|i|
            if $verbose { print -n $"($i) / ($rounds)\r" }
            timeit { do $code } | into int | into float
        }

    if $verbose { print $"($rounds) / ($rounds)" }

    {
        mean: ($times | math avg | from ns --units $units)
        min: ($times | math min | from ns --units $units)
        max: ($times | math max | from ns --units $units)
        std: ($times | math stddev | from ns --units $units)
    }
    | if $pretty {
        $"($in.mean) +/- ($in.std)"
    } else {
        if $list_timings {
            # we don't use --units as to enable a user to do final trasnformations
            merge { times: ($times | each { from ns }) }
        } else {}
    }
}
