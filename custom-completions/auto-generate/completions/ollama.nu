# 
extern "ollama" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# Start ollama
extern "ollama serve" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# Create a model from a Modelfile
extern "ollama create" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# Show information for a model
extern "ollama show" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# Run a model
extern "ollama run" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# Pull a model from a registry
extern "ollama pull" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# Push a model to a registry
extern "ollama push" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# List models
extern "ollama list" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# Copy a model
extern "ollama cp" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# Remove a model
extern "ollama rm" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]

# Help about any command
extern "ollama help" [
	--help(-h)					# help for ollama
	--version(-v)					# Show version information
	...args
]