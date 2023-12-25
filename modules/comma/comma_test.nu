$env.comma_scope = {|_|{
    created: '2023-12-23{6}12:51:14'
    computed: {$_.computed:{|a, s| $'($s.created)($a)' }}
    say: {|s| print $'(ansi $_.settings.theme.info)($s)(ansi reset)' }
    q1: {$_.flt:{|a, s| do $s.say 'run `q1` filter' }}
    q2: {$_.flt:{|a, s| do $s.say 'run `q2` filter' }}
    q3: {$_.flt:{|a, s| do $s.say 'run `q3` filter' }}
    q4: {$_.flt:{|a, s| do $s.say 'run `q4` filter' }}
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
    suit: {
        scope: {
            '`say` in scope': {
                $_.act: {|a, s| $s}
                $_.exp: {|r, a| 'say' in $r }
            }
        }
        completion: {
            'example a b c e': {
                $_.act: {, -c example a b c e }
                $_.exp: [
                    {|r,a| 'f' in $r}
                    {|r,a| 'q1|q2|q3|q4| open a file' == ($r | from json | get 1.description) }
                    $_.T
                ]
            }
        }
    }
    example: {
        a: {
            b: {
                $_.sub: {
                    t1: {
                        $_.act: $_.T
                        $_.exp: $_.T
                    }
                    c: {
                        $_.sub: {
                            d: {|| print 'ok'}
                            e: {
                                $_.sub: {
                                    f: {
                                        $_.act: $_.T
                                    }
                                    open_file: {
                                        $_.act: {|a, s| open $a.0 }
                                        $_.cmp: {ls | get name}
                                        $_.dsc: 'open a file'
                                        $_.filter: ['q4']
                                        $_.exp: {|r, a| $r == (open ',.nu') }
                                        $_.mock: [',.nu']
                                        $_.report: $_.diff
                                    }
                                    t3: {
                                        $_.act: $_.T
                                        $_.exp: $_.T
                                    }
                                }
                                $_.dsc: 'ok'
                                $_.flt: ['q3']
                            }
                        }
                    }
                    t2: {
                        $_.act: $_.T
                        $_.exp: $_.T
                    }
                }
                $_.dsc: 'this way'
                $_.filter: ['q1' 'q2']
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
            $_.wth: {
                glob: '*.nu'
                clear: true
            }
            $_.dsc: 'copy this to uplevel'
        }
        all: {
            do $_.test 'add' {
                expect: {|x| $x == 3 }
                spec: {|a|, example add 1 2 }
            }
            do $_.test 'struct' {
                spec: {|a| , test struct }
            }
            do $_.test 'args' {
                expect: {|x, a| true }
                spec: {|x| [$x] }
                args: 'this is args'
                context: {|x, a| $x}
            }
            do $_.test 'set env' {
                expect: {|x| $x.a? == 123 }
                spec: { , test set-env }
            }
            do $_.test 'open file' {
                expect: {|x| $x == (open ,.nu) }
                spec: { , example a b c e open_file ,.nu }
            }
            do $_.test 'completion' {
                expect: {|x| ',.nu' in ( $x | from json) }
                spec: { , -c example a b c e open_file }
                args: [example a b c e open_file]
            }
            do $_.test 'completion' {
                expect: {|x| 'f' in ( $x | from json) }
                spec: {|x| , -c $x }
                args: [example a b c e]
            }
            do $_.test 'run test' {
                expect: $_.T
                spec: {, -e test example }
            }
            do $_.test 'run leaf test' {
                expect: $_.T
                spec: { , -t example a b t1 }
            }
            do $_.test 'suit' {
                expect: $_.T
                spec: { , -t suit }
            }
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
        other: {|a, s|
            $s
        }
        poll: {
            $_.act: { print $env.PWD }
            $_.wth: {
                interval: 1sec
            }
        }
        vscode: {
            gen: {
                $_.act: {|a,s| print $a.0 }
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
