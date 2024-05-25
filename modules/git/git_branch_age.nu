# Creates a table listing the branches of a git repository and the day of the last commit
export def "git age" [] {
    git branch |
    lines |
    str substring 2.. |
    wrap name |
    insert last_commit {
        get name |
        each {
            git show $in --no-patch --format=%as | into datetime
        }
    } |
    sort-by last_commit
}

