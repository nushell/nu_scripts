# 
extern "" [

	...args
]

# Show all refs (branches, tags, etc.)
extern "gitk" [
	--all					# Show all refs (branches, tags, etc.)
	--date-order					# Sort commits by date when possible
	--merge					# On a merge conflict, show commits that modify conflicting files
	--left-right					# Mark which side of a symmetric difference a commit is reachable from
	--full-history					# When filtering history with -- path..., do not prune some history
	--simplify-merges					# Hide needless merges from history
	--ancestry-path					# Only display commits that exist directly on the ancestry chain between the range
	--argscmd=					# Command to be run to determine th revision range to show
	--select-commit=					# Select the specified commit after loading the graph, instead of HEAD
	--select-commit=HEAD					# Select the specified commit after loading the graph, instead of HEAD
	...args
]