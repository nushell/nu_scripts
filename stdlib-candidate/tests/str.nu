#[test]
def test_append [] {
    use std assert
    assert equal ("foo" | append "/") "foo/"
    assert equal (["foo", "bar", "baz"] | append "/") ["foo/", "bar/", "baz/"]

}

#[test]
def test_prepend [] {
    use std assert
    assert equal ("foo" | prepend "/") "/foo"
    assert equal (["foo", "bar", "baz"] | prepend "/") ["/foo", "/bar", "/baz"]

}
