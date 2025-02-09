use std assert
use ../std-rfc str

export def "test str dedent" [] {
    
    # Test 1:
    # Should start with "Heading" in the first character position
    # Should not end with a line-break
    # The blank line has no extra spaces
    assert equal (
        do {
            let s = "   
                Heading

                    one
                    two
                "
            $s | str dedent
        }
    ) "Heading\n\n    one\n    two"

    # Test 2:
    # Same as #1, but the blank line has leftover whitespace
    # indentation (16 spaces) which is left in the result
    assert equal (
        do {
            let s = "   
                Heading
                
                    one
                    two
                "
            $s | str dedent
        }
    ) "Heading\n                \n    one\n    two"

    # Test 3:
    # Same, but with a single tab character on the "blank" line
    assert equal (
        do {
            let s = "   
                Heading
\t
                    one
                    two
                "
            $s | str dedent
        }
    ) "Heading\n\t\n    one\n    two"

    # Test 4:
    # Ends with line-break
    assert equal (
        do {
            let s = "   
                Heading

                    one
                    two

                "
            $s | str dedent
        }
    ) "Heading\n\n    one\n    two\n"

    # Test 5:
    # Identity - Returns the original string sans first and last empty lines
    # No other whitespace should be removed
    assert equal (
        do {
            let s = "\n  Identity  \n"
            $s | str dedent
        }
    ) "  Identity  "

    # Test 6:
    # Error - Does not contain an empty first line
    assert error {||
        let s = "Error"
        $s | str dedent
    }

    # Test 6.1:
    # Error - Does not contain an empty first line
    assert error {||
        let s = "Error\n \nTesting\n"
        $s | str dedent
    }

    # Test 7:
    # Error - Does not contain an empty last line
    assert error {||
        let s = "
            Error"
        $s | str dedent
    }

    # Test 7.1:
    # Error - Does not contain an empty last line
    assert error {||
        let s = "

            Error"
        $s | str dedent
    }

    # Test 8:
    # Error - Line 1 does not have enough indentation
    assert error {||
        let s = "   
           Line 1
            Line 2
            "
        $s | str dedent
    }

    # Test 8:
    # Error - Line 2 does not have enough indentation
    assert error {||
        let s = "   
            Line 1
           Line 2
            "
        $s | str dedent
    }

    # Test 9:
    # Error - Line does not have enough indentation
    assert error {||
        let s = "   
           Line  
            "
        $s | str dedent
    }

    # Test 10:
    # "Hidden" whitespace on the first line is allowed
    assert equal (
        do {
            let s = "   \t \n  Identity  \n"
            $s | str dedent
        }
    ) "  Identity  "
}