[# 
extern "" [

	...args
]]

[# Base directory containing the document
extern "asciidoctor" [
	--base-dir(-B)					# Base directory containing the document
	--safe					# Set safe mode level to safe
	--attribute(-a)					# Define a document attribute
	--destination-dir(-D)					# Destination output directory
	--template-engine(-E)					# Template engine to use
	--load-path(-I)					# Add a directory to the load path
	--section-numbers(-n)					# Auto-number section titles
	--out-file(-o)					# Output file
	--source-dir(-R)					# Source directory
	--require(-r)					# Require the specified library
	--no-header-footer(-s)					# Output an embedded document
	--template-dir(-T)					# A directory containing custom converter templates
	--quiet(-q)					# Be quiet
	--trace					# Include backtrace information
	--verbose(-v)					# Be verbose
	--warnings(-w)					# Turn on script warnings
	--timings(-t)					# Print timings report
	--version(-V)					# Print program version
	...args
]]