# Show help
extern "poweroff" [
	--help					# Show help
	--halt					# Halt the machine
	--poweroff(-p)					# Switch off the machine
	--reboot					# Reboot the machine
	--force(-f)					# Force immediate halt/power-off/reboot
	--wtmp-only(-w)					# Just write wtmp record
	--no-wtmp(-d)					# Don't write wtmp record
	--no-wall					# Don't send wall message
	...args
]