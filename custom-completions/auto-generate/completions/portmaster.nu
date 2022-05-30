# run make config for all ports (overrides -G).
extern "portmaster" [
	--force-config					# run make config for all ports (overrides -G).
	--no-confirm					# do not ask the user to confirm the list of port… [See Man Page]
	--no-term-title					# do not update the xterm title bar.
	--no-index-fetch					# skip fetching the INDEX file.
	--index					# use INDEX-[7-9] exclusively to check if a port is up to date.
	--index-first					# use the INDEX for status, but double-check with the port.
	--index-only					# do not try to use /usr/ports.
	--delete-build-only					# delete ports that are build-only dependencies a… [See Man Page]
	--update-if-newer					# (only for multiple ports listed on the command … [See Man Page]
	--packages(-P)					# use packages, but build port if not available.
	--packages-only					# fail if no package is available.
	--packages-build					# use packages for all build dependencies.
	--packages-if-newer					# use package if newer than installed even if the… [See Man Page]
	--always-fetch					# fetch package even if it already exists locally.
	--local-packagedir					# where local packages can be found, will fall ba… [See Man Page]
	--packages-local					# use packages from -local-packagedir only.
	--delete-packages					# after installing from a package, delete it El P… [See Man Page]
	--show-work					# show what dependent ports are, and are not inst… [See Man Page]
	--list-origins					# list directories from /usr/ports for root and leaf ports.
	--help(-h)					# display help message.
	--version					# display the version number El ENVIRONMENT The d… [See Man Page]
	...args
]