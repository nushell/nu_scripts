use std/log
use std/assert

def is-extern-available [command: string] {
	which --all $command | any { $in.type == external }
}

def "assert extern-is-available" [...commands: string] {
	for cmd in $commands {
		assert (which --all $cmd | any { $in.type == external }) --error-label {
			text: $"`($cmd)` not found in PATH"
			span: (metadata $cmd).span
		}
	}
}

export-env {
	assert extern-is-available gh
}

const default_repos = [
	"nushell/new-nu-parser"
	"nushell/nu-ansi-term"
	"nushell/nushell"
	"nushell/nushell.github.io"
	"nushell/nu_scripts"
	"nushell/reedline"
	"nushell/tree-sitter-nu"
	"nushell/vscode-nushell-lang"
]

def fetch-contributor-stats [repo: string]: nothing -> record<name: string, stats: table<login: string, contributions: int>> {
	^gh api /repos/($repo)/contributors --cache 1h --paginate
	| from json
	| select login contributions
	| {
		name: $repo
		stats: $in
	}
}

# Get the total contribution count of contributors across multiple repositories
export def stats [
	repos: list<string> = $default_repos
]: nothing -> table<user: string, contributions: int> {
	$default_repos
	| each {|repo| fetch-contributor-stats $repo }
	| each {|e| $e.stats | rename -c {login: "user" contributions: $e.name} }
	| reduce {|e|
		join --outer $e user
	}
	| transpose --header-row
	| update cells { default --empty 0 }
	| math sum
	| transpose user contributions
	| sort-by --reverse contributions
}

const club_thresholds = [
	20
	50
	100
	250
	500
	1_000
	2_500
	3_000
]

def bounds [thresholds: list<int>] {
	$club_thresholds
	| window 2
	| each {|e|
		{
			name: $e.0
			bounds: ($e.0)..<($e.1)
		}
	}
	| append {name: ($club_thresholds | last) bounds: (($club_thresholds | last)..)}
}

# Group contributors across multiple repositories based on their total contribution count
export def clubs [
	repos: list<string> = $default_repos
	--thresholds: list<int> = $club_thresholds
] {
	let contributions = stats $repos
	let clubs_bounds = bounds $thresholds

	$contributions
	| group-by {|e|
		$clubs_bounds
		| where $e.contributions in $it.bounds
		| try { first | get name }
	}
	| reject ""
}
