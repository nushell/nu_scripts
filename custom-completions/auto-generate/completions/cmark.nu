# 
extern "cmark" [
	--width					# Wrap width
	--hardbreaks					# Treat newlines as hard line breaks
	--nobreaks					# Render soft line breaks as spaces
	--sourcepos					# Include source position attribute
	--validate-utf8					# Validate UTF-8
	--smart					# Use smart punctuation
	--unsafe					# Render raw HTML and dangerous URLs
	--help					# Print usage information
	--version					# Print version
	...args
]