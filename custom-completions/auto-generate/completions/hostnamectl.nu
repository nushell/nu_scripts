# 
extern "hostnamectl" [
	--no-ask-password					# Don't query for authentication for privileged operations
	--static					# Get or set static hostname
	--transient					# Get or set transient hostname
	--pretty					# Get or set pretty hostname
	--help(-h)					# Print short help
	--version					# Print version
	--json					# Show output as JSON
	...args
]