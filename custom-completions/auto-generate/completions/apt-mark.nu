# Display help and exit
extern "apt-mark" [

	...args
]

# Mark a package as automatically installed
extern "apt-mark auto" [

	...args
]

# Mark a package as manually installed
extern "apt-mark manual" [

	...args
]

# Hold a package, prevent automatic installation or removal
extern "apt-mark hold" [

	...args
]

# Cancel a hold on a package
extern "apt-mark unhold" [

	...args
]

# Show automatically installed packages
extern "apt-mark showauto" [

	...args
]

# Show manually installed packages
extern "apt-mark showmanual" [

	...args
]

# Show held packages
extern "apt-mark showhold" [

	...args
]