# Creates a table listing the branches of a git repository and the day of the last commit
def "git age" [] {
    git branch |
    lines |
    str substring 2, |
    wrap name |
    insert date {
        get name |
        each {
            git show $it --no-patch --format=%as | str to-datetime
        }
    } |
    sort-by date
}

