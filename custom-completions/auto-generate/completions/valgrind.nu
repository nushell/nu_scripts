[# Skin
extern "" [

	...args
]
# Valgrind-ise children
extern " yes no" [

	...args
]
# Log to file descriptor
extern " 0 1 2 3 4 5 6 7 8 9" [

	...args
]
# Check for memory leaks
extern " no\tDont\ check\ for\ memory\ leaks summary\t'Show a leak summary' full\t'Describe memory leaks in detail'" [

	...args
]
# Show reachable leaked memory
extern " yes\t'Show reachable leaked memory' no\t'Do not show reachable leaked memory'" [

	...args
]
# Determines how willingly Memcheck considers different backtraces to be the same
extern " low\t'Two entries need to match' med\t'Four entries need to match' high\t'All entries need to match'" [

	...args
]
# How to handle loads of words that are partially addressible
extern " yes\t"Do not emit errors on partial loads" no\t"Emit errors on partial loads" [

	...args
]
# Check for memory leaks
extern " no\t'Do not check for memory leaks' summary\t'Show a leak summary' full\t'Describe memory leaks in detail'" [

	...args
]]

[# Display help and exit
extern "valgrind" [

	...args
]
# 
extern "valgrind yes no" [

	...args
]]