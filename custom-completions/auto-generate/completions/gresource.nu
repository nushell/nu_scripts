# Select which section to operate on
extern "gresource" [
	--section					# Select which section to operate on
	...args
]

# List resource sections
extern "gresource list" [
	--section					# Select which section to operate on
	...args
]

# List resources with details
extern "gresource details" [
	--section					# Select which section to operate on
	...args
]

# Extract a resource
extern "gresource extract" [
	--section					# Select which section to operate on
	...args
]

# List resource sections
extern "gresource sections" [
	--section					# Select which section to operate on
	...args
]

# Prints help
extern "gresource help" [
	--section					# Select which section to operate on
	...args
]

# Command
extern "gresource list details extract sections help" [
	--section					# Select which section to operate on
	...args
]