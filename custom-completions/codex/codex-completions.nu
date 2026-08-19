module completions {

  def "nu-complete codex sandbox_mode" [] {
    [ "read-only" "workspace-write" "danger-full-access" ]
  }

  def "nu-complete codex approval_policy" [] {
    [ "untrusted" "on-request" "never" ]
  }

  # Codex CLI
  export extern codex [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --remote: string          # Connect the TUI to a remote app server endpoint
    --remote-auth-token-env: string # Name of the environment variable containing the bearer token to send to a remote app server websocket
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --image(-i): path         # Optional image(s) to attach to the initial prompt
    --model(-m): string       # Model the agent should use
    --oss                     # Use open-source provider
    --local-provider: string  # Specify which local provider to use (lmstudio or ollama). If not specified with --oss, will use config default or show selection
    --profile(-p): string     # Layer $CODEX_HOME/<name>.config.toml on top of the base user config
    --sandbox(-s): string@"nu-complete codex sandbox_mode" # Select the sandbox policy to use when executing model-generated shell commands
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --cd(-C): path            # Tell the agent to use the specified directory as its working root
    --add-dir: path           # Additional directories that should be writable alongside the primary workspace
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --approve-for-me          # Route approval requests through automatic review using the workspace-write sandbox
    --ask-for-approval(-a): string@"nu-complete codex approval_policy" # Configure when the model requires human approval before executing a command
    --search                  # Enable live web search. When enabled, the native Responses `web_search` tool is available to the model (no per‑call approval)
    --no-alt-screen           # Disable alternate screen mode
    --help(-h)                # Print help (see more with '--help')
    --version(-V)             # Print version
    prompt?: string           # Optional user prompt to start the session
  ]

  # Browse all agent sessions on the shared local app-server daemon
  export extern "codex agents" [
    --remote: string          # Connect the TUI to a remote app server endpoint
    --remote-auth-token-env: string # Name of the environment variable containing the bearer token to send to a remote app server websocket
    --cd(-C): path            # Use this directory for new tasks on a remote server
    --no-alt-screen           # Disable alternate screen mode
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete codex exec sandbox_mode" [] {
    [ "read-only" "workspace-write" "danger-full-access" ]
  }

  def "nu-complete codex exec color" [] {
    [ "always" "never" "auto" ]
  }

  # Run Codex non-interactively
  export extern "codex exec" [
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --image(-i): path         # Optional image(s) to attach to the initial prompt
    --oss                     # Use open-source provider
    --local-provider: string  # Specify which local provider to use (lmstudio or ollama). If not specified with --oss, will use config default or show selection
    --profile(-p): string     # Layer $CODEX_HOME/<name>.config.toml on top of the base user config
    --sandbox(-s): string@"nu-complete codex exec sandbox_mode" # Select the sandbox policy to use when executing model-generated shell commands
    --approve-for-me          # Route approval requests through automatic review using the workspace-write sandbox
    --cd(-C): path            # Tell the agent to use the specified directory as its working root
    --add-dir: path           # Additional directories that should be writable alongside the primary workspace
    --model(-m): string       # Model the agent should use
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --skip-git-repo-check     # Allow running Codex outside a Git repository
    --ephemeral               # Run without persisting session files to disk
    --ignore-user-config      # Do not load `$CODEX_HOME/config.toml`; auth still uses `CODEX_HOME`
    --ignore-rules            # Do not load user or project execpolicy `.rules` files
    --output-schema: path     # Path to a JSON Schema file describing the model's final response shape
    --color: string@"nu-complete codex exec color" # Specifies color settings for use in the output
    --json                    # Print events to stdout as JSONL
    --output-last-message(-o): path # Specifies file where the last message from the agent should be written
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    --version(-V)             # Print version
    prompt?: string           # Initial instructions for the agent. If not provided as an argument (or if `-` is used), instructions are read from stdin. If stdin is piped and a prompt is also provided, stdin is appended as a `<stdin>` block
  ]

  # Resume a previous session by id or pick the most recent with --last
  export extern "codex exec resume" [
    --last                    # Resume the most recent recorded session (newest) without specifying an id
    --all                     # Show all sessions (disables cwd filtering)
    --image(-i): path         # Optional image(s) to attach to the prompt sent after resuming
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --model(-m): string       # Model the agent should use
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --skip-git-repo-check     # Allow running Codex outside a Git repository
    --ephemeral               # Run without persisting session files to disk
    --ignore-user-config      # Do not load `$CODEX_HOME/config.toml`; auth still uses `CODEX_HOME`
    --ignore-rules            # Do not load user or project execpolicy `.rules` files
    --output-schema: path     # Path to a JSON Schema file describing the model's final response shape
    --json                    # Print events to stdout as JSONL
    --output-last-message(-o): path # Specifies file where the last message from the agent should be written
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    session_id?: string       # Conversation/session id (UUID) or thread name. UUIDs take precedence if it parses. If omitted, use --last to pick the most recent recorded session
    prompt?: string           # Prompt to send after resuming the session. If `-` is used, read from stdin
  ]

  # Fork a previous session by id into a new session
  export extern "codex exec fork" [
    --image(-i): path         # Optional image(s) to attach to the prompt sent after forking
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --model(-m): string       # Model the agent should use
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --skip-git-repo-check     # Allow running Codex outside a Git repository
    --ephemeral               # Run without persisting session files to disk
    --ignore-user-config      # Do not load `$CODEX_HOME/config.toml`; auth still uses `CODEX_HOME`
    --ignore-rules            # Do not load user or project execpolicy `.rules` files
    --output-schema: path     # Path to a JSON Schema file describing the model's final response shape
    --json                    # Print events to stdout as JSONL
    --output-last-message(-o): path # Specifies file where the last message from the agent should be written
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    session_id: string        # Conversation/session id (UUID) or thread name to fork
    prompt?: string           # Optional prompt to send after forking. If `-` is used, read from stdin
  ]

  # Run a code review against the current repository
  export extern "codex exec review" [
    --uncommitted             # Review staged, unstaged, and untracked changes
    --base: string            # Review changes against the given base branch
    --commit: string          # Review the changes introduced by a commit
    --title: string           # Optional commit title to display in the review summary
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --model(-m): string       # Model the agent should use
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --skip-git-repo-check     # Allow running Codex outside a Git repository
    --ephemeral               # Run without persisting session files to disk
    --ignore-user-config      # Do not load `$CODEX_HOME/config.toml`; auth still uses `CODEX_HOME`
    --ignore-rules            # Do not load user or project execpolicy `.rules` files
    --output-schema: path     # Path to a JSON Schema file describing the model's final response shape
    --json                    # Print events to stdout as JSONL
    --output-last-message(-o): path # Specifies file where the last message from the agent should be written
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    prompt?: string           # Custom review instructions. If `-` is used, read from stdin
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex exec help" [
  ]

  # Resume a previous session by id or pick the most recent with --last
  export extern "codex exec help resume" [
  ]

  # Fork a previous session by id into a new session
  export extern "codex exec help fork" [
  ]

  # Run a code review against the current repository
  export extern "codex exec help review" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex exec help help" [
  ]

  # Run a code review non-interactively
  export extern "codex review" [
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --uncommitted             # Review staged, unstaged, and untracked changes
    --base: string            # Review changes against the given base branch
    --commit: string          # Review the changes introduced by a commit
    --title: string           # Optional commit title to display in the review summary
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    prompt?: string           # Custom review instructions. If `-` is used, read from stdin
  ]

  # Manage login
  export extern "codex login" [
    --with-api-key            # Read the API key from stdin (e.g. `printenv OPENAI_API_KEY | codex login --with-api-key`)
    --with-access-token       # Read the access token from stdin (e.g. `printenv CODEX_ACCESS_TOKEN | codex login --with-access-token`)
    --api-key: string         # (deprecated) Previously accepted the API key directly; now exits with guidance to use --with-api-key
    --device-auth
    --experimental_issuer: string # EXPERIMENTAL: Use custom OAuth issuer base URL (advanced) Override the OAuth issuer base URL (advanced)
    --experimental_client-id: string # EXPERIMENTAL: Use custom OAuth client ID (advanced)
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Show login status
  export extern "codex login status" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex login help" [
  ]

  # Show login status
  export extern "codex login help status" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex login help help" [
  ]

  # Remove stored authentication credentials
  export extern "codex logout" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Manage external MCP servers for Codex
  export extern "codex mcp" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  export extern "codex mcp list" [
    --json                    # Output the configured servers as JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  export extern "codex mcp get" [
    --json                    # Output the server configuration as JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    name: string              # Name of the MCP server to display
  ]

  def "nu-complete codex mcp add oauth_client_registration" [] {
    [ "auto" "cimd" "dcr" ]
  }

  export extern "codex mcp add" [
    --env: string             # Environment variables to set when launching the server. Only valid with stdio servers
    --url: string             # URL for a streamable HTTP MCP server
    --bearer-token-env-var: string # Optional environment variable to read for a bearer token. Only valid with streamable HTTP servers
    --oauth-client-id: string # Optional OAuth client identifier to use for this MCP server
    --oauth-client-registration: string@"nu-complete codex mcp add oauth_client_registration" # OAuth client-registration strategy for the immediate login only
    --oauth-resource: string  # Optional OAuth resource parameter to include during MCP login
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    name: string              # Name for the MCP server configuration
    ...command: string        # Command to launch the MCP server. Use --url for a streamable HTTP server
  ]

  export extern "codex mcp remove" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    name: string              # Name of the MCP server configuration to remove
  ]

  def "nu-complete codex mcp login oauth_client_registration" [] {
    [ "auto" "cimd" "dcr" ]
  }

  export extern "codex mcp login" [
    --scopes: string          # Comma-separated list of OAuth scopes to request
    --oauth-client-registration: string@"nu-complete codex mcp login oauth_client_registration" # OAuth client-registration strategy for this login only
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    name: string              # Name of the MCP server to authenticate with oauth
  ]

  export extern "codex mcp logout" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    name: string              # Name of the MCP server to deauthenticate
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex mcp help" [
  ]

  export extern "codex mcp help list" [
  ]

  export extern "codex mcp help get" [
  ]

  export extern "codex mcp help add" [
  ]

  export extern "codex mcp help remove" [
  ]

  export extern "codex mcp help login" [
  ]

  export extern "codex mcp help logout" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex mcp help help" [
  ]

  # Manage Codex plugins
  export extern "codex plugin" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Install a plugin from a configured marketplace snapshot
  export extern "codex plugin add" [
    --marketplace(-m): string # Configured marketplace name to use when PLUGIN does not include @MARKETPLACE
    --json                    # Output install result as JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    plugin: string            # Plugin selector to install: either PLUGIN@MARKETPLACE or PLUGIN with --marketplace
  ]

  # List plugins available from configured marketplace snapshots
  export extern "codex plugin list" [
    --marketplace(-m): string # Only list plugins from this configured marketplace name
    --json                    # Output plugin list as JSON
    --available               # Include uninstalled marketplace plugins in the JSON output
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Add, list, upgrade, or remove configured plugin marketplaces
  export extern "codex plugin marketplace" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Add a local or Git marketplace to the configured marketplace sources
  export extern "codex plugin marketplace add" [
    --ref: string             # Git ref to fetch for Git marketplace sources
    --sparse: string          # Sparse checkout path for Git marketplace sources. Can be repeated
    --json                    # Output add result as JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    source: string            # Marketplace source: a local path, owner/repo[@ref], HTTPS Git URL, or SSH Git URL
  ]

  # List plugin marketplaces Codex is currently considering and their roots
  export extern "codex plugin marketplace list" [
    --json                    # Output marketplace list as JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Refresh configured Git marketplace snapshots
  export extern "codex plugin marketplace upgrade" [
    --json                    # Output upgrade result as JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    marketplace_name?: string # Optional configured marketplace name to upgrade. Omit to upgrade all Git marketplaces
  ]

  # Remove a configured marketplace source by name
  export extern "codex plugin marketplace remove" [
    --json                    # Output remove result as JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    marketplace_name: string  # Configured marketplace name to remove
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex plugin marketplace help" [
  ]

  # Add a local or Git marketplace to the configured marketplace sources
  export extern "codex plugin marketplace help add" [
  ]

  # List plugin marketplaces Codex is currently considering and their roots
  export extern "codex plugin marketplace help list" [
  ]

  # Refresh configured Git marketplace snapshots
  export extern "codex plugin marketplace help upgrade" [
  ]

  # Remove a configured marketplace source by name
  export extern "codex plugin marketplace help remove" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex plugin marketplace help help" [
  ]

  # Remove an installed plugin from local config and cache
  export extern "codex plugin remove" [
    --marketplace(-m): string # Marketplace name to use when PLUGIN does not include @MARKETPLACE
    --json                    # Output remove result as JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    plugin: string            # Plugin selector to remove: either PLUGIN@MARKETPLACE or PLUGIN with --marketplace
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex plugin help" [
  ]

  # Install a plugin from a configured marketplace snapshot
  export extern "codex plugin help add" [
  ]

  # List plugins available from configured marketplace snapshots
  export extern "codex plugin help list" [
  ]

  # Add, list, upgrade, or remove configured plugin marketplaces
  export extern "codex plugin help marketplace" [
  ]

  # Add a local or Git marketplace to the configured marketplace sources
  export extern "codex plugin help marketplace add" [
  ]

  # List plugin marketplaces Codex is currently considering and their roots
  export extern "codex plugin help marketplace list" [
  ]

  # Refresh configured Git marketplace snapshots
  export extern "codex plugin help marketplace upgrade" [
  ]

  # Remove a configured marketplace source by name
  export extern "codex plugin help marketplace remove" [
  ]

  # Remove an installed plugin from local config and cache
  export extern "codex plugin help remove" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex plugin help help" [
  ]

  # Start Codex as an MCP server (stdio)
  export extern "codex mcp-server" [
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete codex app-server ws_auth" [] {
    [ "capability-token" "signed-bearer-token" ]
  }

  # [experimental] Run the app server or related tooling
  export extern "codex app-server" [
    --code-mode-host: string  # Connect to a remote code-mode host instead of starting a local host
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --listen: string          # Transport endpoint URL. Supported values: `stdio://` (default), `unix://`, `unix://PATH`, `ws://IP:PORT`, `off`
    --stdio                   # Use stdio as the transport (equivalent to `--listen stdio://`)
    --remote-control          # Enable remote control for this app-server process without changing persistence
    --analytics-default-enabled # Controls whether analytics are enabled by default
    --ws-auth: string@"nu-complete codex app-server ws_auth" # Websocket auth mode for non-loopback listeners
    --ws-token-file: path     # Absolute path to the capability-token file
    --ws-token-sha256: string # Hex-encoded SHA-256 digest of the capability token
    --ws-shared-secret-file: path # Absolute path to the shared secret file for signed JWT bearer tokens
    --ws-issuer: string       # Expected issuer for signed JWT bearer tokens
    --ws-audience: string     # Expected audience for signed JWT bearer tokens
    --ws-max-clock-skew-seconds: string # Maximum clock skew when validating signed JWT bearer tokens
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Manage the local app-server daemon
  export extern "codex app-server daemon" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Install durable local app-server management for SSH-driven use
  export extern "codex app-server daemon bootstrap" [
    --remote-control          # Launch the managed app-server with remote control enabled
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Start the local app server daemon if it is not already running
  export extern "codex app-server daemon start" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Restart the local app server daemon
  export extern "codex app-server daemon restart" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Enable remote control for future starts and a currently running managed daemon
  export extern "codex app-server daemon enable-remote-control" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Disable remote control for future starts and a currently running managed daemon
  export extern "codex app-server daemon disable-remote-control" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Stop the local app server daemon
  export extern "codex app-server daemon stop" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print local CLI and running app-server versions as JSON
  export extern "codex app-server daemon version" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # [internal] Run the detached pid-backed standalone updater loop
  export extern "codex app-server daemon pid-update-loop" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex app-server daemon help" [
  ]

  # Install durable local app-server management for SSH-driven use
  export extern "codex app-server daemon help bootstrap" [
  ]

  # Start the local app server daemon if it is not already running
  export extern "codex app-server daemon help start" [
  ]

  # Restart the local app server daemon
  export extern "codex app-server daemon help restart" [
  ]

  # Enable remote control for future starts and a currently running managed daemon
  export extern "codex app-server daemon help enable-remote-control" [
  ]

  # Disable remote control for future starts and a currently running managed daemon
  export extern "codex app-server daemon help disable-remote-control" [
  ]

  # Stop the local app server daemon
  export extern "codex app-server daemon help stop" [
  ]

  # Print local CLI and running app-server versions as JSON
  export extern "codex app-server daemon help version" [
  ]

  # [internal] Run the detached pid-backed standalone updater loop
  export extern "codex app-server daemon help pid-update-loop" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex app-server daemon help help" [
  ]

  # Proxy stdio bytes to the running app-server control socket
  export extern "codex app-server proxy" [
    --sock: string            # Path to the app-server Unix domain socket to connect to
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # [experimental] Generate TypeScript bindings for the app server protocol
  export extern "codex app-server generate-ts" [
    --out(-o): path           # Output directory where .ts files will be written
    --prettier(-p): path      # Optional path to the Prettier executable to format generated files
    --experimental            # Include experimental methods and fields in the generated output
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # [experimental] Generate JSON Schema for the app server protocol
  export extern "codex app-server generate-json-schema" [
    --out(-o): path           # Output directory where the schema bundle will be written
    --experimental            # Include experimental methods and fields in the generated output
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # [internal] Generate internal JSON Schema artifacts for Codex tooling
  export extern "codex app-server generate-internal-json-schema" [
    --out(-o): path           # Output directory where internal JSON Schema artifacts will be written
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex app-server help" [
  ]

  # Manage the local app-server daemon
  export extern "codex app-server help daemon" [
  ]

  # Install durable local app-server management for SSH-driven use
  export extern "codex app-server help daemon bootstrap" [
  ]

  # Start the local app server daemon if it is not already running
  export extern "codex app-server help daemon start" [
  ]

  # Restart the local app server daemon
  export extern "codex app-server help daemon restart" [
  ]

  # Enable remote control for future starts and a currently running managed daemon
  export extern "codex app-server help daemon enable-remote-control" [
  ]

  # Disable remote control for future starts and a currently running managed daemon
  export extern "codex app-server help daemon disable-remote-control" [
  ]

  # Stop the local app server daemon
  export extern "codex app-server help daemon stop" [
  ]

  # Print local CLI and running app-server versions as JSON
  export extern "codex app-server help daemon version" [
  ]

  # [internal] Run the detached pid-backed standalone updater loop
  export extern "codex app-server help daemon pid-update-loop" [
  ]

  # Proxy stdio bytes to the running app-server control socket
  export extern "codex app-server help proxy" [
  ]

  # [experimental] Generate TypeScript bindings for the app server protocol
  export extern "codex app-server help generate-ts" [
  ]

  # [experimental] Generate JSON Schema for the app server protocol
  export extern "codex app-server help generate-json-schema" [
  ]

  # [internal] Generate internal JSON Schema artifacts for Codex tooling
  export extern "codex app-server help generate-internal-json-schema" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex app-server help help" [
  ]

  # [experimental] Manage the app-server daemon with remote control enabled
  export extern "codex remote-control" [
    --json                    # Emit machine-readable JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Start the app-server daemon with remote control enabled
  export extern "codex remote-control start" [
    --json                    # Emit machine-readable JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Stop the app-server daemon
  export extern "codex remote-control stop" [
    --json                    # Emit machine-readable JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Create and print a short-lived manual pairing code
  export extern "codex remote-control pair" [
    --json                    # Emit machine-readable JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex remote-control help" [
  ]

  # Start the app-server daemon with remote control enabled
  export extern "codex remote-control help start" [
  ]

  # Stop the app-server daemon
  export extern "codex remote-control help stop" [
  ]

  # Create and print a short-lived manual pairing code
  export extern "codex remote-control help pair" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex remote-control help help" [
  ]

  def "nu-complete codex completion shell" [] {
    [ "bash" "elvish" "fish" "powershell" "zsh" "nushell" ]
  }

  # Generate shell completion scripts
  export extern "codex completion" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    shell?: string@"nu-complete codex completion shell" # Shell to generate completions for
  ]

  # Update Codex to the latest version
  export extern "codex update" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Diagnose local Codex installation, config, auth, and runtime health
  export extern "codex doctor" [
    --json                    # Emit a redacted machine-readable report
    --summary                 # Only show grouped check rows and the final count summary
    --all                     # Expand long lists in detailed human output
    --no-color                # Disable ANSI color in human output
    --ascii                   # Use ASCII status labels and separators in human output
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Run commands within a Codex-provided sandbox
  export extern "codex sandbox" [
    --sandbox-state-json: string # JSON value from `codex/sandbox-state-meta` to apply directly
    --sandbox-state-readable-root: string # Add a readable root to the supplied sandbox state. Repeat for multiple roots
    --sandbox-state-disable-network # Disable direct network access in the supplied sandbox state
    --permission-profile(-P): string # Named permissions profile to apply from the active configuration stack
    --profile(-p): string     # Layer $CODEX_HOME/<name>.config.toml on top of the base user config
    --cd(-C): path            # Working directory used for profile resolution and command execution
    --include-managed-config  # Include managed requirements while resolving an explicit permissions profile
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    ...command: string        # Full command args to run under the Linux sandbox
  ]

  # Debugging tools
  export extern "codex debug" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Render the raw model catalog as JSON
  export extern "codex debug models" [
    --bundled                 # Skip refresh and dump only the bundled catalog shipped with this binary
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Tooling: helps debug the app server
  export extern "codex debug app-server" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  export extern "codex debug app-server send-message-v2" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    user_message: string
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex debug app-server help" [
  ]

  export extern "codex debug app-server help send-message-v2" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex debug app-server help help" [
  ]

  # Render the model-visible prompt input list as JSON
  export extern "codex debug prompt-input" [
    --image(-i): path         # Optional image(s) to attach to the user prompt
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    prompt?: string           # Optional user prompt to append after session context
  ]

  # Replay a rollout trace bundle and write reduced state JSON
  export extern "codex debug trace-reduce" [
    --output(-o): path        # Output path for reduced RolloutTrace JSON. Defaults to TRACE_BUNDLE/state.json
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    trace_bundle: path        # Trace bundle directory containing manifest.json and trace.jsonl
  ]

  # Internal: reset local memory state for a fresh start
  export extern "codex debug clear-memories" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex debug help" [
  ]

  # Render the raw model catalog as JSON
  export extern "codex debug help models" [
  ]

  # Tooling: helps debug the app server
  export extern "codex debug help app-server" [
  ]

  export extern "codex debug help app-server send-message-v2" [
  ]

  # Render the model-visible prompt input list as JSON
  export extern "codex debug help prompt-input" [
  ]

  # Replay a rollout trace bundle and write reduced state JSON
  export extern "codex debug help trace-reduce" [
  ]

  # Internal: reset local memory state for a fresh start
  export extern "codex debug help clear-memories" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex debug help help" [
  ]

  # Execpolicy tooling
  export extern "codex execpolicy" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Check execpolicy files against a command
  export extern "codex execpolicy check" [
    --rules(-r): path         # Paths to execpolicy rule files to evaluate (repeatable)
    --pretty                  # Pretty-print the JSON output
    --resolve-host-executables # Resolve absolute program paths against basename rules, gated by any `host_executable()` definitions in the loaded policy files
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    ...command: string        # Command tokens to check against the policy
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex execpolicy help" [
  ]

  # Check execpolicy files against a command
  export extern "codex execpolicy help check" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex execpolicy help help" [
  ]

  # Apply the latest diff produced by Codex agent as a `git apply` to your local working tree
  export extern "codex apply" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    task_id: string
  ]

  def "nu-complete codex resume sandbox_mode" [] {
    [ "read-only" "workspace-write" "danger-full-access" ]
  }

  def "nu-complete codex resume approval_policy" [] {
    [ "untrusted" "on-request" "never" ]
  }

  # Resume a previous interactive session (picker by default; use --last to continue the most recent)
  export extern "codex resume" [
    --last                    # Continue the most recent session without showing the picker
    --all                     # Show all sessions (disables cwd filtering and shows CWD column)
    --include-non-interactive # Include non-interactive sessions in the resume picker and --last selection
    --remote: string          # Connect the TUI to a remote app server endpoint
    --remote-auth-token-env: string # Name of the environment variable containing the bearer token to send to a remote app server websocket
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --image(-i): path         # Optional image(s) to attach to the initial prompt
    --model(-m): string       # Model the agent should use
    --oss                     # Use open-source provider
    --local-provider: string  # Specify which local provider to use (lmstudio or ollama). If not specified with --oss, will use config default or show selection
    --profile(-p): string     # Layer $CODEX_HOME/<name>.config.toml on top of the base user config
    --sandbox(-s): string@"nu-complete codex resume sandbox_mode" # Select the sandbox policy to use when executing model-generated shell commands
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --cd(-C): path            # Tell the agent to use the specified directory as its working root
    --add-dir: path           # Additional directories that should be writable alongside the primary workspace
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --approve-for-me          # Route approval requests through automatic review using the workspace-write sandbox
    --ask-for-approval(-a): string@"nu-complete codex resume approval_policy" # Configure when the model requires human approval before executing a command
    --search                  # Enable live web search. When enabled, the native Responses `web_search` tool is available to the model (no per‑call approval)
    --no-alt-screen           # Disable alternate screen mode
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    --version(-V)             # Print version
    session_id?: string       # Session id (UUID) or session name. UUIDs take precedence if it parses. If omitted, use --last to pick the most recent recorded session
    prompt?: string           # Optional user prompt to start the session
  ]

  def "nu-complete codex queue sandbox_mode" [] {
    [ "read-only" "workspace-write" "danger-full-access" ]
  }

  # Queue a message for an existing session
  export extern "codex queue" [
    --thread: string          # Session UUID or exact session name
    --message: string         # Message text to queue
    --remote: string          # Connect the TUI to a remote app server endpoint
    --remote-auth-token-env: string # Name of the environment variable containing the bearer token to send to a remote app server websocket
    --image(-i): path         # Optional image(s) to attach to the initial prompt
    --model(-m): string       # Model the agent should use
    --oss                     # Use open-source provider
    --local-provider: string  # Specify which local provider to use (lmstudio or ollama). If not specified with --oss, will use config default or show selection
    --profile(-p): string     # Layer $CODEX_HOME/<name>.config.toml on top of the base user config
    --sandbox(-s): string@"nu-complete codex queue sandbox_mode" # Select the sandbox policy to use when executing model-generated shell commands
    --approve-for-me          # Route approval requests through automatic review using the workspace-write sandbox
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --cd(-C): path            # Tell the agent to use the specified directory as its working root
    --add-dir: path           # Additional directories that should be writable alongside the primary workspace
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete codex archive sandbox_mode" [] {
    [ "read-only" "workspace-write" "danger-full-access" ]
  }

  # Archive a saved session by id or session name
  export extern "codex archive" [
    --remote: string          # Connect the TUI to a remote app server endpoint
    --remote-auth-token-env: string # Name of the environment variable containing the bearer token to send to a remote app server websocket
    --image(-i): path         # Optional image(s) to attach to the initial prompt
    --model(-m): string       # Model the agent should use
    --oss                     # Use open-source provider
    --local-provider: string  # Specify which local provider to use (lmstudio or ollama). If not specified with --oss, will use config default or show selection
    --profile(-p): string     # Layer $CODEX_HOME/<name>.config.toml on top of the base user config
    --sandbox(-s): string@"nu-complete codex archive sandbox_mode" # Select the sandbox policy to use when executing model-generated shell commands
    --approve-for-me          # Route approval requests through automatic review using the workspace-write sandbox
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --cd(-C): path            # Tell the agent to use the specified directory as its working root
    --add-dir: path           # Additional directories that should be writable alongside the primary workspace
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    target: string            # Session id (UUID) or session name. UUIDs take precedence if it parses
  ]

  def "nu-complete codex delete sandbox_mode" [] {
    [ "read-only" "workspace-write" "danger-full-access" ]
  }

  # Permanently delete a saved session by id or session name
  export extern "codex delete" [
    --remote: string          # Connect the TUI to a remote app server endpoint
    --remote-auth-token-env: string # Name of the environment variable containing the bearer token to send to a remote app server websocket
    --image(-i): path         # Optional image(s) to attach to the initial prompt
    --model(-m): string       # Model the agent should use
    --oss                     # Use open-source provider
    --local-provider: string  # Specify which local provider to use (lmstudio or ollama). If not specified with --oss, will use config default or show selection
    --profile(-p): string     # Layer $CODEX_HOME/<name>.config.toml on top of the base user config
    --sandbox(-s): string@"nu-complete codex delete sandbox_mode" # Select the sandbox policy to use when executing model-generated shell commands
    --approve-for-me          # Route approval requests through automatic review using the workspace-write sandbox
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --cd(-C): path            # Tell the agent to use the specified directory as its working root
    --add-dir: path           # Additional directories that should be writable alongside the primary workspace
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --force                   # Delete without prompting. SESSION must be a UUID
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    target: string            # Session id (UUID) or session name. UUIDs take precedence if it parses
  ]

  # Inspect or migrate legacy local sessions to paginated thread history
  export extern "codex migrate-rollouts" [
    --apply                   # Publish the migration. Without this flag the command only reports eligible sessions
    --thread: string          # Restrict inspection or migration to one or more thread IDs
    --max-mib-per-second: string # Limit aggregate rollout read and write throughput, in MiB per second
    --json                    # Emit the complete per-thread report as JSON
    --verbose                 # Print one line for every inspected rollout
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  def "nu-complete codex unarchive sandbox_mode" [] {
    [ "read-only" "workspace-write" "danger-full-access" ]
  }

  # Unarchive a saved session by id or session name
  export extern "codex unarchive" [
    --remote: string          # Connect the TUI to a remote app server endpoint
    --remote-auth-token-env: string # Name of the environment variable containing the bearer token to send to a remote app server websocket
    --image(-i): path         # Optional image(s) to attach to the initial prompt
    --model(-m): string       # Model the agent should use
    --oss                     # Use open-source provider
    --local-provider: string  # Specify which local provider to use (lmstudio or ollama). If not specified with --oss, will use config default or show selection
    --profile(-p): string     # Layer $CODEX_HOME/<name>.config.toml on top of the base user config
    --sandbox(-s): string@"nu-complete codex unarchive sandbox_mode" # Select the sandbox policy to use when executing model-generated shell commands
    --approve-for-me          # Route approval requests through automatic review using the workspace-write sandbox
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --cd(-C): path            # Tell the agent to use the specified directory as its working root
    --add-dir: path           # Additional directories that should be writable alongside the primary workspace
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    target: string            # Session id (UUID) or session name. UUIDs take precedence if it parses
  ]

  def "nu-complete codex fork sandbox_mode" [] {
    [ "read-only" "workspace-write" "danger-full-access" ]
  }

  def "nu-complete codex fork approval_policy" [] {
    [ "untrusted" "on-request" "never" ]
  }

  # Fork a previous interactive session (picker by default; use --last to fork the most recent)
  export extern "codex fork" [
    --last                    # Fork the most recent session without showing the picker
    --all                     # Show all sessions (disables cwd filtering and shows CWD column)
    --remote: string          # Connect the TUI to a remote app server endpoint
    --remote-auth-token-env: string # Name of the environment variable containing the bearer token to send to a remote app server websocket
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --image(-i): path         # Optional image(s) to attach to the initial prompt
    --model(-m): string       # Model the agent should use
    --oss                     # Use open-source provider
    --local-provider: string  # Specify which local provider to use (lmstudio or ollama). If not specified with --oss, will use config default or show selection
    --profile(-p): string     # Layer $CODEX_HOME/<name>.config.toml on top of the base user config
    --sandbox(-s): string@"nu-complete codex fork sandbox_mode" # Select the sandbox policy to use when executing model-generated shell commands
    --dangerously-bypass-hook-trust # Run enabled hooks without requiring persisted hook trust for this invocation. DANGEROUS. Intended only for automation that already vets hook sources
    --cd(-C): path            # Tell the agent to use the specified directory as its working root
    --add-dir: path           # Additional directories that should be writable alongside the primary workspace
    --dangerously-bypass-approvals-and-sandbox # Skip all confirmation prompts and execute commands without sandboxing. EXTREMELY DANGEROUS. Intended solely for running in environments that are externally sandboxed
    --approve-for-me          # Route approval requests through automatic review using the workspace-write sandbox
    --ask-for-approval(-a): string@"nu-complete codex fork approval_policy" # Configure when the model requires human approval before executing a command
    --search                  # Enable live web search. When enabled, the native Responses `web_search` tool is available to the model (no per‑call approval)
    --no-alt-screen           # Disable alternate screen mode
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    --version(-V)             # Print version
    session_id?: string       # Conversation/session id (UUID). When provided, forks this session. If omitted, use --last to pick the most recent recorded session
    prompt?: string           # Optional user prompt to start the session
  ]

  # [EXPERIMENTAL] Browse tasks from Codex Cloud and apply changes locally
  export extern "codex cloud" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    --version(-V)             # Print version
  ]

  # Submit a new Codex Cloud task without launching the TUI
  export extern "codex cloud exec" [
    --env: string             # Target environment identifier (see `codex cloud` to browse)
    --attempts: string        # Number of assistant attempts (best-of-N)
    --branch: string          # Git branch to run in Codex Cloud (defaults to current branch)
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    query?: string            # Task prompt to run in Codex Cloud
  ]

  # Show the status of a Codex Cloud task
  export extern "codex cloud status" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    task_id: string           # Codex Cloud task identifier to inspect
  ]

  # List Codex Cloud tasks
  export extern "codex cloud list" [
    --env: string             # Filter tasks by environment identifier
    --limit: string           # Maximum number of tasks to return (1-20)
    --cursor: string          # Pagination cursor returned by a previous call
    --json                    # Emit JSON instead of plain text
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Apply the diff for a Codex Cloud task locally
  export extern "codex cloud apply" [
    --attempt: string         # Attempt number to apply (1-based)
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    task_id: string           # Codex Cloud task identifier to apply
  ]

  # Show the unified diff for a Codex Cloud task
  export extern "codex cloud diff" [
    --attempt: string         # Attempt number to display (1-based)
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    task_id: string           # Codex Cloud task identifier to display
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex cloud help" [
  ]

  # Submit a new Codex Cloud task without launching the TUI
  export extern "codex cloud help exec" [
  ]

  # Show the status of a Codex Cloud task
  export extern "codex cloud help status" [
  ]

  # List Codex Cloud tasks
  export extern "codex cloud help list" [
  ]

  # Apply the diff for a Codex Cloud task locally
  export extern "codex cloud help apply" [
  ]

  # Show the unified diff for a Codex Cloud task
  export extern "codex cloud help diff" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex cloud help help" [
  ]

  # Internal: run the responses API proxy
  export extern "codex responses-api-proxy" [
    --port: string            # Port to listen on. If not set, an ephemeral port is used
    --server-info: path       # Path to a JSON file to write startup info (single line). Includes {"port": <u16>}
    --http-shutdown           # Enable HTTP shutdown endpoint at GET /shutdown
    --upstream-url: string    # Absolute URL the proxy should forward requests to (defaults to OpenAI)
    --dump-dir: path          # Directory where request/response dumps should be written as JSON
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Internal: relay stdio to a Unix domain socket
  export extern "codex stdio-to-uds" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    socket_path: string       # Path to the Unix domain socket to connect to
  ]

  # [EXPERIMENTAL] Run the standalone exec-server service
  export extern "codex exec-server" [
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --concurrent-requests: string # Maximum number of requests to process concurrently on each connection
    --listen: string          # Transport endpoint URL. Supported values: `ws://IP:PORT` (default), `stdio`, `stdio://`
    --remote: string          # Register this exec-server as a remote environment using the given base URL
    --environment-id: string  # Environment id to attach to when registering remotely
    --name: string            # Human-readable environment name
    --use-agent-identity-auth # Use Agent Identity auth from CODEX_ACCESS_TOKEN for remote registration
    --exit-on-stdin-close     # Exit when the parent-owned standard-input pipe closes
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Register an existing WebSocket exec-server as a remote environment
  export extern "codex exec-server forward" [
    --connect: string         # Destination exec-server WebSocket URL
    --strict-config           # Error out when config.toml contains fields that are not recognized by this version of Codex
    --remote: string          # Register this exec-server as a remote environment using the given base URL
    --environment-id: string  # Environment id to attach to when registering remotely
    --name: string            # Human-readable environment name
    --use-agent-identity-auth # Use Agent Identity auth from CODEX_ACCESS_TOKEN for remote registration
    --exit-on-stdin-close     # Exit when the parent-owned standard-input pipe closes
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex exec-server help" [
  ]

  # Register an existing WebSocket exec-server as a remote environment
  export extern "codex exec-server help forward" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex exec-server help help" [
  ]

  # Inspect feature flags
  export extern "codex features" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # List known features with their stage and effective state
  export extern "codex features list" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
  ]

  # Enable a feature in config.toml
  export extern "codex features enable" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    feature: string           # Feature key to update (for example: unified_exec)
  ]

  # Disable a feature in config.toml
  export extern "codex features disable" [
    --config(-c): string      # Override a configuration value that would otherwise be loaded from `~/.codex/config.toml`. Use a dotted path (`foo.bar.baz`) to override nested values. The `value` portion is parsed as TOML. If it fails to parse as TOML, the raw string is used as a literal
    --enable: string          # Enable a feature (repeatable). Equivalent to `-c features.<name>=true`
    --disable: string         # Disable a feature (repeatable). Equivalent to `-c features.<name>=false`
    --help(-h)                # Print help (see more with '--help')
    feature: string           # Feature key to update (for example: unified_exec)
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex features help" [
  ]

  # List known features with their stage and effective state
  export extern "codex features help list" [
  ]

  # Enable a feature in config.toml
  export extern "codex features help enable" [
  ]

  # Disable a feature in config.toml
  export extern "codex features help disable" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex features help help" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex help" [
  ]

  # Browse all agent sessions on the shared local app-server daemon
  export extern "codex help agents" [
  ]

  # Run Codex non-interactively
  export extern "codex help exec" [
  ]

  # Resume a previous session by id or pick the most recent with --last
  export extern "codex help exec resume" [
  ]

  # Fork a previous session by id into a new session
  export extern "codex help exec fork" [
  ]

  # Run a code review against the current repository
  export extern "codex help exec review" [
  ]

  # Run a code review non-interactively
  export extern "codex help review" [
  ]

  # Manage login
  export extern "codex help login" [
  ]

  # Show login status
  export extern "codex help login status" [
  ]

  # Remove stored authentication credentials
  export extern "codex help logout" [
  ]

  # Manage external MCP servers for Codex
  export extern "codex help mcp" [
  ]

  export extern "codex help mcp list" [
  ]

  export extern "codex help mcp get" [
  ]

  export extern "codex help mcp add" [
  ]

  export extern "codex help mcp remove" [
  ]

  export extern "codex help mcp login" [
  ]

  export extern "codex help mcp logout" [
  ]

  # Manage Codex plugins
  export extern "codex help plugin" [
  ]

  # Install a plugin from a configured marketplace snapshot
  export extern "codex help plugin add" [
  ]

  # List plugins available from configured marketplace snapshots
  export extern "codex help plugin list" [
  ]

  # Add, list, upgrade, or remove configured plugin marketplaces
  export extern "codex help plugin marketplace" [
  ]

  # Add a local or Git marketplace to the configured marketplace sources
  export extern "codex help plugin marketplace add" [
  ]

  # List plugin marketplaces Codex is currently considering and their roots
  export extern "codex help plugin marketplace list" [
  ]

  # Refresh configured Git marketplace snapshots
  export extern "codex help plugin marketplace upgrade" [
  ]

  # Remove a configured marketplace source by name
  export extern "codex help plugin marketplace remove" [
  ]

  # Remove an installed plugin from local config and cache
  export extern "codex help plugin remove" [
  ]

  # Start Codex as an MCP server (stdio)
  export extern "codex help mcp-server" [
  ]

  # [experimental] Run the app server or related tooling
  export extern "codex help app-server" [
  ]

  # Manage the local app-server daemon
  export extern "codex help app-server daemon" [
  ]

  # Install durable local app-server management for SSH-driven use
  export extern "codex help app-server daemon bootstrap" [
  ]

  # Start the local app server daemon if it is not already running
  export extern "codex help app-server daemon start" [
  ]

  # Restart the local app server daemon
  export extern "codex help app-server daemon restart" [
  ]

  # Enable remote control for future starts and a currently running managed daemon
  export extern "codex help app-server daemon enable-remote-control" [
  ]

  # Disable remote control for future starts and a currently running managed daemon
  export extern "codex help app-server daemon disable-remote-control" [
  ]

  # Stop the local app server daemon
  export extern "codex help app-server daemon stop" [
  ]

  # Print local CLI and running app-server versions as JSON
  export extern "codex help app-server daemon version" [
  ]

  # [internal] Run the detached pid-backed standalone updater loop
  export extern "codex help app-server daemon pid-update-loop" [
  ]

  # Proxy stdio bytes to the running app-server control socket
  export extern "codex help app-server proxy" [
  ]

  # [experimental] Generate TypeScript bindings for the app server protocol
  export extern "codex help app-server generate-ts" [
  ]

  # [experimental] Generate JSON Schema for the app server protocol
  export extern "codex help app-server generate-json-schema" [
  ]

  # [internal] Generate internal JSON Schema artifacts for Codex tooling
  export extern "codex help app-server generate-internal-json-schema" [
  ]

  # [experimental] Manage the app-server daemon with remote control enabled
  export extern "codex help remote-control" [
  ]

  # Start the app-server daemon with remote control enabled
  export extern "codex help remote-control start" [
  ]

  # Stop the app-server daemon
  export extern "codex help remote-control stop" [
  ]

  # Create and print a short-lived manual pairing code
  export extern "codex help remote-control pair" [
  ]

  # Generate shell completion scripts
  export extern "codex help completion" [
  ]

  # Update Codex to the latest version
  export extern "codex help update" [
  ]

  # Diagnose local Codex installation, config, auth, and runtime health
  export extern "codex help doctor" [
  ]

  # Run commands within a Codex-provided sandbox
  export extern "codex help sandbox" [
  ]

  # Debugging tools
  export extern "codex help debug" [
  ]

  # Render the raw model catalog as JSON
  export extern "codex help debug models" [
  ]

  # Tooling: helps debug the app server
  export extern "codex help debug app-server" [
  ]

  export extern "codex help debug app-server send-message-v2" [
  ]

  # Render the model-visible prompt input list as JSON
  export extern "codex help debug prompt-input" [
  ]

  # Replay a rollout trace bundle and write reduced state JSON
  export extern "codex help debug trace-reduce" [
  ]

  # Internal: reset local memory state for a fresh start
  export extern "codex help debug clear-memories" [
  ]

  # Execpolicy tooling
  export extern "codex help execpolicy" [
  ]

  # Check execpolicy files against a command
  export extern "codex help execpolicy check" [
  ]

  # Apply the latest diff produced by Codex agent as a `git apply` to your local working tree
  export extern "codex help apply" [
  ]

  # Resume a previous interactive session (picker by default; use --last to continue the most recent)
  export extern "codex help resume" [
  ]

  # Queue a message for an existing session
  export extern "codex help queue" [
  ]

  # Archive a saved session by id or session name
  export extern "codex help archive" [
  ]

  # Permanently delete a saved session by id or session name
  export extern "codex help delete" [
  ]

  # Inspect or migrate legacy local sessions to paginated thread history
  export extern "codex help migrate-rollouts" [
  ]

  # Unarchive a saved session by id or session name
  export extern "codex help unarchive" [
  ]

  # Fork a previous interactive session (picker by default; use --last to fork the most recent)
  export extern "codex help fork" [
  ]

  # [EXPERIMENTAL] Browse tasks from Codex Cloud and apply changes locally
  export extern "codex help cloud" [
  ]

  # Submit a new Codex Cloud task without launching the TUI
  export extern "codex help cloud exec" [
  ]

  # Show the status of a Codex Cloud task
  export extern "codex help cloud status" [
  ]

  # List Codex Cloud tasks
  export extern "codex help cloud list" [
  ]

  # Apply the diff for a Codex Cloud task locally
  export extern "codex help cloud apply" [
  ]

  # Show the unified diff for a Codex Cloud task
  export extern "codex help cloud diff" [
  ]

  # Internal: run the responses API proxy
  export extern "codex help responses-api-proxy" [
  ]

  # Internal: relay stdio to a Unix domain socket
  export extern "codex help stdio-to-uds" [
  ]

  # [EXPERIMENTAL] Run the standalone exec-server service
  export extern "codex help exec-server" [
  ]

  # Register an existing WebSocket exec-server as a remote environment
  export extern "codex help exec-server forward" [
  ]

  # Inspect feature flags
  export extern "codex help features" [
  ]

  # List known features with their stage and effective state
  export extern "codex help features list" [
  ]

  # Enable a feature in config.toml
  export extern "codex help features enable" [
  ]

  # Disable a feature in config.toml
  export extern "codex help features disable" [
  ]

  # Print this message or the help of the given subcommand(s)
  export extern "codex help help" [
  ]

}

export use completions *
