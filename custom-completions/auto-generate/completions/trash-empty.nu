# show help message
extern "trash-empty" [
	--help(-h)					# show help message
	--print-completion					# print shell completion script
	--version					# show version number
	--verbose(-v)					# list files that will be deleted
	--all-users					# empty trashcan of all users
	--interactive(-i)					# prompt before emptying
	--dry-run					# show which files would have been removed
	...args
]