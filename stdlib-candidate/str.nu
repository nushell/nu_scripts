def "str append" [tail: string]: [string -> string, list<string> -> list<string>] {
    let input = $in
    match ($input | describe | str replace --regex '<.*' '') {
        "string" => { $input ++ $tail },
        "list" => { $input | each {|el| $el ++ $tail} },
        _ => $input
    }
}
def "str prepend" [head: string]: [string -> string, list<string> -> list<string>] {
    let input = $in
    match ($input | describe | str replace --regex '<.*' '') {
        "string" => { $head ++ $input },
        "list" => { $input | each {|el| $head ++ $el } },
        _ => $input
    }
}
