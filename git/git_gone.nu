# gently try to delete merged branches, excluding the checked out one
# This is an alternative to git_branchcleanup.nu
git branch --merged | lines | where $it !~ '*' | str trim | where $it != 'master' && $it != 'main' | each { git branch -d $it }
