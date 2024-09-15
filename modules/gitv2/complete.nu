export def "nu-complete git log" [] {
    git log -n 32 --pretty=%h»¦«%s
    | lines
    | split column "»¦«" value description
    | each { $"($in.value) # ($in.description)"}
}

export def "nu-complete git log all" [] {
    git log --all -n 32 --pretty=%h»¦«%d»¦«%s
    | lines
    | split column "»¦«" value branch description
    | each {|x| $x | update description $"($x.branch) ($x.description)" }
}

export def "nu-complete git branch files" [context: string, offset:int] {
    let token = $context | split row ' '
    let branch = $token | get 1
    let files = $token | skip 2
    git ls-tree -r --name-only $branch
    | lines
    | filter {|x| not ($x in $files)}
}

export def "nu-complete git branches" [] {
    git branch
    | lines
    | filter {|x| not ($x | str starts-with '*')}
    | each {|x| $"($x|str trim)"}
}

export def "nu-complete git remotes" [] {
  ^git remote | lines | each { |line| $line | str trim }
}

