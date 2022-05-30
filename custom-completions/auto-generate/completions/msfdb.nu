# Enable debug output
extern "msfdb" [
	--debug(-d)					# Enable debug output
	--help(-h)					# Show help message
	--use-defaults					# Accept all defaults and do not prompt for options
	--ssl					# Enable SSL
	--no-ssl					# Disable SSL
	--ssl-disable-verify					# Disables (optional) client cert requests
	--no-ssl-disable-verify					# Enables (optional) client cert requests
	--environment					# Web service framework environment
	...args
]