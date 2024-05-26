# An attempt at trying to put ls into a paging mode
export def ls-less [
    --dir(-d):any # The directory you want to list
] {
    let is_empty = ($dir | is-empty)
    if $is_empty {
        nu -c 'ls' | less -r
    } else {
        let command = $"ls ($dir)"
        nu -c $command | less -r
    }
}
