# this script will print a blue gradient on the screen

let height = 40 # really need to get the terminal height here
let width = 160  # really need to get the terminal width here

seq 0 $height | each {
    let row_data = (seq 0 $width | each {
        let fgcolor = (iter_inc 2 2 $it)
        if $fgcolor > 200 && $fgcolor < 210 {
            echo [(ansi -e '48;2;0;0;') (build-string $fgcolor m) 'Nu' (ansi -e '0m')] | str collect
        } {
            echo [(ansi -e '48;2;0;0;') (build-string $fgcolor m) ' ' (ansi -e '0m')] | str collect
        }
    } | str collect)
    echo [$row_data (char newline)] | str collect | autoview
} | str collect

def iter_inc [incr mult iter] {
    # echo (build-string $incr + $mult * $iter) | math eval | math round
    $incr + $mult * $iter
}

# ╭────┬────────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────────╮
# │ #  │ key                │ value                                                                                             │
# ├────┼────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────┤
# │  0 │ version            │ 0.31.1                                                                                            │
# │  1 │ branch             │ main                                                                                              │
# │  2 │ short_commit       │ 3aa00b78                                                                                          │
# │  3 │ commit_hash        │ 3aa00b78f95b308a6d76eef086e018cd0e0252d0                                                          │
# │  4 │ commit_date        │ 2021-05-12 03:53:34                                                                               │
# │  5 │ build_os           │ windows-x86_64                                                                                    │
# │  6 │ rust_version       │ rustc 1.52.1 (9bc8c42bb 2021-05-09)                                                               │
# │  7 │ rust_channel       │ stable (default)                                                                                  │
# │  8 │ cargo_version      │ cargo 1.52.0 (69767412a 2021-04-21)                                                               │
# │  9 │ pkg_version        │ 0.31.1                                                                                            │
# │ 10 │ build_time         │ 2021-05-12 07:37:45                                                                               │
# │ 11 │ build_rust_channel │ release                                                                                           │
# │ 12 │ features           │ clipboard-cli, ctrlc, default, directories, dirs, ptree, rustyline, term, trash, uuid, which, zip │
# ╰────┴────────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────────╯