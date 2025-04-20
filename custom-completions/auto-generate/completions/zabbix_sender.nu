# Hostname or IP address of Zabbix server.
extern "zabbix_sender" [
	--zabbix-server(-z)					# Hostname or IP address of Zabbix server.
	--port(-p)					# Specify port number of agent running on the host.
	--source-address(-I)					# Source IP address.
	--timeout(-t)					# Specify timeout.
	--host(-s)					# Specify host name the item belongs to.
	--key(-k)					# Specify item key to send value to.
	--value(-o)					# Specify item value.
	--input-file(-i)					# Load values from input file.
	--help(-h)					# Display this help and exit.
	--version(-V)					# Output version information and exit.
	--with-timestamps(-T)					# Input file contains timestamps
	--with-ns(-N)					# Timestamps have nanosecond portion.
	--real-time(-r)					# Send values as soon as they are received.
	--verbose(-v)					# Verbose mode, -vv for more details.
	--tls-server-cert-issuer					# Allowed server certificate issuer.
	--tls-server-cert-subject					# Allowed server certificate subject.
	--tls-cert-file					# Full path of the certificate or certificate chain.
	--tls-key-file					# Full path of  the private key.
	--tls-psk-identity					# PSK-identity string.
	--tls-psk-file					# Full path of a file with the pre-shared key.
	--tls-cipher13					# Cipher string for OpenSSL.
	--tls-cipher					# GnuTLS priority string.
	...args
]