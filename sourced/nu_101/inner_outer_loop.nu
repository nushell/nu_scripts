# This is an experiment to see if one can have
# $it in and inner loop and an outer loop at
# the same time, each having different values

seq 30 39 | each { |outer|
    let row = $"($outer) "
    let data = (seq 40 49 | each { |inner|
        $"($inner) "
    } | str join)
    $"($row)($data)"
} | str join (char newline)
