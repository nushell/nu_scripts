use std assert
use ../std-rfc record

export def "test list_merge" [] {
    assert equal ([{a:1} {b:2} {c:3} {d:4}] | record list merge) {a:1 b:2 c:3 d:4}
}

export def "test filter-name predicate" [] {
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | record filter-name predicate {$in | str contains a}) {aa:1 ab:2 ba:3 ca:5}
}

export def "test filter-name text" [] {
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | record filter-name text a) {aa:1 ab:2 ba:3 ca:5}
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | record filter-name text -r ^a) {aa:1 ab:2}
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | record filter-name text -r ^A) {}
}

export def "test filter-value predicate" [] {
    assert equal ({aa:1 ab:2 ba:3 bb:4 ca:5 cb:6} | record filter-value predicate { $in mod 2 == 0 }) {ab:2 bb:4 cb:6}
}
