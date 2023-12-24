$env.comma_scope = {|_|{
    created: '2023-12-23{6}12:51:14'
    computed: {$_.computed:{|a, s| $'($s.created)($a)' }}
    say: {|s| print $'(ansi $_.settings.theme.info)($s)(ansi reset)' }
    q1: {$_.flt:{|a, s| do $s.say 'run a `q1` filter' }}
    q2: {$_.flt:{|a, s| do $s.say 'run a `q2` filter' }}
    q3: {$_.flt:{|a, s| do $s.say 'run a `q3` filter' }}
    q4: {$_.flt:{|a, s| do $s.say 'run a `q4` filter' }}
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
                                    open_file: {
                                        $_.act: {|a, s| open $a.0 }
                                        $_.cmp: {ls | get name}
                                        $_.dsc: 'open a file'
                                        $_.filter: ['q4']
                                    }
                                }
                                $_.dsc: 'ok'
                                $_.flt: ['q3']
                            }
                        }
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
            do $_.test 'add' {|x| $x == 3 } {, example add 1 2 }
            do $_.test 'struct' { , test struct }
            do $_.test 'set env' {|x| $x.a? == 123 } { , test set-env } {|x| $x }
            do $_.test 'echo' 'hello' {, test other }
            do $_.test 'open file' {|x| $x == (open ,.nu) } { , example a b c e open_file ,.nu }
            do $_.test 'completion end' {|x| ',.nu' in ( $x | from json); true } { , -c example a b c e open_file }
            #example a b c e
            do $_.test 'completion' {|x| 'f' in ( $x | from json); false } { , -c }
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
