# Codex CLI completions for Nushell
# Based on Codex 0.148.0 help and its generated Bash completion.

def "nu-complete codex sandbox" [] {
    [read-only workspace-write danger-full-access]
}

def "nu-complete codex approval-policy" [] {
    [untrusted on-request never]
}

def "nu-complete codex local-provider" [] {
    [lmstudio ollama]
}

def "nu-complete codex color" [] {
    [always never auto]
}

def "nu-complete codex shell" [] {
    [bash elvish fish powershell zsh]
}

def "nu-complete codex ws-auth" [] {
    [none token shared-secret]
}

def "nu-complete codex bool" [] {
    [true false]
}

# Start an interactive Codex session.
export extern codex [
    prompt?: string                                      # Optional prompt to start the session
    --config(-c): string                                 # Override a configuration value
    --enable: string                                     # Enable a feature
    --disable: string                                    # Disable a feature
    --remote: string                                     # Connect to a remote app server endpoint
    --remote-auth-token-env: string                      # Environment variable containing the remote bearer token
    --strict-config                                      # Reject unrecognized configuration fields
    --image(-i): path                                    # Attach an image to the prompt
    --model(-m): string                                  # Model to use
    --oss                                                # Use an open-source provider
    --local-provider: string@"nu-complete codex local-provider" # Open-source provider
    --profile(-p): string                                # Configuration profile
    --sandbox(-s): string@"nu-complete codex sandbox"    # Sandbox policy
    --approve-for-me                                     # Automatically review approval requests
    --dangerously-bypass-approvals-and-sandbox           # Disable approvals and sandboxing
    --dangerously-bypass-hook-trust                      # Run hooks without persisted trust
    --cd(-C): path                                       # Working directory
    --add-dir: path                                      # Additional writable directory
    --ask-for-approval(-a): string@"nu-complete codex approval-policy" # Approval policy
    --search                                             # Enable web search
    --no-alt-screen                                      # Disable alternate-screen mode
    --help(-h)                                           # Show help
    --version(-V)                                        # Show version
]

# Run Codex non-interactively.
export extern "codex exec" [
    prompt?: string                                      # Initial prompt, or read it from stdin
    --image(-i): path                                    # Attach an image
    --profile(-p): string                                # Configuration profile
    --sandbox(-s): string@"nu-complete codex sandbox"    # Sandbox policy
    --cd(-C): path                                       # Working directory
    --model(-m): string                                  # Model to use
    --output-last-message(-o): path                      # Write the final message to a file
    --strict-config                                      # Reject unrecognized configuration fields
    --oss                                                # Use an open-source provider
    --local-provider: string@"nu-complete codex local-provider" # Open-source provider
    --approve-for-me                                     # Automatically review approval requests
    --add-dir: path                                      # Additional writable directory
    --dangerously-bypass-approvals-and-sandbox           # Disable approvals and sandboxing
    --dangerously-bypass-hook-trust                      # Run hooks without persisted trust
    --skip-git-repo-check                                # Allow running outside a Git repository
    --ephemeral                                          # Do not persist session files
    --ignore-user-config                                 # Ignore user configuration
    --ignore-rules                                       # Ignore repository instruction files
    --output-schema: path                                # JSON Schema for the final response
    --color: string@"nu-complete codex color"             # Output color mode
    --json                                               # Emit JSONL events
    --config(-c): string                                 # Override a configuration value
    --enable: string                                     # Enable a feature
    --disable: string                                    # Disable a feature
    --help(-h)                                           # Show help
    --version(-V)                                        # Show version
]

# Alias for `codex exec`.
export extern "codex e" [
    prompt?: string
    --help(-h)
]

