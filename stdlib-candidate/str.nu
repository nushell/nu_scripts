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

#[test]
def test_append [] {
    use std assert
    assert equal ("foo" | str append "/") "foo/"
    assert equal (["foo", "bar", "baz"] | str append "/") ["foo/", "bar/", "baz/"] 
    
}

#[test]
def test_prepend [] {
    use std assert
    assert equal ("foo" | str prepend "/") "/foo"
    assert equal (["foo", "bar", "baz"] | str prepend "/") ["/foo", "/bar", "/baz"] 
    
}
