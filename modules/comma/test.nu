$env.comma_scope = {|_|{
    created: '2023-12-23{6}12:51:14'
    computed: {$_.computed:{|a, s| $'($s.created)($a)' }}
    say: {|s| print -e $'(ansi $_.settings.theme.info)($s)(ansi reset)' }
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
        dry_run: {
            a: { pp pwd }
            no: {
                $_.a: {, suit dry_run a }
                $_.x: {|r| ($r | lines | get 0) == $env.PWD }
            }
            pp: {
                $_.a: {
                    pp --print --as-str aaa bbbb ccccc dddddd eeeeee  [
                        ffffff gggggggggg [
                            hhhhhhhhh iiiiiiiiii lllllllll
                        ] mmmmmmmmmmmmm nnnnnnnnnnnn
                        aaaaaaaaaaaaaaa
                        xxxxxxxxxxxxxxxx
                        yyyyyyyyyyyyyyyy
                        zzzzzzzzzzzzzzz
                        jjjjjjjjjjjjj
                    ] oooooooo ppppppppp [qqqqqq [rrrrrr ssssss tttttt] uuuuuu]
                }
                $_.x: ('
                    aaa bbbb ccccc dddddd eeeeee \
                        ffffff gggggggggg \
                            hhhhhhhhh iiiiiiiiii lllllllll \
                        mmmmmmmmmmmmm nnnnnnnnnnnn aaaaaaaaaaaaaaa xxxxxxxxxxxxxxxx yyyyyyyyyyyyyyyy \
                        zzzzzzzzzzzzzzz jjjjjjjjjjjjj \
                    oooooooo ppppppppp \
                        qqqqqq \
                            rrrrrr ssssss tttttt \
                        uuuuuu' | do $_.outdent)
                $_.report: $_.diff
            }
        }
        completion: {
            'example a b c e': {
                $_.act: {, -c example a b c e }
                $_.x: [
                    {|r,a,s| $r | where value == 'f' | not ($in | is-empty) }
                    (do $_.T {|r,a,s| $s | spy 'expect'})
                    {|r,a| 'q1|q2|q3|q4| open a file' == ($r | get 1.description) }
                ]
            }
            'with args': {
                $_.act: { , -c example a b c e open_file }
                $_.x: {|r,a| ',.nu' in $r }
            }
            args: {
                $_.a: {|a,s| $a }
                $_.c: {|a,s| $a }
            }
            '': {
                $_.act: { , test -c }
                $_.x: {|r,a| $r | where value == 'ping' | not ($in | is-empty) }
            }
            'run with args': {
                $_.act: {|a| , suit completion args $a }
                $_.m: [a b c d e f g]
                $_.x: {|r,a| $r == $a }
            }
            'with multiple args': {
                $_.act: {|a| , -c suit completion args $a }
                $_.m: [a b c d e f g]
                $_.x: {|r,a| $r == $a }
            }
        }
        vscode: {
            'gen': {
                $_.a: { , --vscode }
                $_.x: {|r,a| $r.version == '2.0.0' }
            }
        }
    }
    example: {
        a: {
            b: {
                $_.sub: {
                    t1: {
                        $_.act: { true }
                        $_.exp: { true }
                    }
                    open_file: {
                        $_.act: {|a, s| open $a.0 }
                        $_.cmp: {ls | get name}
                        $_.dsc: 'open a file'
                    }
                    c: {
                        $_.sub: {
                            d: {|| print 'ok'}
                            e: {
                                $_.sub: {
                                    f: {
                                        $_.act: { true }
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
                                        $_.act: { true }
                                        $_.exp: { true }
                                    }
                                }
                                $_.dsc: 'ok'
                                $_.flt: ['q3']
                            }
                        }
                    }
                    t2: {
                        $_.act: { true }
                        $_.exp: { true }
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
                ', test all' | do $_.batch 'comma_test.nu'
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
                spec: { , test set-env }
                expect: {|x| $x.a? == 123 }
            }
            do $_.test 'open file' {
                expect: {|x| $x == (open ,.nu) }
                spec: { , example a b c e open_file ,.nu }
            }
            do $_.test 'completion' {
                expect: {|x| ',.nu' in $x }
                spec: { , -c example a b c e open_file }
                args: [example a b c e open_file]
            }
            do $_.test 'completion' {
                expect: {|x| $x | where value == 'f' | not ($in | is-empty) }
                spec: {|x| , -c $x }
                args: [example a b c e]
            }
            do $_.test 'run test' {
                expect: { true }
                spec: {, -e test example }
            }
            do $_.test 'run leaf test' {
                expect: { true }
                spec: { , -t example a b t1 }
            }
            do $_.test 'suit' {
                expect: { true }
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
        ping: {
            $_.action: {|a, s| ping -c 2 localhost }
            $_.watch: {
                interval: 2sec
                clear: true
            }
            $_.filter: ['slow']
        }
        vscode: {
            gen: {
                $_.act: {|a,s| print $a.0 }
                $_.wth: { glob: '*.nu' }
            }
            complete: {
                $_.act: { true }
                $_.wth: { glob: '*.nu' }
            }
        }
    }
}}
