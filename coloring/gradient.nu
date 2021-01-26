# this script will print a blue gradient on the screen

let height = 40 # really need to get the terminal height here
let width = 160  # really need to get the terminal width here

seq 0 $height | each {
    let row_data = $(seq 0 $width | each {
        let fgcolor = $(iter_inc 2 2 $(echo $it | str to-int))
        if $fgcolor > 200 && $fgcolor < 210 {
            echo [$(ansi -e '48;2;0;0;') $(build-string $fgcolor m) 'Nu' $(ansi -e '0m')] | str collect
        } {
            echo [$(ansi -e '48;2;0;0;') $(build-string $fgcolor m) ' ' $(ansi -e '0m')] | str collect
        }
    } | str collect)
    echo [$row_data $(char newline)] | str collect | autoview
} | str collect

def iter_inc [incr mult iter] {
    # echo $(build-string $incr + $mult * $iter) | math eval | math round
    = $incr + $mult * $iter
}

# ╭────┬────────────────────┬──────────────────────────────────────────────────────────────────────────────────────╮
# │ #  │ key                │ value                                                                                │
# ├────┼────────────────────┼──────────────────────────────────────────────────────────────────────────────────────┤
# │  0 │ version            │ 0.25.2                                                                               │
# │  1 │ branch             │ main                                                                                 │
# │  2 │ short_commit       │ d06f457b                                                                             │
# │  3 │ commit_hash        │ d06f457b2a7dee3acc71ecd0dc8b6a34afbfc5d8                                             │
# │  4 │ commit_date        │ 2021-01-11 22:59:53                                                                  │
# │  5 │ build_os           │ windows-x86_64                                                                       │
# │  6 │ rust_version       │ rustc 1.49.0 (e1884a8e3 2020-12-29)                                                  │
# │  7 │ rust_channel       │ stable (default)                                                                     │
# │  8 │ cargo_version      │ cargo 1.49.0 (d00d64df9 2020-12-05)                                                  │
# │  9 │ pkg_version        │ 0.25.2                                                                               │
# │ 10 │ build_time         │ 2021-01-12 07:29:22                                                                  │
# │ 11 │ build_rust_channel │ release                                                                              │
# │ 12 │ features           │ clipboard-cli, ctrlc, default, directories, dirs, git, ichwh, ptree, rich-benchmark, │
# │    │                    │ rustyline, term, trash, uuid, which, zip                                             │
# ╰────┴────────────────────┴──────────────────────────────────────────────────────────────────────────────────────╯