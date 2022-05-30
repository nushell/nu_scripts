# List all modules for type
extern "msfvenom" [
	--list(-l)					# List all modules for type
	--payload(-p)					# Payload to use
	--list-options					# List options for payload
	--format(-f)					# Output format
	--encoder(-e)					# The encoder to use
	--smallest					# Generate the smallest possible payload
	--encrypt					# Type of encryption to apply to the shellcode
	--arch(-a)					# The architecture to use
	--platform					# The platform to use
	--pad-nops					# Use nopsled size as total payload size
	--keep(-k)					# Inject the payload as a new thread (for template)
	--help(-h)					# Show help message
	...args
]