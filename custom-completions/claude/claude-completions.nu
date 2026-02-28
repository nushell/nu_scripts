# Claude Code CLI completions for Nushell
# Translated from bash completion script

def "nu-complete claude commands" [] {
    [agents auth mcp plugin setup-token doctor update upgrade install]
}

def "nu-complete claude output-format" [] {
    [text json stream-json]
}

def "nu-complete claude input-format" [] {
    [text stream-json]
}

def "nu-complete claude permission-mode" [] {
    [acceptEdits bypassPermissions default dontAsk plan]
}

def "nu-complete claude models" [] {
    [sonnet opus haiku claude-sonnet-4-6]
}

def "nu-complete claude effort" [] {
    [low medium high]
}

def "nu-complete claude scope" [] {
    [local user project]
}

def "nu-complete claude scope-with-managed" [] {
    [local user project managed]
}

def "nu-complete claude transport" [] {
    [stdio sse http]
}

def "nu-complete claude install-channel" [] {
    [stable latest]
}

# Main command
export extern claude [
    --debug(-d)                                             # Enable debug mode
    --debug-file: path                                      # Debug output file
    --verbose                                               # Verbose output
    --print(-p)                                             # Print mode
    --output-format: string@"nu-complete claude output-format"  # Output format
    --json-schema: string                                   # JSON schema
    --include-partial-messages                               # Include partial messages
    --input-format: string@"nu-complete claude input-format"    # Input format
    --mcp-debug                                             # MCP debug mode
    --dangerously-skip-permissions                          # Skip permissions (dangerous)
    --allow-dangerously-skip-permissions                    # Allow skip permissions
    --max-budget-usd: number                                # Max budget in USD
    --replay-user-messages                                  # Replay user messages
    --allowedTools: string                                  # Allowed tools (deprecated)
    --allowed-tools: string                                 # Allowed tools
    --tools: string                                         # Tools
    --disallowedTools: string                               # Disallowed tools (deprecated)
    --disallowed-tools: string                              # Disallowed tools
    --mcp-config: path                                      # MCP config file
    --system-prompt: string                                 # System prompt
    --append-system-prompt: string                          # Append system prompt
    --permission-mode: string@"nu-complete claude permission-mode"  # Permission mode
    --continue(-c)                                          # Continue last session
    --resume(-r): string                                    # Resume session by ID
    --fork-session                                          # Fork session
    --no-session-persistence                                # Disable session persistence
    --model: string@"nu-complete claude models"             # Model to use
    --agent: string                                         # Agent name
    --betas: string                                         # Beta features
    --fallback-model: string@"nu-complete claude models"    # Fallback model
    --settings: path                                        # Settings file
    --add-dir: path                                         # Additional directory
    --ide: string                                           # IDE integration
    --strict-mcp-config                                     # Strict MCP config
    --session-id: string                                    # Session ID
    --agents: string                                        # Agents config
    --setting-sources: string@"nu-complete claude scope"    # Setting sources
    --plugin-dir: path                                      # Plugin directory
    --disable-slash-commands                                 # Disable slash commands
    --chrome                                                # Enable Chrome
    --no-chrome                                             # Disable Chrome
    --from-pr: string                                       # From PR
    --file: path                                            # Input file
    --worktree(-w): string                                  # Git worktree
    --tmux                                                  # Tmux mode
    --effort: string@"nu-complete claude effort"            # Effort level
    --version(-v)                                           # Show version
    --help(-h)                                              # Show help
    ...args: string                                         # Command or prompt
]

# --- auth ---

export extern "claude auth" [
    --help(-h)
    ...args: string
]

export extern "claude auth login" [
    --email: string     # Login email
    --sso               # Use SSO login
    --help(-h)
]

export extern "claude auth logout" [
    --help(-h)
]

def "nu-complete claude auth-status-format" [] {
    [json text]
}

export extern "claude auth status" [
    --json               # Output as JSON
    --text               # Output as text
    --help(-h)
]

# --- mcp ---

export extern "claude mcp" [
    --help(-h)
    ...args: string
]

export extern "claude mcp add" [
    --scope(-s): string@"nu-complete claude scope"              # Scope
    --transport(-t): string@"nu-complete claude transport"      # Transport type
    --env(-e): string                                           # Environment variable
    --header(-H): string                                        # Header
    --callback-port: int                                        # Callback port
    --client-id: string                                         # Client ID
    --client-secret                                              # Client secret (interactive prompt)
    --help(-h)
    ...args: string
]

export extern "claude mcp add-from-claude-desktop" [
    --scope(-s): string@"nu-complete claude scope"
    --help(-h)
    ...args: string
]

export extern "claude mcp add-json" [
    --scope(-s): string@"nu-complete claude scope"
    --client-secret                                              # Client secret (interactive prompt)
    --help(-h)
    ...args: string
]

export extern "claude mcp get" [
    --help(-h)
    ...args: string
]

export extern "claude mcp list" [
    --help(-h)
]

export extern "claude mcp remove" [
    --scope(-s): string@"nu-complete claude scope"
    --help(-h)
    ...args: string
]

export extern "claude mcp reset-project-choices" [
    --help(-h)
]

export extern "claude mcp serve" [
    --debug(-d)
    --verbose
    --help(-h)
]

# --- plugin ---

export extern "claude plugin" [
    --help(-h)
    ...args: string
]

export extern "claude plugin disable" [
    --all(-a)                                               # Disable all
    --scope(-s): string@"nu-complete claude scope"
    --help(-h)
    ...args: string
]

export extern "claude plugin enable" [
    --scope(-s): string@"nu-complete claude scope"
    --help(-h)
    ...args: string
]

export extern "claude plugin install" [
    --scope(-s): string@"nu-complete claude scope"
    --help(-h)
    ...args: string
]

export extern "claude plugin list" [
    --available
    --json
    --help(-h)
]

export extern "claude plugin marketplace" [
    --help(-h)
    ...args: string
]

export extern "claude plugin marketplace add" [
    --help(-h)
    ...args: string
]

export extern "claude plugin marketplace list" [
    --json
    --help(-h)
]

export extern "claude plugin marketplace remove" [
    --help(-h)
    ...args: string
]

export extern "claude plugin marketplace update" [
    --help(-h)
    ...args: string
]

export extern "claude plugin uninstall" [
    --scope(-s): string@"nu-complete claude scope"
    --help(-h)
    ...args: string
]

export extern "claude plugin update" [
    --scope(-s): string@"nu-complete claude scope-with-managed"
    --help(-h)
    ...args: string
]

export extern "claude plugin validate" [
    --help(-h)
    ...args: string
]

# --- agents ---

export extern "claude agents" [
    --setting-sources: string@"nu-complete claude scope"
    --help(-h)
]

# --- setup-token ---

export extern "claude setup-token" [
    --help(-h)
]

# --- doctor ---

export extern "claude doctor" [
    --help(-h)
]

# --- update / upgrade ---

export extern "claude update" [
    --help(-h)
]

export extern "claude upgrade" [
    --help(-h)
]

# --- install ---

export extern "claude install" [
    --force
    --help(-h)
    channel?: string@"nu-complete claude install-channel"   # Install channel
]
