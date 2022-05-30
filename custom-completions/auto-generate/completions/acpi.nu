# Show battery information
extern "acpi" [
	--battery(-b)					# Show battery information
	--without-battery(-B)					# Suppress battery information
	--thermal(-t)					# Show thermal information
	--without-thermal(-T)					# Suppress thermal information
	--ac-adapter(-a)					# Show ac adapter information
	--without-ac-adapter(-A)					# Suppress ac-adapter information
	--everything(-V)					# Show every device, overrides above options
	--show-empty(-s)					# Show non-operational devices
	--hide-empty(-S)					# Hide non-operational devices
	--celcius(-c)					# Use celsius as the temperature unit
	--fahrenheit(-f)					# Use fahrenheit as the temperature unit
	--kelvin(-k)					# Use kelvin as the temperature unit
	--directory(-d)					# <dir> path to ACPI info (/proc/acpi)
	--help(-h)					# Display help and exit
	--version(-v)					# Output version information and exit
	...args
]