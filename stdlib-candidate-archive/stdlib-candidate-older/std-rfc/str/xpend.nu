# Append a suffix to an input string or list of strings.
#
# Examples:
#   Output 'hello world'
#   > 'hello' | str append ' world'
#
#   Output file names suffixed with '_world'
#   > ls | get name | str append _world
export def append [
    suffix: string
]: [string -> string, list<string> -> list<string>] {
    let input = $in
    let append = { $in + $suffix }
    if ($input | describe) == string {
        $input | do $append
    } else {
        $input | each $append
    }
}

# Prepend a prefix to an input string or list of strings.
#
# Examples:
#   Output 'hello world'
#   > 'world' | str prepend 'hello '
#
#   Output file names prefixed with 'hello_'
#   > ls | get name | str prepend hello_
export def prepend [
    prefix: string
]: [string -> string, list<string> -> list<string>] {
    let input = $in
    let prepend = { $prefix + $in }
    if ($input | describe) == string {
        $input | do $prepend
    } else {
        $input | each $prepend
    }
}
