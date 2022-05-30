# Be more verbose
extern "xrandr" [
	--verbose					# Be more verbose
	--dryrun					# Make no changes
	--nograb					# Apply modifications without grabbing the screen
	--help					# Print out a summary of the usage and exit
	--version(-v)					# Print out the RandR version reported by the X server and exit
	--query(-q)					# Display the current state of the system
	--q1					# Use RandR version 1.1 protocol
	--q12					# Use RandR version 1.2 protocol
	--orientation(-o)					# Specify the orientation of the screen
	--listmonitors					# Print all defined monitors
	--listactivemonitors					# Print all active monitors
	--listproviders					# Print all available providers
	--setprovideroutputsource					# Set source for a given provider
	--setprovideroffloadsink					# Set provider for a given sink
	--noprimary					# Don't define a primary output
	--current					# Print current screen configuration
	--primary					# Set the output as primary
	--filter					# Set scaling filter method
	--properties					# Display the contents of properties for each output
	--dpi					# Set dpi to calculate reported physical screen size
	--rmmode					# Removes a mode from the server
	--addmode					# Add a mode to the set of valid modes for an output
	--delmode					# Remove a mode from the set of valid modes for an output
	--output					# Selects an output to reconfigure
	--auto					# Enable connected but disabled outputs
	--mode					# This selects a mode
	--preferred					# Select the same mode as --auto, but it do not automatically enable or disable the output
	--reflect					# Set reflection
	--rotate					# Set rotation
	--left-of					# Set position relative to the output
	--right-of					# Set position relative to the output
	--above					# Set position relative to the output
	--below					# Set position relative to the output
	--same-as					# Set position relative to the output
	--off					# Disables the output
	--brightness					# Set brightness. Multiplies gamma galues by brightness value
	...args
]