# List available controllers
extern "bluetoothctl list" [

	...args
]

# Controller information
extern "bluetoothctl show" [

	...args
]

# Select default controller
extern "bluetoothctl select" [

	...args
]

# List available devices
extern "bluetoothctl devices" [

	...args
]

# List paired devices
extern "bluetoothctl paired-devices" [

	...args
]

# Set controller alias
extern "bluetoothctl system-alias" [

	...args
]

# Reset controller alias
extern "bluetoothctl reset-alias" [

	...args
]

# Set controller power
extern "bluetoothctl power" [

	...args
]

# Set controller pairable mode
extern "bluetoothctl pairable" [

	...args
]

# Set controller discoverable mode
extern "bluetoothctl discoverable" [

	...args
]

# Set discoverable timeout
extern "bluetoothctl discoverable-timeout" [

	...args
]

# Enable/disable agent with given capability
extern "bluetoothctl agent" [

	...args
]

# Set agent as the default one
extern "bluetoothctl default-agent" [

	...args
]

# Enable/disable advertising with given type
extern "bluetoothctl advertise" [

	...args
]

# Set device alias
extern "bluetoothctl set-alias" [

	...args
]

# Scan for devices
extern "bluetoothctl scan" [

	...args
]

# Device information
extern "bluetoothctl info" [

	...args
]

# Pair with device
extern "bluetoothctl pair" [

	...args
]

# Cancel pairing with device
extern "bluetoothctl cancel-pairing" [

	...args
]

# Trust device
extern "bluetoothctl trust" [

	...args
]

# Untrust device
extern "bluetoothctl untrust" [

	...args
]

# Block device
extern "bluetoothctl block" [

	...args
]

# Unblock device
extern "bluetoothctl unblock" [

	...args
]

# Remove device
extern "bluetoothctl remove" [

	...args
]

# Connect device
extern "bluetoothctl connect" [

	...args
]

# Disconnect device
extern "bluetoothctl disconnect" [

	...args
]

# Set/Get advertise uuids
extern "bluetoothctl scan.uuids" [

	...args
]

# Set/Get advertise service data
extern "bluetoothctl scan.service" [

	...args
]

# Set/Get advertise manufacturer data
extern "bluetoothctl scan.manufacturer" [

	...args
]

# Set/Get advertise data
extern "bluetoothctl scan.data" [

	...args
]

# Set/Get advertise discoverable
extern "bluetoothctl scan.discoverable" [

	...args
]

# Set/Get advertise discoverable timeout
extern "bluetoothctl scan.discoverable-timeout" [

	...args
]

# Show/Enable/Disable TX power to be advertised
extern "bluetoothctl scan.tx-power" [

	...args
]

# Configure local name to be advertised
extern "bluetoothctl scan.name" [

	...args
]

# Configure custom appearance to be advertised
extern "bluetoothctl scan.appearance" [

	...args
]

# Set/Get advertise duration
extern "bluetoothctl scan.duration" [

	...args
]

# Set/Get advertise timeout
extern "bluetoothctl scan.timeout" [

	...args
]

# Set/Get advertise secondary channel
extern "bluetoothctl scan.secondary" [

	...args
]

# Clear advertise config
extern "bluetoothctl scan.clear" [

	...args
]

# List attributes
extern "bluetoothctl gatt.list-attributes" [

	...args
]

# Select attribute
extern "bluetoothctl gatt.select-attribute" [

	...args
]

# Select attribute
extern "bluetoothctl gatt.attribute-info" [

	...args
]

# Read attribute value
extern "bluetoothctl gatt.read" [

	...args
]

# Write attribute value
extern "bluetoothctl gatt.write" [

	...args
]

# Acquire Write file descriptor
extern "bluetoothctl gatt.acquire-write" [

	...args
]

# Release Write file descriptor
extern "bluetoothctl gatt.release-write" [

	...args
]

# Acquire Notify file descriptor
extern "bluetoothctl gatt.acquire-notify" [

	...args
]

# Release Notify file descriptor
extern "bluetoothctl gatt.release-notify" [

	...args
]

# Notify attribute value
extern "bluetoothctl gatt.notify" [

	...args
]

# Clone a device or attribute
extern "bluetoothctl gatt.clone" [

	...args
]

# Register profile to connect
extern "bluetoothctl gatt.register-application" [

	...args
]

# Unregister profile
extern "bluetoothctl gatt.unregister-application" [

	...args
]

# Register application service
extern "bluetoothctl gatt.register-service" [

	...args
]

# Unregister application service
extern "bluetoothctl gatt.unregister-service" [

	...args
]

# Register as Included service in
extern "bluetoothctl gatt.register-includes" [

	...args
]

# Unregister Included service
extern "bluetoothctl gatt.unregister-includes" [

	...args
]

# Register application characteristic
extern "bluetoothctl gatt.register-characteristic" [

	...args
]

# Unregister application characteristic
extern "bluetoothctl gatt.unregister-characteristic" [

	...args
]

# Register application descriptor
extern "bluetoothctl gatt.register-descriptor" [

	...args
]

# Unregister application descriptor
extern "bluetoothctl gatt.unregister-descriptor" [

	...args
]

# Set/Get advertise uuids
extern "bluetoothctl advertise.uuids" [

	...args
]

# Set/Get advertise service data
extern "bluetoothctl advertise.service" [

	...args
]

# Set/Get advertise manufacturer data
extern "bluetoothctl advertise.manufacturer" [

	...args
]

# Set/Get advertise data
extern "bluetoothctl advertise.data" [

	...args
]

# Set/Get advertise discoverable
extern "bluetoothctl advertise.discoverable" [

	...args
]

# Set/Get advertise discoverable timeout
extern "bluetoothctl advertise.discoverable-timeout" [

	...args
]

# Show/Enable/Disable TX power to be advertised
extern "bluetoothctl advertise.tx-power" [

	...args
]

# Configure local name to be advertised
extern "bluetoothctl advertise.name" [

	...args
]

# Configure custom appearance to be advertised
extern "bluetoothctl advertise.appearance" [

	...args
]

# Set/Get advertise duration
extern "bluetoothctl advertise.duration" [

	...args
]

# Set/Get advertise timeout
extern "bluetoothctl advertise.timeout" [

	...args
]

# Set/Get advertise secondary channel
extern "bluetoothctl advertise.secondary" [

	...args
]

# Clear advertise config
extern "bluetoothctl advertise.clear" [

	...args
]

# 
extern "bluetoothctl on off" [

	...args
]