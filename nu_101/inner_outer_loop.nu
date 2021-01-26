# This is an experiment to see if one can have
# $it in and inner loop and an outer loop at
# the same time, each having different values

seq 30 39 | each {
    let row = $(echo [$it ' '] | str collect)
    let data = $(seq 40 49 | each {
        echo [$it ' '] | str collect
    } | str collect)
    echo [$row $data $(char newline)] | str collect
} | str collect