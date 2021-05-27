# this script will print a blue gradient on the screen

# We can get the terminal width and height now with term size
# but we like to use the script as a benchmark, so let's keep
# it a constant size for now
let height = 40 # really need to get the terminal height here
let width = 160  # really need to get the terminal width here
let stamp = 'Nu'
seq 0 $height | each {
    let row_data = (seq 0 $width | each { |col|
        let fgcolor = (iter_inc 2 2 $col)
        if $fgcolor > 200 && $fgcolor < 210 {
            $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
        } {
            $"(ansi -e '48;2;0;0;')($fgcolor)m(char sp)(ansi -e '0m')"
        }
    } | str collect)
    $"($row_data)(char newline)" | autoview
} | str collect

def iter_inc [incr mult iter] {
    $incr + $mult * $iter
}

# ╭────┬────────────────────┬───────────────────────────────────────────────────────────────────────────────────────────────────╮
# │ #  │ key                │ value                                                                                             │
# ├────┼────────────────────┼───────────────────────────────────────────────────────────────────────────────────────────────────┤
# │  0 │ version            │ 0.31.1                                                                                            │
# │  1 │ branch             │ main                                                                                              │
# │  2 │ short_commit       │ 751de20f                                                                                          │
# │  3 │ commit_hash        │ 751de20f938ed200ae6128a30d06a5dd24a4fd33                                                          │
# │  4 │ commit_date        │ 2021-05-21 02:04:27                                                                               │
# │  5 │ build_os           │ windows-x86_64                                                                                    │
# │  6 │ rust_version       │ rustc 1.52.1 (9bc8c42bb 2021-05-09)                                                               │
# │  7 │ rust_channel       │ stable (default)                                                                                  │
# │  8 │ cargo_version      │ cargo 1.52.0 (69767412a 2021-04-21)                                                               │
# │  9 │ pkg_version        │ 0.31.1                                                                                            │
# │ 10 │ build_time         │ 2021-05-21 07:20:25                                                                               │
# │ 11 │ build_rust_channel │ release                                                                                           │
# │ 12 │ features           │ clipboard-cli, ctrlc, default, directories, dirs, ptree, rustyline, term, trash, uuid, which, zip │
# ╰────┴────────────────────┴───────────────────────────────────────────────────────────────────────────────────────────────────╯