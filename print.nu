# Not working yet

# A print command that concatenates arguments together with an optional separator
#    By default there will be no newline
def print [
    --separator(-s):any?    # Optional separator
    ...rest                 # All of the parameters
    ] {
    let is_empty = $(empty? $separator)
    echo $rest | each {
        if $is_empty {
            build-string $it
        } {
            build-string $it $separator
        }
    } | str collect
}