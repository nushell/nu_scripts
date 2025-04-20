# Skip the interactive TUI and validate against CI rules
extern "dive" [
	--ci					# Skip the interactive TUI and validate against CI rules
	--ci-config					# If CI=true in the environment, use the given yaml to drive validation rules
	--config					# Config file
	--help(-h)					# Help for dive
	--ignore-errors(-i)					# Ignore image parsing errors and run the analysis anyway
	--source					# The container engine to fetch the image from
	--version(-v)					# Display version number
	...args
]

# The container engine to fetch the image from
extern "dive docker podman docker-archive" [
	--ci					# Skip the interactive TUI and validate against CI rules
	--ci-config					# If CI=true in the environment, use the given yaml to drive validation rules
	--config					# Config file
	--help(-h)					# Help for dive
	--ignore-errors(-i)					# Ignore image parsing errors and run the analysis anyway
	--source					# The container engine to fetch the image from
	--version(-v)					# Display version number
	...args
]

# 
extern "dive build help version" [
	--ci					# Skip the interactive TUI and validate against CI rules
	--ci-config					# If CI=true in the environment, use the given yaml to drive validation rules
	--config					# Config file
	--help(-h)					# Help for dive
	--ignore-errors(-i)					# Ignore image parsing errors and run the analysis anyway
	--source					# The container engine to fetch the image from
	--version(-v)					# Display version number
	...args
]