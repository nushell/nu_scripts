# Shows the current configuration and device information
extern "wg show" [

	...args
]

# Shows the current configuration of an interface
extern "wg showconf" [

	...args
]

# Change the current configuration
extern "wg set" [

	...args
]

# Applies a configuration to an interface
extern "wg setconf" [

	...args
]

# Appends a configuration to an interface
extern "wg addconf" [

	...args
]

# Synchronizes a configuration to an interface
extern "wg syncconf" [

	...args
]

# Generates a new private key
extern "wg genkey" [

	...args
]

# Generates a new preshared key
extern "wg genpsk" [

	...args
]

# Computes public key given a private key
extern "wg pubkey" [

	...args
]

# Shows information for all interfaces
extern "wg all" [

	...args
]

# 
extern "wg public-key private-key listen-port fwmark peers preshared-keys endpoints allowed-ips latest-handshakes transfer persistent-keepalive dump" [

	...args
]

# 
extern "wg remove preshared key" [

	...args
]

# 
extern "wg" [

	...args
]