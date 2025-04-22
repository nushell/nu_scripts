# 
extern "mkbundle" [
	--cross
	--fetch-target
	--lists-targets					# Show all of the available remote cross compilation targets
	--local-targets					# Show all of the available local cross compilation targets
	--in-tree
	--managed-linker
	--machine-config
	--sdk
	--mono-api-struct-path
	--nomain					# Generate the host stub without a main() function
	--static					# Statically link to mono and glib
	--aot-runtime
	--aot-mode
	...args
]