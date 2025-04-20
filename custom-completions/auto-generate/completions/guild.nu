# 
extern "$command compile\tCompile scripts" [
	--help(-h)					# Show help
	--version					# Show version
	--load-path(-L)
	--output(-o)
	...args
]

# Show help
extern "$command" [
	--help(-h)					# Show help
	--version					# Show version
	--load-path(-L)
	--output(-o)
	...args
]