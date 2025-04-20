# Control validation behaviour of pyc files
extern "python default always never" [
	--check-hash-based-pycs					# Control validation behaviour of pyc files
	--help(-?)					# Display help and exit
	--version(-V)					# Display version and exit
	...args
]

# Debug on
extern "python" [
	--check-hash-based-pycs					# Control validation behaviour of pyc files
	--help(-?)					# Display help and exit
	--version(-V)					# Display version and exit
	...args
]