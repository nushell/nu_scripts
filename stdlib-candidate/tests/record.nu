#[test]
def test_record_list_merge [] {
    use std assert
    assert equal ([{a:1} {b:2} {c:3} {d:4}] | list merge) {a:1 b:2 c:3 d:4}
}
#[test]
def test_record_filtername_predicate [] {
    use std assert
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-name predicate {$in | str contains a}) {aa:1 ab:2 ba:3 ca:5}
}
#[test]
def test_record_filtername_text [] {
    use std assert
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-name text a) {aa:1 ab:2 ba:3 ca:5}
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-name text -r ^a) {aa:1 ab:2}
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-name text -r ^A) {}
}
#[test]
def test_record_filtervalue_predicate [] {
    use std assert
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | filter-value predicate { $in mod 2 == 0 }) {ab:2 bb:4 cb:6}
}
