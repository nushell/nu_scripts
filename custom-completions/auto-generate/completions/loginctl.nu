# Show all properties, including empty ones
extern "loginctl" [
	--all(-a)					# Show all properties, including empty ones
	--full(-l)					# Do not ellipsize output
	--help(-h)					# Show this help
	--no-ask-password					# Don't prompt for password
	--no-legend					# Do not show the headers and footers
	--no-pager					# Do not pipe output into a pager
	--value					# When showing properties, only print the value
	--version					# Show package version
	...args
]