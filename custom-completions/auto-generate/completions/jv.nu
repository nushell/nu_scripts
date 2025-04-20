# Show help
extern "jv" [
	--help(-h)					# Show help
	--version(-v)					# Show version
	--quiet(-q)					# Hide errors
	--assert-format(-f)					# Enable format assertions with draft >= 2019
	--assert-content(-c)					# Enable content assertions with draft >= 7
	--insecure(-k)					# Use insecure TLS connection
	--cacert					# Specify a pem-file to verify the peers
	--map(-m)					# Load url with a prefix from the directory
	...args
]