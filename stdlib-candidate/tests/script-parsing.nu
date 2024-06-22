use std assert
use ../std-rfc parse-arg

const SPAN = { start: 0, end: 0 }

export def "test parse-arg ok" [] {
    const TEST_CASES = [
        [ input, type, expected ];

        [ "123", "int", 123 ],
        [ "[1, 2, 3]", "list<int>", [1, 2, 3] ],
        [ "'spam'", "string", "spam" ],
        [
            "{ a: 1, b: 'egg', c: false }",
            "record<a: int, b: string, c: bool>",
            { a: 1, b: 'egg', c: false },
        ],
    ]

    for t in $TEST_CASES {
        assert equal ($t.input | parse-arg $SPAN $t.type) $t.expected
    }
}

export def "test parse-arg err" [] {
    const TEST_CASES = [
        [ input, type ];

        [ "{ invalid NUON", "" ],
        [ "[1, 2, 3]", "string" ],
    ]

    for t in $TEST_CASES {
        let msg = $"test case: input: '($t.input)', type: ($t.type)"
        assert error { $t.input | parse-arg $SPAN $t.type } $msg
    }
}
