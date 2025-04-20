# Show command executions
extern "lunchy" [
	--verbose(-v)					# Show command executions
	--write(-w)					# Persist command
	--force(-F)					# Force start (disabled) agents
	--write(-w)					# Persist command
	...args
]

# Installs [file] to ~/Library/LaunchAgents or /Library/LaunchAgents
extern "lunchy install" [
	--verbose(-v)					# Show command executions
	--write(-w)					# Persist command
	--force(-F)					# Force start (disabled) agents
	--write(-w)					# Persist command
	...args
]

# Show the list of installed agents
extern "lunchy ls list" [
	--verbose(-v)					# Show command executions
	--write(-w)					# Persist command
	--force(-F)					# Force start (disabled) agents
	--write(-w)					# Persist command
	...args
]

# Start the first matching agent
extern "lunchy start" [
	--verbose(-v)					# Show command executions
	--write(-w)					# Persist command
	--force(-F)					# Force start (disabled) agents
	--write(-w)					# Persist command
	...args
]

# Stop the first matching agent
extern "lunchy stop" [
	--verbose(-v)					# Show command executions
	--write(-w)					# Persist command
	--force(-F)					# Force start (disabled) agents
	--write(-w)					# Persist command
	...args
]

# Stop and start the first matching agent
extern "lunchy restart" [
	--verbose(-v)					# Show command executions
	--write(-w)					# Persist command
	--force(-F)					# Force start (disabled) agents
	--write(-w)					# Persist command
	...args
]

# Show the PID and label for all agents
extern "lunchy status" [
	--verbose(-v)					# Show command executions
	--write(-w)					# Persist command
	--force(-F)					# Force start (disabled) agents
	--write(-w)					# Persist command
	...args
]

# Opens the launchctl daemon file in the default editor
extern "lunchy edit" [
	--verbose(-v)					# Show command executions
	--write(-w)					# Persist command
	--force(-F)					# Force start (disabled) agents
	--write(-w)					# Persist command
	...args
]