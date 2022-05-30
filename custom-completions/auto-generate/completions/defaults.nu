# Restricts preferences operations to the current logged-in host
extern "defaults" [

	...args
]

# Shows defaults entire given domain
extern "defaults read" [

	...args
]

# Writes domain or or a key in the domain
extern "defaults write" [

	...args
]

# Shows the type for the given domain, key
extern "defaults read-type" [

	...args
]

# Renames old_key to new_key
extern "defaults rename" [

	...args
]

# Deletes domain or a key in the domain
extern "defaults delete" [

	...args
]

# Prints the names of all domains in the users defaults system
extern "defaults domains" [

	...args
]

# Searches for word in domain names, keys, and values
extern "defaults find" [

	...args
]

# Prints a list of possible command formats
extern "defaults help" [

	...args
]