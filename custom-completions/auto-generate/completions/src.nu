# Displays help for commands
extern "src help" [
	--patch(-u)					# Print unified-format diff
	...args
]

# 
extern "src intro revisions commands commit amend checkout cat status log list diff fast-export fast-import ignores" [
	--patch(-u)					# Print unified-format diff
	...args
]

# Enters a commit for the specified files
extern "src commit" [
	--patch(-u)					# Print unified-format diff
	...args
]

# Further edit commit message
extern "src" [
	--patch(-u)					# Print unified-format diff
	...args
]

# List tags
extern "src list" [
	--patch(-u)					# Print unified-format diff
	...args
]