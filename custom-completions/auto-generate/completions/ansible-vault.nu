# Display version and exit
extern "ansible-vault" [
	--version					# Display version and exit
	--help(-h)					# Show help message and exit
	--verbose(-v)					# Verbose mode (-vvv for more, -vvvv to enable connection debugging)
	--ask-vault-pass					# Ask for vault password
	--prompt(-p)					# Prompt for the string to encrypt
	...args
]

# Decrypt encrypted file or stdin
extern "ansible-vault decrypt" [
	--version					# Display version and exit
	--help(-h)					# Show help message and exit
	--verbose(-v)					# Verbose mode (-vvv for more, -vvvv to enable connection debugging)
	--ask-vault-pass					# Ask for vault password
	--prompt(-p)					# Prompt for the string to encrypt
	...args
]

# Encrypt a file or stdin
extern "ansible-vault encrypt" [
	--version					# Display version and exit
	--help(-h)					# Show help message and exit
	--verbose(-v)					# Verbose mode (-vvv for more, -vvvv to enable connection debugging)
	--ask-vault-pass					# Ask for vault password
	--prompt(-p)					# Prompt for the string to encrypt
	...args
]

# Encrypt string
extern "ansible-vault encrypt_string" [
	--version					# Display version and exit
	--help(-h)					# Show help message and exit
	--verbose(-v)					# Verbose mode (-vvv for more, -vvvv to enable connection debugging)
	--ask-vault-pass					# Ask for vault password
	--prompt(-p)					# Prompt for the string to encrypt
	...args
]