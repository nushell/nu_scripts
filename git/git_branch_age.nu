# Creates a table listing the branches of a git repository and the day of the last commit
git branch | lines | str substring 2, | wrap name | insert "last commit" {
    get name | each {
        git show $it --no-patch --format=%as
    }
} | sort-by "last commit"
