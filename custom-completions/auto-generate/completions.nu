extern "cargo" [
	--version(-V)		# Print version info and exit
	--list		# List installed commands
	--explain		# Run `rustc --explain CODE`
	--verbose(-v)		# Use verbose output (-vv very verbose/build.rs output)
	--quiet(-q)		# Do not print cargo log messages
	--color		# Coloring: auto, always, never
	--frozen		# Require Cargo.lock and cache are up to date
	--locked		# Require Cargo.lock is up to date
	--offline		# Run without accessing the network
	--config		# Override a configuration value (unstable)
	--help(-h)		# Print help information
	...args
]

extern "nu" [
	--help(-h)		# Display this help message
	--stdin		# redirect the stdin
	--login(-l)		# start as a login shell
	--interactive(-i)		# start as an interactive shell
	--version(-v)		# print the version
	--perf(-p)		# start and print performance metrics during startup
	--testbin		# run internal test binary
	--commands(-c)		# run the given commands and then exit
	--config		# start with an alternate config file
	--env-config		# start with an alternate environment config file
	--log-level		# log level for performance logs
	--threads(-t)		# threads to use for parallel commands
	...args
]

extern "bat" [
	--show-all(-A)		# Show non-printable characters like space, tab or newline. This option can also be used
	--plain(-p)		# Only show plain style, no decorations. This is an alias for '--style=plain'. When '-p'
	--pager		# =never').
	--language(-l)		# Explicitly set the language for syntax highlighting. The language can be specified as a
	--highlight-line(-H)		# ...               
	--file-name		# ...                   
	--diff(-d)		# Only show lines that have been added/removed/modified with respect to the Git index. Use
	--diff-context		# =N to control how much context you want to see.
	--diff-context		# Include N lines of context around added/removed/modified lines when using '--diff'.
	--tabs		# Set the tab width to T spaces. Use a width of 0 to pass tabs through directly
	--wrap		# Specify the text-wrapping mode (*auto*, never, character). The '--terminal-width' option
	--terminal-width		# Explicitly set the width of the terminal instead of determining it automatically. If
	--number(-n)		# Only show line numbers, no other decorations. This is an alias for '--style=numbers'
	--color		# Specify when to use colored output. The automatic mode only enables colors if an
	--italic-text		# Specify when to use ANSI sequences for italic text in the output. Possible values:
	--decorations		# Specify when to use the decorations that have been specified via '--style'. The
	--force-colorization(-f)		# Alias for '--decorations=always --color=always'. This is useful if the output of bat is
	--paging		# Specify when to use the pager. To disable the pager, use --paging=never' or its
	--pager		# Determine which pager is used. This option will override the PAGER and BAT_PAGER
	--map-syntax(-m)		# ...
	--ignored-suffix		# ...
	--theme		# Set the theme for syntax highlighting. Use '--list-themes' to see all available themes.
	--list-themes		# Display a list of supported themes for syntax highlighting.
	--style		# Configure which elements (line numbers, file headers, grid borders, Git modifications,
	--line-range(-r)		# ...                   
	--list-languages(-L)		# Display a list of supported languages for syntax highlighting.
	--unbuffered(-u)		# This option exists for POSIX-compliance reasons ('u' is for 'unbuffered'). The output is
	--diagnostic		# Show diagnostic information for bug reports.
	--acknowledgements		# Show acknowledgements.
	--help(-h)		# Print this help message.
	--version(-V)		# Show version information.
	...args
]

