# Display the manual for an OPAM command
extern "opam" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Colorize the output
extern "opam always never auto" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Display configuration options for packages
extern "opam config" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Return PATH, MANPATH, OCAML_TOPLEVEL_PATH and CAML_LD_LIBRARY_PATH for compiler
extern "opam env" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Execute the shell script given in parameter with the correct environment variables
extern "opam exec" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Return the value associated with the given variable
extern "opam var" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Return the list of all variables defined in the listed packages
extern "opam list" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Substitute %{var}% variables
extern "opam subst" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# returns include options
extern "opam includes" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# returns bytecode compile options
extern "opam bytecomp" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# returns assembly compile options
extern "opam asmcomp" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# returns bytecode linking options
extern "opam bytelink" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Prints a summary of your setup, useful for bug-reports
extern "opam report" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Display help about OPAM and OPAM commands
extern "opam help" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Initialize OPAM state
extern "opam init" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Install a list of packages
extern "opam install" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Pin a given package to a specific version
extern "opam pin" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Reinstall a list of packages
extern "opam reinstall" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Remove a list of packages
extern "opam remove uninstall" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Manage OPAM repositories
extern "opam repository remote" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Search into the package list
extern "opam search" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Display information about specific packages
extern "opam show info" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Manage multiple installation of compilers
extern "opam switch" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Update the list of available packages
extern "opam update" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Upgrade the installed package to latest version
extern "opam upgrade" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Administration tool for local repositories
extern "opam admin" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Check a local repo for errors
extern "opam check" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Add external dependencies
extern "opam depexts" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Initialize a repo for serving files
extern "opam make" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Compute statistics
extern "opam stats" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Create a new switch, and install the given compiler there
extern "opam create" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Set the currently active switch
extern "opam set" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Remove the given switch from disk
extern "opam remove" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Save the current switch state to a file
extern "opam export" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Import a saved switch state
extern "opam import" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Lists base packages that can be used to create a new switch
extern "opam list-available" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Prints the name of the current switch
extern "opam show" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Sets the packages forming the immutable base for the selected switch
extern "opam set-base" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]

# Sets a local alias for a given switch
extern "opam link" [
	--help					# Display the manual for an OPAM command
	--version					# Show version information
	--color					# Colorize the output
	#--compat-mode-1.0					# Compatibility mode with OPAM 1.0
	--debug					# Print debug message on stdout
	--git-version					# Print the git version if it exists and exit
	--no-aspcud					# Do not use the external aspcud solver, even if available
	--no-base-packages					# Do not install base packages
	--quiet(-q)					# Be quiet when installing a new compiler
	--root(-r)					# Use ROOT as the current root path
	--strict					# Fail whenever an error is found in a package definition or a configuration file
	--switch					# Use SWITCH as the current compiler switch
	--verbose(-v)					# Be more verbose
	--yes(-y)					# Disable interactive mode and answer yes to all questions
	--all(-a)					# Enable all the global and user configuration options
	--csh					# Use csh-compatible mode for configuring OPAM
	--dot-profile					# Name of the configuration file to update instead of ~/
	--fish					# Use fish-compatible mode for configuring OPAM
	--global(-g)					# Enable all the global configuration options
	--list(-l)					# List the current configuration
	--no-complete					# Do not load the auto-completion scripts in the environment
	--no-switch-eval					# Do not install `opam-switch-eval`
	--ocamlinit					# Modify ~/
	--profile					# Modify ~/. profile
	--rec(-R)					# Recursive query
	--sexp					# Display environment variables as an s-expression
	--sh					# Use sh-compatible mode for configuring OPAM
	--user(-u)					# Enable all the user configuration options
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS
	--help					# Show this help in format FMT (pager, plain or groff)
	--version					# Show version information
	...args
]