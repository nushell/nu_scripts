# Kubouch wrote this on/around 01/26/2022

def iter_inc [incr mult iter] {
    $incr + $mult * $iter
}

#let is_release = input "Did you compile in a release mode? y/n "
let is_release = "y"

if ($is_release | str downcase | str trim) == "y" {

    print $"running test 0 at (date now |  format date '%Y-%m-%d %H:%M:%S.%3f')"
    # 0. this has wrong output
    let 0 = (seq 10 | timeit {
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each { |row|
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = (iter_inc 2 2 $col)
                if $fgcolor > 200 and $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m(char sp)(ansi -e '0m')"
                }
            } | str join)
            $"($row_data)(char newline)"
        } | str join
    } | math avg)


    print $"running test 1 at (date now |  format date '%Y-%m-%d %H:%M:%S.%3f')"
    # 1. Fixed newline to fix the output (char cr)
    let 1 = (seq 10 | timeit {
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each { |row|
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = (iter_inc 2 2 $col)
                if $fgcolor > 200 and $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m(char sp)(ansi -e '0m')"
                }
            } | str join)
            $"($row_data)(char cr)"
        } | str join
    } | math avg)

    print $"running test 2 at (date now |  format date '%Y-%m-%d %H:%M:%S.%3f')"
    # 2. Replace (char sp) with just space
    let 2 = (seq 10 | timeit {
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each { |row|
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = (iter_inc 2 2 $col)
                if $fgcolor > 200 and $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m (ansi -e '0m')"
                }
            } | str join)
            $"($row_data)(char cr)"
        } | str join
    } | math avg)

    print $"running test 3 at (date now |  format date '%Y-%m-%d %H:%M:%S.%3f')"
    # 3. Precompute (ansi -e '48;2;0;0;') and (ansi -e '0m') -- seems to be slower
    let 3 = (seq 10 | timeit {
        let height = 40
        let width = 160
        let stamp = 'Nu'
        let ansi1 = (ansi -e '48;2;0;0;')
        let ansi2 = (ansi -e '0m')
        seq 0 $height | each { |row|
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = (iter_inc 2 2 $col)
                if $fgcolor > 200 and $fgcolor < 210 {
                    $"($ansi1)($fgcolor)m($stamp)($ansi2)"
                } else {
                    $"($ansi1)($fgcolor)m(char sp)($ansi2)"
                }
            } | str join)
            $"($row_data)(char cr)"
        } | str join
    } | math avg)

    print $"running test 4 at (date now |  format date '%Y-%m-%d %H:%M:%S.%3f')"
    # 4. Inline iter_inc call
    let 4 = (seq 10 | timeit {
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each { |row|
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = 2 + 2 * $col
                if $fgcolor > 200 and $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m(char sp)(ansi -e '0m')"
                }
            } | str join)
            $"($row_data)(char cr)"
        } | str join
    } | math avg)

    print $"running test 5 at (date now |  format date '%Y-%m-%d %H:%M:%S.%3f')"
    # 5. Combine (char sp) substitution and iter_inc inlining
    let 5 = (seq 10 | timeit {
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | each { |row|
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = 2 + 2 * $col
                if $fgcolor > 200 and $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m (ansi -e '0m')"
                }
            } | str join)
            $"($row_data)(char cr)"
        } | str join
    } | math avg)

    print $"running test 6 at (date now |  format date '%Y-%m-%d %H:%M:%S.%3f')"
    # 6. The above with par-each outer loop (using par-each anywhere else breaks the output)
    let 6 = (seq 10 | timeit {
        let height = 40
        let width = 160
        let stamp = 'Nu'
        seq 0 $height | par-each -t 100 { |row|
            let row_data = (seq 0 $width | each { |col|
                let fgcolor = 2 + 2 * $col
                if $fgcolor > 200 and $fgcolor < 210 {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m($stamp)(ansi -e '0m')"
                } else {
                    $"(ansi -e '48;2;0;0;')($fgcolor)m (ansi -e '0m')"
                }
            } | str join)
            $"($row_data)(char cr)"
        } | str join
    } | math avg)

    print 'collating tests'
    [ $0 $1 $2 $3 $4 $5 $6 ]

} else {
    print "Compile in a release mode!"
}
