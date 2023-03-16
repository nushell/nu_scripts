#!/usr/bin/env nu
#
# Remove any local git branch no longer being tracked in origin / remote repo.
# To be used as stand-alone script.

git branch -vl | lines | split column " " BranchName Hash Status --collapse-empty | where Status == '[gone]' | each { |it| git branch -D $it.BranchName }
