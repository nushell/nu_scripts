# Describe available commands or one specific command
extern "kitchen help" [

	...args
]

# Lists one or more instances
extern "kitchen list" [
	--bare(-b)					# List the name of each instance only, one per line
	--debug(-d)					# [Deprecated] Please use `kitchen diagnose'
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	...args
]

# List the name of each instance only, one per line
extern "kitchen" [

	...args
]

# Show computed diagnostic configuration
extern "kitchen diagnose" [
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	...args
]

# Change instance state to create. Start one or more instances
extern "kitchen create" [
	--concurrency(-c)					# Run a create against all matching instances concurrently. Only N instances will run at the same time if a number is given. 
	--parallel(-p)					# [Future DEPRECATION, use --concurrency] Run a create against all matching instances concurrently. 
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	...args
]

# Change instance state to converge. Use a provisioner to configure one or more instances
extern "kitchen converge" [
	--concurrency(-c)					# Run a converge against all matching instances concurrently. Only N instances will run at the same time if a number is given. 
	--parallel(-p)					# [Future DEPRECATION, use --concurrency] Run a converge against all matching instances concurrently. 
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	...args
]

# Change instance state to setup. Prepare to run automated tests. Install busser and related gems on one or more instances
extern "kitchen setup" [
	--concurrency(-c)					# Run a setup against all matching instances concurrently. Only N instances will run at the same time if a number is given. 
	--parallel(-p)					# [Future DEPRECATION, use --concurrency] Run a setup against all matching instances concurrently. 
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	...args
]

# Change instance state to verify. Run automated tests on one or more instances
extern "kitchen verify" [
	--concurrency(-c)					# Run a verify against all matching instances concurrently. Only N instances will run at the same time if a number is given. 
	--parallel(-p)					# [Future DEPRECATION, use --concurrency] Run a verify against all matching instances concurrently. 
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	...args
]

# Change instance state to destroy. Delete all information for one or more instances
extern "kitchen destroy" [
	--concurrency(-c)					# Run a destroy against all matching instances concurrently. Only N instances will run at the same time if a number is given. 
	--parallel(-p)					# [Future DEPRECATION, use --concurrency] Run a destroy against all matching instances concurrently. 
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	...args
]

# Test (destroy, create, converge, setup, verify and destroy) one or more instances
extern "kitchen test" [
	--concurrency(-c)					# Run a test against all matching instances concurrently. Only N instances will run at the same time if a number is given. 
	--parallel(-p)					# [Future DEPRECATION, use --concurrency] Run a test against all matching instances concurrently. 
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	...args
]

# Log in to one instance
extern "kitchen login" [
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	...args
]

# Execute command on one or more instance
extern "kitchen exec" [
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	...args
]

# Print Kitchen's version information
extern "kitchen version" [

	...args
]

# Show the Kitchen sink!
extern "kitchen sink" [

	...args
]

# Kitchen Console!
extern "kitchen console" [

	...args
]

# Adds some configuration to your cookbook so Kitchen can rock
extern "kitchen init" [
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Driver subcommands
extern "kitchen driver" [

	...args
]