# Show help
extern "xsp" [
	--help					# Show help
	--version					# Show version
	--appconfigdir
	--applications
	--master					# Use this instance by mod_mono to create ASP.NET applications on demand
	--no-hidden					# Do not protect hidden files/directories from being accessed by clients
	--https					# Enable HTTPS support on the server
	--https-client-accept					# Like --https enable HTTPS support on the server
	--https-client-require					# Like --https enable HTTPS support on the server
	--terminate					# Gracefully terminates a running mod-mono-server instance
	--verbose					# Show more messages
	...args
]