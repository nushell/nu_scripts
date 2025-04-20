# Introspect a remote object
extern "gdbus introspect" [
	--system(-y)					# Connect to the system bus
	--session(-e)					# Connect to the session bus
	--help(-h)					# Prints help
	--xml(-x)					# Print XML
	--recurse(-r)					# Introspect children
	--only-properties(-p)					# Only print properties
	...args
]

# Monitor a remote object
extern "gdbus monitor" [
	--system(-y)					# Connect to the system bus
	--session(-e)					# Connect to the session bus
	--help(-h)					# Prints help
	--xml(-x)					# Print XML
	--recurse(-r)					# Introspect children
	--only-properties(-p)					# Only print properties
	...args
]

# Invoke a method on a remote object
extern "gdbus call" [
	--system(-y)					# Connect to the system bus
	--session(-e)					# Connect to the session bus
	--help(-h)					# Prints help
	--xml(-x)					# Print XML
	--recurse(-r)					# Introspect children
	--only-properties(-p)					# Only print properties
	...args
]

# Emit a signal
extern "gdbus emit" [
	--system(-y)					# Connect to the system bus
	--session(-e)					# Connect to the session bus
	--help(-h)					# Prints help
	--xml(-x)					# Print XML
	--recurse(-r)					# Introspect children
	--only-properties(-p)					# Only print properties
	...args
]

# Wait for a bus name to appear
extern "gdbus wait" [
	--system(-y)					# Connect to the system bus
	--session(-e)					# Connect to the session bus
	--help(-h)					# Prints help
	--xml(-x)					# Print XML
	--recurse(-r)					# Introspect children
	--only-properties(-p)					# Only print properties
	...args
]

# Prints help
extern "gdbus help" [
	--system(-y)					# Connect to the system bus
	--session(-e)					# Connect to the session bus
	--help(-h)					# Prints help
	--xml(-x)					# Print XML
	--recurse(-r)					# Introspect children
	--only-properties(-p)					# Only print properties
	...args
]

# Connect to the system bus
extern "gdbus" [
	--system(-y)					# Connect to the system bus
	--session(-e)					# Connect to the session bus
	--help(-h)					# Prints help
	--xml(-x)					# Print XML
	--recurse(-r)					# Introspect children
	--only-properties(-p)					# Only print properties
	...args
]