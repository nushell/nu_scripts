# Use current default priority threshold
extern "dpkg-reconfigure" [
	--default-priority					# Use current default priority threshold
	--unseen-only(-u)					# Show only unseen question
	--force					# Reconfigure also inconsistent packages
	--no-reload					# Prevent reloading templates
	...args
]