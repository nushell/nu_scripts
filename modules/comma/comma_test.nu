$env.comma_scope = {|_|{
    created: '2023-12-23{6}12:51:14'
    computed: {$_.cpu:{|a, s| $'($s.created)($a)' }}
    say: {|s| print $'(ansi $_.settings.theme.info)($s)(ansi reset)' }
    quick: {$_.flt:{|a, s| do $s.say 'run a `quick` filter' }}
    slow: {$_.flt:{|a, s|
        do $s.say 'run a `slow` filter'
        sleep 1sec
        do $s.say 'filter need to be declared'
        sleep 1sec
        $'($s.computed)<($a)>'
    }}
}}

$env.comma = {|_|{
    created: {|a, s| $s.computed }
    inspect: {|a, s| {index: $_, scope: $s, args: $a} }
    example: {
        a: {
            b: {
                $_.sub: {
                    c: {
                        $_.sub: {
                            d: {|| print 'ok'}
                            e: {
                                $_.sub: {
                                    f: {
                                        $_.act: {|| true }
                                    }
                                }
                                $_.dsc: 'ok'
                            }
                        }
                    }
                }
                $_.dsc: 'this way'
            }
            g: {}
        }
        set: {|a, s| do $_.config {|d| $d | upsert $a.0 $a.1 } }
        get: {|a,s| $_.settings; {a: 123} }
        add: {|a,s| ($a.0 | into int) + ($a.1 | into int) }
    }
    test: {
        comma: {
            $_.act: {
                nu -c ([
                    'use scripts/comma.nu *'
                    'source scripts/comma_test.nu'
                    ', test all'
                ] | str join (char newline))
            }
            $_.wth: { glob: '*.nu' }
            $_.dsc: 'copy this to uplevel'
        }
        all: {
            do $_.test 'add' {|x| $x == 3 } {, example add 1 2 }
            do $_.test 'struct' { , test struct }
            do $_.test 'set env' {|x| $x.a? == 123 } { , test set-env } {|x| $x }
            do $_.test 'echo' 'hello' {, test other }
        }
        struct: {
            $_.act: {
                , example a b c e f
            }
        }
        set-env: {
            $_.act: {
                , example set a 123
                , example get
            }
        }
        other: {
            echo 'hello'
        }
        poll: {
            $_.act: { print $env.PWD }
            $_.wth: {
                interval: 1sec
            }
        }
        vscode: {
            gen: {
                $_.act: {
                }
                $_.wth: { glob: '*.nu' }
            }
            complete: {
                $_.act: {
                }
                $_.wth: { glob: '*.nu' }
            }
        }
    }
}}
