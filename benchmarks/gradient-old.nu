# this script will print a blue gradient on the screen

# We can get the terminal width and height now with term size
# but we like to use the script as a benchmark, so let's keep
# it a constant size for now
let height = 40 # really need to get the terminal height here
let width = 160  # really need to get the terminal width here
let stamp = 'Nu'
seq 0 $height | each { |row|
    let row_data = (seq 0 $width | each { |col|
        let fgcolor = (iter_inc 2 2 $col)
        if $fgcolor > 200 and $fgcolor < 210 {
            $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
        } else {
            $"(ansi -e '48;2;0;0;')($fgcolor)m(char sp)(ansi -e '0m')"
        }
    } | str join)
    print -n $"($row_data)(char newline)"
} | str join

def iter_inc [incr mult iter] {
    $incr + $mult * $iter
}


# ╭────────────────────┬──────────────────────────────────────────────────────╮
# │ version            │ 0.1.0                                                │
# │ branch             │ main                                                 │
# │ short_commit       │ ec94ca46                                             │
# │ commit_hash        │ ec94ca46bb64f3aa95f1366d76d60da2ddc53782             │
# │ commit_date        │ 2022-01-24 19:45:20 +00:00                           │
# │ build_os           │ windows-x86_64                                       │
# │ rust_version       │ rustc 1.58.1 (db9d1b20b 2022-01-20)                  │
# │ rust_channel       │ stable-x86_64-pc-windows-msvc                        │
# │ cargo_version      │ cargo 1.58.0 (f01b232bc 2022-01-19)                  │
# │ pkg_version        │ 0.1.0                                                │
# │ build_time         │ 2022-01-24 15:04:00 -06:00                           │
# │ build_rust_channel │ debug                                                │
# │ features           │ dataframe, default, which, zip                       │
# │ installed_plugins  │ gstat, inc, nu-example-1, nu-example-2, nu-example-3 │
# ╰────────────────────┴──────────────────────────────────────────────────────╯
