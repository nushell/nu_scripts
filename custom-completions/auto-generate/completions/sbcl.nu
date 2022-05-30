# Print this message and exit.
extern "sbcl" [
	--help					# Print this message and exit.
	--version					# Print version information and exit.
	--core					# Use the specified core file instead of the default.
	--dynamic-space-size					# Size of reserved dynamic space in megabytes.
	--control-stack-size					# Size of reserved control stack in megabytes.
	--tls-limit					# Maximum number of thread-local symbols.
	--sysinit					# System-wide init-file to use instead of default.
	--userinit					# Per-user init-file to use instead of default.
	--no-sysinit					# Inhibit processing of any system-wide init-file.
	--no-userinit					# Inhibit processing of any per-user init-file.
	--disable-debugger					# Invoke sb-ext:disable-debugger.
	--noprint					# Run a Read-Eval Loop without printing results.
	--script					# Skip #! line, disable debugger, avoid verbosity.
	--quit					# Exit with code 0 after option processing.
	--non-interactive					# Sets both --quit and --disable-debugger.
	--eval					# Form to eval when processing this option.
	--load					# File to load when processing this option.
	...args
]