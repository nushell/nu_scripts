# Inspect user
extern "userdbctl user" [

	...args
]

# Inspect group
extern "userdbctl group" [

	...args
]

# Show users that are members of specified group(s)
extern "userdbctl users-in-group" [

	...args
]

# Show groups the specified user(s) is a member of
extern "userdbctl groups-of-user" [

	...args
]

# Show enabled database services
extern "userdbctl services" [

	...args
]

# Show help
extern "userdbctl" [

	...args
]