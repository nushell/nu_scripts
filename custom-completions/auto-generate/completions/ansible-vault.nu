# Display version and exit
extern "ansible-vault" [

	...args
]

# Decrypt encrypted file or stdin
extern "ansible-vault decrypt" [

	...args
]

# Encrypt a file or stdin
extern "ansible-vault encrypt" [
	--prompt(-p)					# Prompt for the string to encrypt
	...args
]

# Encrypt string
extern "ansible-vault encrypt_string" [
	--prompt(-p)					# Prompt for the string to encrypt
	...args
]