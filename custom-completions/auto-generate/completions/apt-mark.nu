# Display help and exit
extern "apt-mark" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--color					# Turn colors on
	--no-color					# Turn colors off
	...args
]

# Mark a package as automatically installed
extern "apt-mark auto" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--color					# Turn colors on
	--no-color					# Turn colors off
	...args
]

# Mark a package as manually installed
extern "apt-mark manual" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--color					# Turn colors on
	--no-color					# Turn colors off
	...args
]

# Mark all dependencies of meta packages as auto
extern "apt-mark minimize-manual" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--color					# Turn colors on
	--no-color					# Turn colors off
	...args
]

# Hold a package, prevent automatic installation or removal
extern "apt-mark hold" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--color					# Turn colors on
	--no-color					# Turn colors off
	...args
]

# Cancel a hold on a package
extern "apt-mark unhold" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--color					# Turn colors on
	--no-color					# Turn colors off
	...args
]

# Show automatically installed packages
extern "apt-mark showauto" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--color					# Turn colors on
	--no-color					# Turn colors off
	...args
]

# Show manually installed packages
extern "apt-mark showmanual" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--color					# Turn colors on
	--no-color					# Turn colors off
	...args
]

# Show held packages
extern "apt-mark showhold" [
	--help(-h)					# Display help and exit
	--version(-v)					# Display version and exit
	--color					# Turn colors on
	--no-color					# Turn colors off
	...args
]