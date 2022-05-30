# More information about a command
extern "k3d" [

	...args
]

# Manage cluster(s)
extern "k3d cluster" [
	--help(-h)					# Print usage
	...args
]

# Show k3d and default k3s version
extern "k3d version" [

	...args
]

# Handle container images
extern "k3d image" [
	--help(-h)					# Print usage
	...args
]

# Manage kubeconfig(s)
extern "k3d kubeconfig" [
	--all(-a)					# Get kubeconfig from all existing clusters
	--help(-h)					# Print usage
	...args
]

# Manage node(s)
extern "k3d node" [
	--help(-h)					# Print usage
	...args
]

# Create a new cluster
extern "k3d create" [

	...args
]

# List cluster(s)
extern "k3d list" [

	...args
]

# Delete cluster(s)
extern "k3d delete" [

	...args
]

# Start existing k3d cluster(s)
extern "k3d start" [

	...args
]

# Stop existing k3d cluster(s)
extern "k3d stop" [

	...args
]

# Import image(s) from docker into k3d cluster(s)
extern "k3d import" [

	...args
]

# Print usage
extern "k3d help" [

	...args
]

# Get kubeconfig from cluster(s)
extern "k3d get" [
	--all(-a)					# Get kubeconfig from all existing clusters
	...args
]

# Merge/write kubeconfig(s) from cluster(s) into existing kubeconfig/file
extern "k3d merge" [
	--all(-a)					# Get kubeconfig from all existing clusters
	...args
]