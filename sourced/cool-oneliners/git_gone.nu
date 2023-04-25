# gently try to delete merged branches, excluding the checked out one
git branch --merged | lines | where $it !~ '\*' | str trim | where $it != 'master' and $it != 'main' | each { |it| git branch -d $it }
