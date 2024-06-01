use std assert
use ../std-rfc recurse

const fixture = [
    0
    { a: 1 }
    {
        b: [
            2
            [
                [c d];
                [3 4]
            ]
        ]
    }
]

export def test [] {
    assert equal ($fixture | recurse) [
        $fixture                        # [0, {a: 1}, {b: [2, [[c, d]; [3, 4]]]}]
        $fixture.0                      # 0
        $fixture.1                      # {a: 1}
        $fixture.1.a                    # 1
        $fixture.2                      # {b: [2, [[c, d]; [3, 4]]]}
        $fixture.2.b                    # [2, [[c, d]; [3, 4]]]
        $fixture.2.b.0                  # 2
        $fixture.2.b.1                  # [c, d]; [3, 4]]
        $fixture.2.b.1.0                # {c: 3, d: 4}
        $fixture.2.b.1.0.c              # 3
        $fixture.2.b.1.0.d              # 4
    ]
}
