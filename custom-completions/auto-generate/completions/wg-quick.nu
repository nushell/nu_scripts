# Add and set up an interface
extern "wg-quick up" [

	...args
]

# Tear down and remove an interface
extern "wg-quick down" [

	...args
]

# Output config for use with wg
extern "wg-quick strip" [

	...args
]

# Saves the configuration of an existing interface
extern "wg-quick save" [

	...args
]