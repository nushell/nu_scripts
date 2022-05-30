# Suppresses read of ~/.irbrc
extern "irb" [
	--encoding(-E)					# Specify default text encoding
	--context-mode					# Create Binding Object
	--echo					# Show result
	--noecho					# Don't show result
	--inspect					# Use 'inspect' for output
	--noinspect					# Don't use 'inspect' for output
	--readline					# Use Readline extension module
	--noreadline					# Don't use Readline extension module
	--prompt					# Switch prompt mode
	--prompt-mode					# Switch prompt mode
	--inf-ruby-mode					# Use prompt for emacs inf-ruby-mode
	--sample-book-mode					# Simple prompt mode
	--simple-prompt					# Simple prompt mode
	--noprompt					# No prompt mode
	--single-irb					# Share self with sub-irb
	--tracer					# Displays trace for each execution of commands
	--verbose					# Show details
	--noverbose					# Don't show details
	--version(-v)					# Print the version of irb
	--help(-h)					# Print a summary of options
	...args
]