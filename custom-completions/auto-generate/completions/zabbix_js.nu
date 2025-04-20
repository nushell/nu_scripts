# Specify the file name of the script to execute.
extern "zabbix_js" [
	--script(-s)					# Specify the file name of the script to execute.
	--param(-p)					# Specify the input parameter.
	--input(-i)					# Specify the file name of the input parameter.
	--loglevel(-l)					# Specify the log level.
	--timeout(-t)					# Specify the timeout in seconds.
	--help(-h)					# Display this help and exit.
	--version(-V)					# Output version information and exit.
	...args
]