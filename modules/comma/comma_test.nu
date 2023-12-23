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
    inspect: {|a, s| {index: $_, scope: $s, args: $a} | table -e }
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
        get: {|a,s| $_.settings | table -e }
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
            , test struct
            , test set-env
        }
        poll: {
            $_.act: { print $env.PWD }
            $_.wth: {
                interval: 1sec
            }
        }
        struct: {
            $_.act: {
                , example a b c e f
            }
        }
        set-env: {
            $_.act: {
                , example set a b
                , example get
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
