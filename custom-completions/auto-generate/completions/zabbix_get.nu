# Specify host name or IP address of a host.
extern "zabbix_get" [
	--host(-s)					# Specify host name or IP address of a host.
	--port(-p)					# Specify port number of agent running on the host.
	--source-address(-I)					# Specify source IP address.
	--timeout(-t)					# Specify timeout.
	--key(-k)					# Specify key of item to retrieve value for.
	--help(-h)					# Display this help and exit.
	--version(-V)					# Output version information and exit.
	--tls-agent-cert-issuer					# Allowed agent certificate issuer.
	--tls-agent-cert-subject					# Allowed agent certificate subject.
	--tls-cert-file					# Full path the certificate or certificate chain.
	--tls-key-file					# Full path of a file with the private key.
	--tls-psk-identity					# PSK-identity string.
	--tls-psk-file					# Full path of a file with the pre-shared key.
	--tls-cipher13					# Cipher string for OpenSSL.
	--tls-cipher					# GnuTLS priority string.
	...args
]