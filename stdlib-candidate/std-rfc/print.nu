# A print command that concatenates arguments together with an optional separator
#    By default there will be no newline
def print1 [
    --separator(-s):any     # Optional separator (not yet flagged as optional?)
    ...rest                 # All of the parameters
    ] {
    let is_empty = ($separator | is-empty)
    let num_of_rest = ($rest | length)
    $rest | enumerate | each { |param|
        if $is_empty {
            $param.item
        } else {
            if $num_of_rest > ($param.index + 1) {
                $"($param.item)($separator)"
            } else {
                $param.item
            }
        }
    } | into string | str join
}

# > print 1 2 3 "four" -s '--'
# 1--2--3--four

# > print 1 2 3 "four"
# 123four

# An alternate print command that concatenates arguments together with an optional separator.
# This one uses str collect instead of build-string.
#    By default there will be no newline
def print2 [
    --separator(-s):any     # Optional separator (not yet flagged as optional?)
    ...rest                 # All of the parameters
    ] {
    let is_empty = ($separator | is-empty)
    let num_of_rest = ($rest | length)
    if $is_empty {
        $rest | into string | str join
    } else {
        $rest | into string | str join $separator
    }
    }


# A print command that concatenates arguments together with an optional separator.
# This print command will also concatenate tables like [1 2 3] as well as most other primitives
# since the into string command has been updated with wider support.
def print3 [
    --separator(-s):any     # Optional separator (not yet flagged as optional?)
    --flat(-f)              # If tables are found, flatten them
    ...rest                 # All of the parameters
    ] {
    let sep_empty = ($separator | is-empty)
    let num_of_rest = ($rest | length)
    let flat = ($flat | is-empty)
    $rest | enumerate | each { |param|
        if $sep_empty {
            if ((echo $param.item | str length) > 1) and $flat {
                let flatter = ($param.item | flatten | into string | str join)
                $flatter
            } else {
                $param.item
            }
        } else {
            if $num_of_rest > ($param.index + 1) {
                if ($param.item | length) > 1 and $flat {
                    let flatter = ($param.item | flatten | into string | str join $separator)
                    $"($flatter)($separator)"
                } else {
                    $"($param.item)($separator)"
                }
            } else {
                if ($param.item | length) > 1 and $flat {
                    let flatter = ($param.item | flatten | into string | str join $separator)
                    $flatter
                } else {
                    $param.item
                }
            }
        }
    } | str join
}
