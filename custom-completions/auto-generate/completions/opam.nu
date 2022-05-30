# Display the manual for an OPAM command.
extern "opam" [

	...args
]

# 
extern "opam always never auto" [

	...args
]

# Display configuration options for packages.
extern "opam config" [
	--all(-a)					# Enable all the global and user configuration options.
	--csh					# Use csh-compatible mode for configuring OPAM.
	--dot-profile					# Name of the configuration file to update instead of ~/.
	--fish					# Use fish-compatible mode for configuring OPAM.
	--global(-g)					# Enable all the global configuration options.
	--list(-l)					# List the current configuration.
	--no-complete					# Do not load the auto-completion scripts in the environment.
	--no-switch-eval					# Do not install `opam-switch-eval` to switch & e… [See Man Page]
	--ocamlinit					# Modify ~/.
	--profile					# Modify ~/. profile (or ~/.
	--rec(-R)					# Recursive query.
	--sexp					# Display environment variables as an s-expression.
	--sh					# Use sh-compatible mode for configuring OPAM.
	--user(-u)					# Enable all the user configuration options.
	--zsh					# Use zsh-compatible mode for configuring OPAM.  DOMAINS.
	...args
]

# Return the environment variables PATH, MANPATH, OCAML_TOPLEVEL_PATH and CAML_LD_LIBRARY_PATH according to the currently selected compiler.
extern "opam env" [

	...args
]

# Execute the shell script given in parameter with the correct environment variables. [see manpage]
extern "opam exec" [

	...args
]

# Return the value associated with the given variable. [see manpage]
extern "opam var" [

	...args
]

# Return the list of all variables defined in the listed packages. [see manpage]
extern "opam list" [

	...args
]

# Substitute variables in the given files. The strings %{var}% are replaced by the value of the variable var [see manpage]
extern "opam subst" [

	...args
]

# returns include options.
extern "opam includes" [

	...args
]

# returns bytecode compile options.
extern "opam bytecomp" [

	...args
]

# returns assembly compile options.
extern "opam asmcomp" [

	...args
]

# returns bytecode linking options.
extern "opam bytelink" [

	...args
]

# Prints a summary of your setup, useful for bug-reports.
extern "opam report" [

	...args
]

# Display help about OPAM and OPAM commands.
extern "opam help" [

	...args
]

# Initialize OPAM state.
extern "opam init" [

	...args
]

# Install a list of packages.
extern "opam install" [

	...args
]

# Pin a given package to a specific version.
extern "opam pin" [

	...args
]

# Reinstall a list of packages.
extern "opam reinstall" [

	...args
]

# Remove a list of packages.
extern "opam remove uninstall" [

	...args
]

# Manage OPAM repositories.
extern "opam repository remote" [

	...args
]

# Search into the package list.
extern "opam search" [

	...args
]

# Display information about specific packages.
extern "opam show info" [

	...args
]

# Manage multiple installation of compilers.
extern "opam switch" [

	...args
]

# Update the list of available packages.
extern "opam update" [

	...args
]

# Upgrade the installed package to latest version.
extern "opam upgrade" [

	...args
]

# Administration tool for local repositories.
extern "opam admin" [
	--help					# Show this help in format FMT (pager, plain or groff).
	--version					# Show version information.
	...args
]

# Check a local repo for errors.
extern "opam check" [

	...args
]

# Add external dependencies.
extern "opam depexts" [

	...args
]

# Initialize a repo for serving files.
extern "opam make" [

	...args
]

# Compute statistics.
extern "opam stats" [

	...args
]

# Create a new switch, and install the given compiler there
extern "opam create" [

	...args
]

# Set the currently active switch
extern "opam set" [

	...args
]

# Remove the given switch from disk
extern "opam remove" [

	...args
]

# Save the current switch state to a file
extern "opam export" [

	...args
]

# Import a saved switch state
extern "opam import" [

	...args
]

# Lists base packages that can be used to create a new switch
extern "opam list-available" [

	...args
]

# Prints the name of the current switch
extern "opam show" [

	...args
]

# Sets the packages forming the immutable base for the selected switch
extern "opam set-base" [

	...args
]

# Sets a local alias for a given switch
extern "opam link" [

	...args
]