# Save authtoken to configuration file
extern "ngrok authtoken" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]

# Prints author and licensing information
extern "ngrok credits" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]

# Start an HTTP tunnel
extern "ngrok http" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]

# Start tunnels by name from the configuration file
extern "ngrok start" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]

# Start a TCP tunnel
extern "ngrok tcp" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]

# Start a TLS tunnel
extern "ngrok tls" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]

# Update ngrok to the latest version
extern "ngrok update" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]

# Print the version string
extern "ngrok version" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]

# Shows a list of commands or help for one command
extern "ngrok help" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]

# 
extern "ngrok" [
	--help
	--inspect					# enable/disable http introspection
	--all					# start all tunnels in the configuration file
	--none					# start running no tunnels
	...args
]