# Resume a non-interactive session.
export extern "codex exec resume" [
    session_id?: string
    prompt?: string
    --last                                               # Resume the most recent session
    --all                                                # Show all sessions
    --image(-i): path
    --model(-m): string
    --output-last-message(-o): path
    --strict-config
    --dangerously-bypass-approvals-and-sandbox
    --dangerously-bypass-hook-trust
    --skip-git-repo-check
    --ephemeral
    --ignore-user-config
    --ignore-rules
    --output-schema: path
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Fork a non-interactive session.
export extern "codex exec fork" [
    session_id: string
    prompt?: string
    --image(-i): path
    --model(-m): string
    --output-last-message(-o): path
    --strict-config
    --dangerously-bypass-approvals-and-sandbox
    --dangerously-bypass-hook-trust
    --skip-git-repo-check
    --ephemeral
    --ignore-user-config
    --ignore-rules
    --output-schema: path
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Run a non-interactive code review.
export extern "codex exec review" [
    prompt?: string
    --uncommitted                                       # Review staged, unstaged, and untracked changes
    --base: string                                      # Review changes against a base branch
    --commit: string                                    # Review a commit
    --title: string                                     # Optional review title
    --model(-m): string
    --output-last-message(-o): path
    --strict-config
    --dangerously-bypass-approvals-and-sandbox
    --dangerously-bypass-hook-trust
    --skip-git-repo-check
    --ephemeral
    --ignore-user-config
    --ignore-rules
    --output-schema: path
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Run a code review non-interactively.
export extern "codex review" [
    prompt?: string
    --strict-config
    --uncommitted                                       # Review all local changes
    --base: string                                      # Review against a base branch
    --commit: string                                    # Review a commit
    --title: string                                     # Review title
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Manage authentication.
export extern "codex login" [
    --with-api-key                                      # Read an API key from stdin
    --with-access-token                                 # Read an access token from stdin
    --api-key: string                                   # API key
    --device-auth                                       # Use device-code authentication
    --experimental_issuer: string                       # Experimental OAuth issuer
    --experimental_client-id: string                    # Experimental OAuth client ID
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex login status" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex logout" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Manage MCP servers.
export extern "codex mcp" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex mcp list" [
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex mcp get" [
    name: string
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex mcp add" [
    name: string
    ...command: string                                  # Command for a stdio server
    --env: string                                       # Environment variable (KEY=VALUE)
    --url: string                                       # URL for a streamable HTTP server
    --bearer-token-env-var: string                      # Bearer-token environment variable
    --oauth-client-id: string
    --oauth-client-registration: string
    --oauth-resource: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex mcp remove" [
    name: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex mcp login" [
    name: string
    --scopes: string
    --oauth-client-registration: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex mcp logout" [
    name: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Start Codex as an MCP server over stdio.
export extern "codex mcp-server" [
    --strict-config
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Manage Codex plugins.
export extern "codex plugin" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex plugin add" [
    plugin: string                                      # PLUGIN[@MARKETPLACE]
    --marketplace(-m): string
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex plugin list" [
    --marketplace(-m): string
    --json
    --available
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex plugin remove" [
    plugin: string                                      # PLUGIN[@MARKETPLACE]
    --marketplace(-m): string
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex plugin marketplace" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex plugin marketplace add" [
    source: string
    --ref: string
    --sparse: string
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex plugin marketplace list" [
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex plugin marketplace upgrade" [
    marketplace_name?: string
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex plugin marketplace remove" [
    marketplace_name: string
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Run the experimental app server.
export extern "codex app-server" [
    --code-mode-host: string
    --strict-config
    --listen: string
    --stdio
    --remote-control
    --analytics-default-enabled: string@"nu-complete codex bool"
    --ws-auth: string@"nu-complete codex ws-auth"
    --ws-token-file: path
    --ws-token-sha256: string
    --ws-shared-secret-file: path
    --ws-issuer: string
    --ws-audience: string
    --ws-max-clock-skew-seconds: int
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server daemon" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server daemon bootstrap" [
    --remote-control
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server daemon start" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server daemon restart" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server daemon enable-remote-control" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server daemon disable-remote-control" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server daemon stop" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server daemon version" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server daemon pid-update-loop" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server proxy" [
    --sock: path
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server generate-ts" [
    --out(-o): path
    --prettier(-p): path
    --experimental
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server generate-json-schema" [
    --out(-o): path
    --experimental
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex app-server generate-internal-json-schema" [
    --out(-o): path
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Manage the app-server daemon with remote control enabled.
export extern "codex remote-control" [
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex remote-control start" [
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex remote-control stop" [
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex remote-control pair" [
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Launch the Codex Desktop app.
export extern "codex app" [
    path?: path
    --download-url: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Generate shell completion scripts.
export extern "codex completion" [
    shell?: string@"nu-complete codex shell"
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex update" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Diagnose the local Codex installation.
export extern "codex doctor" [
    --json
    --summary
    --all
    --no-color
    --ascii
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Run a command in a Codex-provided sandbox.
export extern "codex sandbox" [
    ...command: string
    --sandbox-state-json: string
    --sandbox-state-readable-root: path
    --sandbox-state-disable-network
    --permission-profile(-P): string
    --profile(-p): string
    --cd(-C): path
    --include-managed-config
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Debugging tools.
export extern "codex debug" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex debug models" [
    --bundled
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex debug app-server" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex debug app-server send-message-v2" [
    user_message: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex debug prompt-input" [
    prompt?: string
    --image(-i): path
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex debug trace-reduce" [
    trace_bundle: path
    --output(-o): path
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex debug clear-memories" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Check a command against Codex execution-policy rules.
export extern "codex execpolicy" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex execpolicy check" [
    ...command: string
    --rules(-r): path
    --pretty
    --resolve-host-executables
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Apply the latest diff produced by a Codex task.
export extern "codex apply" [
    task_id: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Alias for `codex apply`.
export extern "codex a" [
    task_id: string
    --help(-h)
]

# Resume an interactive session.
export extern "codex resume" [
    session_id?: string
    prompt?: string
    --last
    --all
    --include-non-interactive
    --remote: string
    --remote-auth-token-env: string
    --strict-config
    --image(-i): path
    --model(-m): string
    --oss
    --local-provider: string@"nu-complete codex local-provider"
    --profile(-p): string
    --sandbox(-s): string@"nu-complete codex sandbox"
    --dangerously-bypass-hook-trust
    --cd(-C): path
    --add-dir: path
    --dangerously-bypass-approvals-and-sandbox
    --approve-for-me
    --ask-for-approval(-a): string@"nu-complete codex approval-policy"
    --search
    --no-alt-screen
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
    --version(-V)
]

# Fork an interactive session.
export extern "codex fork" [
    session_id?: string
    prompt?: string
    --last
    --all
    --remote: string
    --remote-auth-token-env: string
    --strict-config
    --image(-i): path
    --model(-m): string
    --oss
    --local-provider: string@"nu-complete codex local-provider"
    --profile(-p): string
    --sandbox(-s): string@"nu-complete codex sandbox"
    --dangerously-bypass-hook-trust
    --cd(-C): path
    --add-dir: path
    --dangerously-bypass-approvals-and-sandbox
    --approve-for-me
    --ask-for-approval(-a): string@"nu-complete codex approval-policy"
    --search
    --no-alt-screen
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
    --version(-V)
]

export extern "codex archive" [
    session: string
    --remote: string
    --remote-auth-token-env: string
    --image(-i): path
    --model(-m): string
    --oss
    --local-provider: string@"nu-complete codex local-provider"
    --profile(-p): string
    --sandbox(-s): string@"nu-complete codex sandbox"
    --approve-for-me
    --dangerously-bypass-approvals-and-sandbox
    --dangerously-bypass-hook-trust
    --cd(-C): path
    --add-dir: path
    --strict-config
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex unarchive" [
    session: string
    --remote: string
    --remote-auth-token-env: string
    --image(-i): path
    --model(-m): string
    --oss
    --local-provider: string@"nu-complete codex local-provider"
    --profile(-p): string
    --sandbox(-s): string@"nu-complete codex sandbox"
    --approve-for-me
    --dangerously-bypass-approvals-and-sandbox
    --dangerously-bypass-hook-trust
    --cd(-C): path
    --add-dir: path
    --strict-config
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex delete" [
    session: string
    --force
    --remote: string
    --remote-auth-token-env: string
    --image(-i): path
    --model(-m): string
    --oss
    --local-provider: string@"nu-complete codex local-provider"
    --profile(-p): string
    --sandbox(-s): string@"nu-complete codex sandbox"
    --approve-for-me
    --dangerously-bypass-approvals-and-sandbox
    --dangerously-bypass-hook-trust
    --cd(-C): path
    --add-dir: path
    --strict-config
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex migrate-rollouts" [
    --apply
    --thread: string
    --max-mib-per-second: number
    --json
    --verbose
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Browse Codex Cloud tasks and apply changes locally.
export extern "codex cloud" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
    --version(-V)
]

export extern "codex cloud exec" [
    query?: string
    --env: string
    --attempts: int
    --branch: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex cloud status" [
    task_id: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex cloud list" [
    --env: string
    --limit: int
    --cursor: string
    --json
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex cloud apply" [
    task_id: string
    --attempt: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex cloud diff" [
    task_id: string
    --attempt: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Run the standalone exec-server service.
export extern "codex exec-server" [
    --strict-config
    --concurrent-requests: int
    --listen: string
    --remote: string
    --environment-id: string
    --name: string
    --use-agent-identity-auth
    --exit-on-stdin-close
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Inspect feature flags.
export extern "codex features" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex features list" [
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex features enable" [
    feature: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex features disable" [
    feature: string
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

# Internal utility commands included by Codex's generated completion.
export extern "codex responses-api-proxy" [
    --port: int
    --server-info: path
    --http-shutdown
    --upstream-url: string
    --dump-dir: path
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]

export extern "codex stdio-to-uds" [
    socket_path: path
    --config(-c): string
    --enable: string
    --disable: string
    --help(-h)
]
