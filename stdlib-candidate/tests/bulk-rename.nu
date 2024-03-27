use std assert
use ../std-rfc 'bulk-rename'

const fixture = [
    .gitignore
    Cargo.toml
    LICENSE
    README.md
    src
    test.nu
]

export def 'test ls' [] {
    let expects = [
        .gitignore # hidden by ls
        _Cargo.toml
        _LICENSE
        _README.md
        _src
        _test.nu
    ]
    test $expects {
        ls $in | bulk-rename { '_' + $in }
    }
}

export def 'test --no-execute' [] {
    test $fixture {
        ls $in | bulk-rename --no-execute { '_' + $in }
    }
}

export def 'test --verbose' [] {
    let expects = [
        # .gitignore unchanged
        _Cargo.toml
        _LICENSE
        _README.md
        _src
        _test.nu
    ]
    let renamed = test $fixture {
        ls $in | bulk-rename --verbose --no-execute { '_' + $in }
    }
    assert equal ($renamed.new | each { path basename }) $expects
}

export def 'test skip-extensions' [] {
    let expects = [
        .gitignore
        Cargo.toml
        LICENSE.txt # changed
        README.md
        src.txt # changed
        test.nu
    ]
    test $expects {
        ls $in | bulk-rename { |path|
            if $path.input.name ends-with $path.stem {
                $path.stem + .txt
            }
        }
    }
}

export def 'test glob' [] {
    let expects = [
        LICENSE # skipped
        _.gitignore
        _Cargo.toml
        _README.md
        _test.nu
        src # skipped
    ]
    test $expects {
        glob ($in | path join *.*) | bulk-rename { '_' + $in }
    }
}

def test [expects: list<string> command: closure] {
    let test_dir = $nu.temp-path | path join (random uuid)
    def actual-files [] {
        ls --all --short-names $test_dir | get name | sort
    }
    # before
    mkdir $test_dir
    $fixture | each { |name| touch ($test_dir | path join $name) }
    assert equal (actual-files) $fixture
    # test
    let renamed = $test_dir | do $command
    assert equal (actual-files) $expects
    # after
    rm --recursive --force $test_dir
    $renamed
}
