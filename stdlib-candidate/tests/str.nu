use std assert
use ../std-rfc str

export def "test append" [] {
    assert equal ("foo" | str append "/") "foo/"
    assert equal (["foo", "bar", "baz"] | str append "/") ["foo/", "bar/", "baz/"]
}

export def "test prepend" [] {
    assert equal ("foo" | str prepend "/") "/foo"
    assert equal (["foo", "bar", "baz"] | str prepend "/") ["/foo", "/bar", "/baz"]
}
