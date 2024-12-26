# Update extension of input files.
#
# # Example
# - setting path ext to `rs`
# ```nushell
# > "ab.txt" | path extension "rs"
# ab.rs
# > "ab.txt" | path extension ".rs"
# ab.rs
#
# - setting a list of input path ext to `rs`
# > ["ab.txt", "cd.exe"] | path extension "rs"
# ╭───┬──────────╮
# │ 0 │ ab.rs    │
# │ 1 │ cd.rs    │
# ╰───┴──────────╯
# ``` 
export def extension [
    ext: string
] {
    let path_parsed = $in | path parse
    if ($ext | str starts-with ".") {
        $path_parsed | update extension ($ext | str substring 1..) | path join
    } else {
        $path_parsed | update extension $ext | path join
    }
}

