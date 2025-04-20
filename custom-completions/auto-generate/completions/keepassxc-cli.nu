# Show debug info
extern "keepassxc-cli" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Add a new entry
extern "keepassxc-cli add" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Analyze password for weakness and problem
extern "keepassxc-cli analyze" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Copy an entry's password to the clipboard
extern "keepassxc-cli clip" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Close the currently opened database
extern "keepassxc-cli close" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Create new database
extern "keepassxc-cli create" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Generate a new random diceware passphrase
extern "keepassxc-cli diceware" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Edit an entry
extern "keepassxc-cli edit" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Estimate the entropy of a password
extern "keepassxc-cli estimate" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Exit interactive mode
extern "keepassxc-cli exit" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Export the contents to stdout
extern "keepassxc-cli export" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Generate a new password
extern "keepassxc-cli generate" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
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
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Import the contents
extern "keepassxc-cli import" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Find entries quickly
extern "keepassxc-cli locate" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# List database entries
extern "keepassxc-cli ls" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Merge two databases
extern "keepassxc-cli merge" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Add a new group
extern "keepassxc-cli mkdir" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Move an entry
extern "keepassxc-cli mv" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Open a database
extern "keepassxc-cli open" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Exit interactive mode
extern "keepassxc-cli quit" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Remove an entry
extern "keepassxc-cli rm" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Remove a group
extern "keepassxc-cli rmdir" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]

# Show an entry's info
extern "keepassxc-cli show" [
	--debug-info					# Show debug info
	--no-password					# Deactivate the password key
	--help(-h)					# Show help info
	--version(-v)					# Show version info
	--no-password-from					# Deactivate the password key to merge from
	--yubikey-from					# Yubikey slot for the second database
	--same-credentials(-s)					# Use the same credentials for both databases
	--url					# URL for the entry
	--password-prompt					# Prompt for the entry's password
	--generate(-g)					# Generate a password for the entry
	--advanced(-a)					# Perform advanced analysis on the password
	--totp(-t)					# Copy the current TOTP to the clipboard
	--show-protected(-s)					# Show the protected attributes in clear text
	--totp(-t)					# Show the entry's current TOTP
	--recursive(-R)					# Recursively list the elements of the group
	--flatten(-f)					# Flattens the output to single line
	--lower(-l)					# Use lowercase chars
	--upper(-U)					# Use uppercase chars
	--numeric(-n)					# Use numbers
	--special(-s)					# Use special chars
	--extended(-e)					# Use extended ASCII
	--exclude-similar					# Exclude similar looking chars
	--every-group					# Include chars from every selected group
	...args
]