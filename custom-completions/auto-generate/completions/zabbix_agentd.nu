# Specify an alternate config-file.
extern "zabbix_agentd" [
	--config(-c)					# Specify an alternate config-file.
	--foreground(-f)					# Run Zabbix agent in foreground.
	--print(-p)					# Print known items and exit.
	--test(-t)					# Test single item and exit.
	--help(-h)					# Display this help and exit.
	--version(-V)					# Output version information and exit.
	...args
]