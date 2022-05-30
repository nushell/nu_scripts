# Use current default ("(echo get debconf/priority | debconf-communicate 2>/dev/null | string match -r '\w+$')") priority threshold
extern "dpkg-reconfigure" [
	--default-priority					# Use current default ("(echo get debconf/priority | debconf-communicate 2>/dev/null | string match -r '\w+$')") priority threshold
	--unseen-only(-u)					# Show only unseen question
	--force					# Reconfigure also inconsistent packages
	--no-reload					# Prevent reloading templates
	...args
]