# Combine sets of lines from two files using boolean operations
extern "combine" [

	...args
]

# Output lines that are in both files
extern "combine and" [

	...args
]

# Output lines that are inf file1 but not in file2
extern "combine not" [

	...args
]

# Output lines that are in file1 or in file2
extern "combine or" [

	...args
]

# Output lines that are in either file1 or file2, but not in both files
extern "combine xor" [

	...args
]