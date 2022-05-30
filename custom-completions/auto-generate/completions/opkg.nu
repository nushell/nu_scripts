# Update list of available packages
extern "opkg update" [

	...args
]

# Upgrade packages
extern "opkg upgrade" [

	...args
]

# Install package(s)
extern "opkg install" [

	...args
]

# Configure unpacked package(s)
extern "opkg configure" [

	...args
]

# Remove package(s)
extern "opkg remove" [

	...args
]

# Flag package(s)
extern "opkg flag" [

	...args
]

# List available packages
extern "opkg list" [

	...args
]

# List installed packages
extern "opkg list-installed" [

	...args
]

# List installed and upgradable packages
extern "opkg list-upgradable" [

	...args
]

# List user modified configuration files
extern "opkg list-changed-conffiles" [

	...args
]

# List files belonging to <pkg>
extern "opkg files" [

	...args
]

# List package providing <file>
extern "opkg search" [

	...args
]

# List packages whose name or description matches <regexp>
extern "opkg find" [

	...args
]

# Display all info for <pkg>
extern "opkg info" [

	...args
]

# Display all status for <pkg>
extern "opkg status" [

	...args
]

# Download <pkg> to current directory
extern "opkg download" [

	...args
]

# compare versions using <= < > >= = << >>
extern "opkg compare-versions" [

	...args
]

# List installable package architectures
extern "opkg print-architecture" [

	...args
]

# list depends
extern "opkg depends" [

	...args
]

# list whatdepends
extern "opkg whatdepends" [

	...args
]

# list whatdepends recursively
extern "opkg whatdependsrec" [

	...args
]

# list whatrecommends
extern "opkg whatrecommends" [

	...args
]

# list whatsuggests
extern "opkg whatsuggests" [

	...args
]

# list whatprovides
extern "opkg whatprovides" [

	...args
]

# list whatconflicts
extern "opkg whatconflicts" [

	...args
]

# list whatreplaces
extern "opkg whatreplaces" [

	...args
]

# Query all packages not just those installed
extern "opkg" [

	...args
]