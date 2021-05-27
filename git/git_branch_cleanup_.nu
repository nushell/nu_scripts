# Script that remove outdated local branches from a git repo
# More information on this article https://www.techwatching.dev/posts/cleaning-git-branches

git branch -vl '*/*' | lines | split column " " BranchName Hash Status --collapse-empty | where Status == '[gone]' | each { git branch -D $it.BranchName } 