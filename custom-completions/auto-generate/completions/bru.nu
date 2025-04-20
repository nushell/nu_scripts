# Show help
extern "bru" [
	--help(-h)					# Show help
	--version					# Show version number
	--cacert					# CA certificate to verify peer against
	--env					# Environment variables
	--env-var					# Overwrite a single environment variable, multiple usages possible
	--output(-o)					# Path to write file results to
	--format(-f)					# Format of the file results
	--insecure					# Allow insecure connections
	--tests-only					# Only run requests that have a test
	--bail					# Stop execution after a failure of a request, test or assertion
	...args
]

# Run a request
extern "bru run" [
	--help(-h)					# Show help
	--version					# Show version number
	--cacert					# CA certificate to verify peer against
	--env					# Environment variables
	--env-var					# Overwrite a single environment variable, multiple usages possible
	--output(-o)					# Path to write file results to
	--format(-f)					# Format of the file results
	--insecure					# Allow insecure connections
	--tests-only					# Only run requests that have a test
	--bail					# Stop execution after a failure of a request, test or assertion
	...args
]