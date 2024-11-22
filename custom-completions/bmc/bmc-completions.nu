# completions for botmaker-cli

def "nu-complete list client actions" [] {
    glob **/*.js --depth 2 | path basename
}

export extern "bmc" [
    command?: string    # command
    --help              # Show help
    --version           # Show version number
]

# Run a Botmaker Client Action Script
export extern "bmc run" [
    source: string@"nu-complete list client actions"  # client action to run
    --help              # Show help
    --version           # Show version number
]

# Import a new business from a token
export extern "bmc import" [
    apiToken: string      # command
    --help              # Show help
    --version           # Show version number
]

# Load context for a customer
export extern "bmc set-customer" [
    customerId: string  # command
    --help              # Show help
    --version           # Show version number
]

# Show change status
export extern "bmc status" [
    caName?: string@"nu-complete list client actions"  # client action to check
    --help              # Show help
    --version           # Show version number
]

# Diff client actions states
export extern "bmc diff" [
    caName: string@"nu-complete list client actions"  # client action to check
    code: string        # command
    --help              # Show help
    --version           # Show version number
    --vs-code(-v)       # Open in vs-code
]

# Pull incoming changes
export extern "bmc pull" [
    caName?: string@"nu-complete list client actions"  # client action to pull
    --help              # Show help
    --version           # Show version number
]

# Create a new client action
export extern "bmc new" [
    caName: string      # command
    --help              # Show help
    --version           # Show version number
]

# Push changes in client action
export extern "bmc push" [
    caName?: string@"nu-complete list client actions"  # client action to push
    --help              # Show help
    --version           # Show version number
]

# Publish changes in client action
export extern "bmc publish" [
    caName: string@"nu-complete list client actions"  # client action to publish
    --help              # Show help
    --version           # Show version number
]

# Renames the given client action
export extern "bmc rename" [
    caOldName: string@"nu-complete list client actions"  # client action to rename
    caNewName: string      # new name
    --help              # Show help
    --version           # Show version number
]
