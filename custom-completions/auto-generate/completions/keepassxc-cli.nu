# Show debug info
extern "keepassxc-cli" [

	...args
]

# Add a new entry
extern "keepassxc-cli add" [
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	...args
]

# Analyze password for weakness and problem
extern "keepassxc-cli analyze" [

	...args
]

# Copy an entry's password to the clipboard
extern "keepassxc-cli clip" [
	--totp(-t)					# Copy the current TOTP to the clipboard
	...args
]

# Close the currently opened database
extern "keepassxc-cli close" [

	...args
]

# Create new database
extern "keepassxc-cli create" [

	...args
]

# Generate a new random diceware passphrase
extern "keepassxc-cli diceware" [

	...args
]

# Edit an entry
extern "keepassxc-cli edit" [
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	...args
]

# Estimate the entropy of a password
extern "keepassxc-cli estimate" [
	--advanced(-a)					# Perform advanced analysis on the password
	...args
]

# Exit interactive mode
extern "keepassxc-cli exit" [

	...args
]

# Export the contents to stdout
extern "keepassxc-cli export" [

	...args
]

# Generate a new password
extern "keepassxc-cli generate" [
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Show command help
extern "keepassxc-cli help" [

	...args
]

# Import the contents
extern "keepassxc-cli import" [

	...args
]

# Find entries quickly
extern "keepassxc-cli locate" [

	...args
]

# List database entries
extern "keepassxc-cli ls" [
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	...args
]

# Merge two databases
extern "keepassxc-cli merge" [
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	...args
]

# Add a new group
extern "keepassxc-cli mkdir" [

	...args
]

# Move an entry
extern "keepassxc-cli mv" [

	...args
]

# Open a database
extern "keepassxc-cli open" [

	...args
]

# Exit interactive mode
extern "keepassxc-cli quit" [

	...args
]

# Remove an entry
extern "keepassxc-cli rm" [

	...args
]

# Remove a group
extern "keepassxc-cli rmdir" [

	...args
]

# Show an entry's info
extern "keepassxc-cli show" [
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	...args
]