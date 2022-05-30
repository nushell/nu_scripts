# Display help and exit
extern "speedtest-cli" [
	--help(-h)					# Display help and exit
	--no-download					# Do not perform download test
	--no-upload					# Do not perform upload test
	--single					# Only use a single connection. Simulates typical file transfer
	--bytes					# Display values in bytes. Ignored by JSON or CSV output
	--share					# Generate a URL to the speedtest.net share results image
	--simple					# Suppress verbose output
	--csv					# Only show basic information in CSV format (bits/s)
	--csv-header					# Print CSV headers
	--json					# Only show basic information in JSON format (bits/s)
	--list					# Display a list of speedtest.net servers sorted by distance
	--secure					# Use HTTPS instead of HTTP with speedtest.net operated servers
	--no-pre-allocate					# Do not pre allocate upload data
	--version					# Show the version number and exit
	...args
]