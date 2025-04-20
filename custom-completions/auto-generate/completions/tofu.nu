# Print version information
extern "tofu" [

	...args
]

# Build or change infrastructure
extern "tofu apply" [

	...args
]

# Destroy infrastructure
extern "tofu destroy" [

	...args
]

# Interactive console for Terraform interpolations
extern "tofu console" [

	...args
]

# Rewrite config files to canonical format
extern "tofu fmt" [

	...args
]

# Download and install modules for the configuration
extern "tofu get" [

	...args
]

# Create a visual graph of Terraform resources
extern "tofu graph" [

	...args
]

# Import existing infrastructure into Terraform
extern "tofu import" [

	...args
]

# Initialize a new or existing Terraform configuration
extern "tofu init" [

	...args
]

# Retrieves auth token for the given hostname
extern "tofu login" [

	...args
]

# Removes auth token for the given hostname
extern "tofu logout" [

	...args
]

# Read an output from a state file
extern "tofu output" [

	...args
]

# Generate and show an execution plan
extern "tofu plan" [

	...args
]

# Print tree of modules with their provider requirements
extern "tofu providers" [

	...args
]

# 
extern "tofu lock mirror schema" [

	...args
]

# Update local state file against real resources
extern "tofu refresh" [

	...args
]

# Inspect Terraform state or plan
extern "tofu show" [

	...args
]

# List resources in state
extern "tofu list" [

	...args
]

# Move an item in the state
extern "tofu mv" [

	...args
]

# Pull current state and output to stdout
extern "tofu pull" [

	...args
]

# Update remote state from local state
extern "tofu push" [

	...args
]

# Replace provider in the state
extern "tofu replace-provider" [

	...args
]

# Remove instance from the state
extern "tofu rm" [

	...args
]

# Manually mark a resource for recreation
extern "tofu taint" [

	...args
]

# Runs automated test of shared modules
extern "tofu test" [

	...args
]

# Manually unmark a resource as tainted
extern "tofu untaint" [

	...args
]

# Validate the Terraform files
extern "tofu validate" [

	...args
]

# Print the Terraform version
extern "tofu version" [

	...args
]

# Workspace management
extern "tofu workspace" [

	...args
]

# Select an workspace
extern "tofu select" [

	...args
]

# Create a new workspace
extern "tofu new" [

	...args
]

# Delete an existing workspace
extern "tofu delete" [

	...args
]