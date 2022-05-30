# Print version information
extern "terraform" [

	...args
]

# Build or change infrastructure
extern "terraform apply" [

	...args
]

# Destroy infrastructure
extern "terraform destroy" [

	...args
]

# Interactive console for Terraform interpolations
extern "terraform console" [

	...args
]

# Rewrite config files to canonical format
extern "terraform fmt" [

	...args
]

# Download and install modules for the configuration
extern "terraform get" [

	...args
]

# Create a visual graph of Terraform resources
extern "terraform graph" [

	...args
]

# Import existing infrastructure into Terraform
extern "terraform import" [

	...args
]

# Initialize a new or existing Terraform configuration
extern "terraform init" [

	...args
]

# Retrieves auth token for the given hostname
extern "terraform login" [

	...args
]

# Removes auth token for the given hostname
extern "terraform logout" [

	...args
]

# Read an output from a state file
extern "terraform output" [

	...args
]

# Generate and show an execution plan
extern "terraform plan" [

	...args
]

# Print tree of modules with their provider requirements
extern "terraform providers" [

	...args
]

# 
extern "terraform lock mirror schema" [

	...args
]

# Update local state file against real resources
extern "terraform refresh" [

	...args
]

# Inspect Terraform state or plan
extern "terraform show" [

	...args
]

# List resources in state
extern "terraform list" [

	...args
]

# Move an item in the state
extern "terraform mv" [

	...args
]

# Pull current state and output to stdout
extern "terraform pull" [

	...args
]

# Update remote state from local state
extern "terraform push" [

	...args
]

# Replace provider in the state
extern "terraform replace-provider" [

	...args
]

# Remove instance from the state
extern "terraform rm" [

	...args
]

# Manually mark a resource for recreation
extern "terraform taint" [

	...args
]

# Runs automated test of shared modules
extern "terraform test" [

	...args
]

# Manually unmark a resource as tainted
extern "terraform untaint" [

	...args
]

# Validate the Terraform files
extern "terraform validate" [

	...args
]

# Print the Terraform version
extern "terraform version" [

	...args
]

# Workspace management
extern "terraform workspace" [

	...args
]

# Select an workspace
extern "terraform select" [

	...args
]

# Create a new workspace
extern "terraform new" [

	...args
]

# Delete an existing workspace
extern "terraform delete" [

	...args
]