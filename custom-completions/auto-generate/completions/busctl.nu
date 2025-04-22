# 
extern "busctl" [
	--quiet					# Suppress message payload display
	--verbose
	--list					# Show a flat list instead of a tree
	--unique					# Only show unique (:X.Y) names
	--acquired					# Only show well-known names
	--activatable					# Only show peers that have not been activated yet but can be
	--show-machine					# Show the machine the peers belong to
	--user
	--system
	--no-pager
	--no-legend
	--help(-h)
	--version
	...args
]