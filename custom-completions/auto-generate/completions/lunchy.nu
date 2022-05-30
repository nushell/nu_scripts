# Show command executions
extern "lunchy" [

	...args
]

# Installs [file] to ~/Library/LaunchAgents or /Library/LaunchAgents
extern "lunchy install" [

	...args
]

# Show the list of installed agents
extern "lunchy ls list" [

	...args
]

# Start the first matching agent
extern "lunchy start" [
	--write(-w)					# Persist command
	--force(-F)					# Force start (disabled) agents
	...args
]

# Stop the first matching agent
extern "lunchy stop" [
	--write(-w)					# Persist command
	...args
]

# Stop and start the first matching agent
extern "lunchy restart" [

	...args
]

# Show the PID and label for all agents
extern "lunchy status" [

	...args
]

# Opens the launchctl daemon file in the default editor
extern "lunchy edit" [

	...args
]