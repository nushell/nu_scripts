# Describe available commands or one specific command
extern "kitchen help" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Lists one or more instances
extern "kitchen list" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# List the name of each instance only, one per line
extern "kitchen" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Show computed diagnostic configuration
extern "kitchen diagnose" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Change instance state to create. Start one or more instances
extern "kitchen create" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Change instance state to converge. Use a provisioner to configure one or more instances
extern "kitchen converge" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Change instance state to setup. Prepare to run automated tests. Install busser
extern "kitchen setup" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Change instance state to verify. Run automated tests
extern "kitchen verify" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Change instance state to destroy. Delete all information for one or more instances
extern "kitchen destroy" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Test (destroy, create, converge, setup, verify and destroy) one or more instances
extern "kitchen test" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Log in to one instance
extern "kitchen login" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Execute command on one or more instance
extern "kitchen exec" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Print Kitchen's version information
extern "kitchen version" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Show the Kitchen sink!
extern "kitchen sink" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Kitchen Console!
extern "kitchen console" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Adds some configuration to your cookbook so Kitchen can rock
extern "kitchen init" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]

# Driver subcommands
extern "kitchen driver" [
	--bare(-b)					# List the name of each instance only, one per line
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--loader					# Include data loader diagnostics
	--instances					# Include instances diagnostics
	--all					# Include all diagnostics
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run converge concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--concurrency(-c)					# Run concurrently, give number for max instances
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--destroy(-d)					# Destroy strategy to use after testing (passing, always, never).
	--auto_init					# Invoke init command if .kitchen.yml is missing
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--log_level(-l)					# Set the log level (debug, info, warn, error, fatal)
	--command(-c)					# execute via ssh
	--driver(-D)					# One or more Kitchen Driver gems to be installed or added to a Gemfile 
	--provisioner(-P)					# The default Kitchen Provisioner to use 
	--create_gemfile					# Whether or not to create a Gemfile if one does not exist. Default: false 
	...args
]