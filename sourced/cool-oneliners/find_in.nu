# Search terms in the specified files and/or folders based on the glob pattern provided.
def "find in" [
	glob: glob, # the glob expression
	...rest: any # terms to search
]: nothing -> table<path: string, line: int, data: string> {
	glob --no-dir $glob
		| par-each {|e|
			open $e | lines | enumerate | rename line data |
			find --columns [data] ...$rest |
			each {|match| {path: ($e | path relative-to $env.PWD), ...$match}}
	} | flatten
}
