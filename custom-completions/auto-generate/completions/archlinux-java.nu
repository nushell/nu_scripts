# List installed Java environments and enabled one
extern "archlinux-java status" [

	...args
]

# Force <JAVA_ENV> as default
extern "archlinux-java set" [

	...args
]

# Unset current default Java environment
extern "archlinux-java unset" [

	...args
]

# Return the short name of the Java environment set as default
extern "archlinux-java get" [

	...args
]

# Fix an invalid/broken default Java environment configuration
extern "archlinux-java fix" [

	...args
]

# Show help
extern "archlinux-java help" [

	...args
]