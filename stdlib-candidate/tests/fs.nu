use std assert
use ../std-rfc "file bulk-rename"

alias rename = file bulk-rename

export def "test file bulk-rename" [] {
    let test_dir = $nu.temp-path | path join (random uuid)

    mkdir $test_dir
    seq 1 10 | each {|i| touch ($test_dir | path join $"some_($i)_format.txt") }

    let expected = [
        "some_10_format.txt",
        "some_1_format.txt",
        "some_2_format.txt",
        "some_3_format.txt",
        "some_4_format.txt",
        "some_5_format.txt",
        "some_6_format.txt",
        "some_7_format.txt",
        "some_8_format.txt",
        "some_9_format.txt",
    ]
    let actual = glob $"($test_dir)/*" | str replace $test_dir "" | str trim --left --char "/"
    assert equal ($actual | sort) $expected

    rename $test_dir {
        parse "some_{i}_format"
            | get 0
            | update i { fill --alignment r --character 0 --width 3 }
            | $"some_($in.i)_format"
    }

    let expected = [
        "some_001_format.txt",
        "some_002_format.txt",
        "some_003_format.txt",
        "some_004_format.txt",
        "some_005_format.txt",
        "some_006_format.txt",
        "some_007_format.txt",
        "some_008_format.txt",
        "some_009_format.txt",
        "some_010_format.txt",
    ]
    let actual = glob $"($test_dir)/*" | str replace $test_dir "" | str trim --left --char "/"
    assert equal ($actual | sort) $expected

    rm -rf $test_dir
}
