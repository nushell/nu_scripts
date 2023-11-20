# rbenv
export-env {
    load-env {
        PATH: ($env.PATH | split row (char esep) | prepend [$"($env.HOME)/.rbenv/bin" $"($env.HOME)/.rbenv/shims"])
        RBENV_VERSION: ""
        RBENV_VERSION_OLD: ""
        RBENV_SHELL: "nu"
    }
}

export def --env main [
	command?: string@'nu-complete rbenv',
	...args
] {
    let new_env = if $command in ["rehash", "shell"] {
        # implement each on indiviudaly e.g.
        if $command == "shell" {
            { RBENV_VERSION_OLD: $env.RBENV_VERSION RBENV_VERSION: $args.0 }
        } else {
            error make { msg: $"`($command)` command is not supported yet" }
        }
    } else {
    	if ($command | is-empty) {
    		^rbenv
    	} else {
        	^rbenv $command $args
    	}
        {}
    }
    load-env $new_env
}

def 'nu-complete rbenv' [] {
    ^rbenv help
    | lines
    | where ($it | str starts-with "   ")
    | each {|entry| $entry | split row ' ' | get 0 }
}
