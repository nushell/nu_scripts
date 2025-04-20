# List links
extern "networkctl list" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Show link status
extern "networkctl status" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Show LLDP neighbors
extern "networkctl lldp" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Show current address label
extern "networkctl label" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Delete virtual netdevs
extern "networkctl delete" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Bring devices up
extern "networkctl up" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Bring devices down
extern "networkctl down" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Renew dynamic configurations
extern "networkctl renew" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Trigger DHCP reconfiguration of all connected clients
extern "networkctl forcerenew" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Reconfigure interfaces
extern "networkctl reconfigure" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Reload .network and .netdev files
extern "networkctl reload" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]

# Show help
extern "networkctl" [
	--help(-h)					# Show help
	--version					# Show version
	--no-pager					# Do not pipe output into a pager
	--no-legend					# Do not show the headers and footers
	--all(-a)					# Show status for all links
	--stats(-s)					# Show detailed link statics
	--full(-l)					# Do not ellipsize output
	--lines(-n)					# Number of journal entries to show
	...args
]