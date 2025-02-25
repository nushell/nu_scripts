# Search terms in the specified files and/or folders based on the glob pattern provided.
def "find in" [
	glob: glob, # The glob expression
	--exclude (-e): list<string> # Patterns to exclude from the search: `find in` will not walk the inside of directories matching the excluded patterns.
	...rest: any # Terms to find
]: nothing -> table<path: string, line: int, data: string> {
	glob --exclude $exclude --no-dir $glob
		| par-each {|e|
			open --raw $e | lines | enumerate | rename line data |
			find --columns [data] ...$rest |
			each {|match| {path: ($e | path relative-to $env.PWD), ...$match}}
	} | flatten
}
