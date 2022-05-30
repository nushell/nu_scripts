# IPv4 only
extern "ncat" [
	--unixsock(-U)					# Use Unix domain sockets
	--udp(-u)					# Use UDP
	--sctp					# Use SCTP
	--listen(-l)					# Listen for connections
	--keep-open(-k)					# Accept multiple connections
	--broker					# Connection brokering
	--ssl					# Use SSL
	--ssl-verify					# Verify server certificates
	--append-output					# Append output
	--verbose(-v)					# Be verbose
	--crlf(-C)					# Use CRLF as EOL
	--help(-h)					# Help screen
	---recv-only					# Only receive data
	--send-only					# Only send data
	--no-shutdown					# Do not shutdown into half-duplex mode
	--telnet(-t)					# Answer Telnet negotiations
	--version					# Display version
	...args
]