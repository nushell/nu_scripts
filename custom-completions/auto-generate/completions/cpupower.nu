[# 
extern "" [

	...args
]]

[# Show supported commands and general usage
extern "cpupower" [

	...args
]
# Show manpage for subcommands
extern "cpupower help" [

	...args
]
# Retrieve cpufreq kernel information
extern "cpupower frequency-info" [
	--debug(-e)					# Prints out debug information.
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core.
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware (only available to root).
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed.
	--driver(-d)					# Determines the used cpufreq kernel driver.
	--policy(-p)					# Gets the currently used cpufreq policy.
	--governors(-g)					# Determines available cpufreq governors.
	--stats(-s)					# Shows cpufreq statistics if available.
	--latency(-y)					# Determines the maximum latency on CPU frequency changes.
	--proc(-o)					# Prints out information like provided by the /proc/cpufreq interface in 2.4. and early 2.6. kernels.
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters.
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values.
	--related-cpus
	--affected-cpus(-a)
	...args
]
# Modify cpufreq settings
extern "cpupower frequency-set" [
	--related(-r)					# modify all hardware-related CPUs at the same time
	...args
]
# Retrieve cpu idle kernel information
extern "cpupower idle-info" [
	--silent(-f)					# Only print a summary of all available C-states in the system.
	...args
]
# Set cpu idle state specific kernel options
extern "cpupower idle-set" [
	--enable-all(-E)					# Enable all idle states if not enabled already.
	...args
]
# Set processor power related kernel or hardware config
extern "cpupower set" [
	--related(-r)					# modify all hardware-related CPUs at the same time
	--enable-all(-E)					# Enable all idle states if not enabled already.
	--perf-bias(-b)					# Set relative importance of performance vs energy savings.
	...args
]
# Show processor power related kernel or hardware config
extern "cpupower info" [
	--debug(-e)					# Prints out debug information.
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core.
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware (only available to root).
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed.
	--driver(-d)					# Determines the used cpufreq kernel driver.
	--policy(-p)					# Gets the currently used cpufreq policy.
	--governors(-g)					# Determines available cpufreq governors.
	--stats(-s)					# Shows cpufreq statistics if available.
	--latency(-y)					# Determines the maximum latency on CPU frequency changes.
	--proc(-o)					# Prints out information like provided by the /proc/cpufreq interface in 2.4. and early 2.6. kernels.
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters.
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values.
	--related-cpus
	--affected-cpus(-a)
	--silent(-f)					# Only print a summary of all available C-states in the system.
	--perf-bias(-b)					# Get relative importance of performance vs energy savings.
	...args
]
# Report processor frequency and idle statistics
extern "cpupower monitor" [

	...args
]
# 
extern "cpupower Determines which CPUs run at the same hardware frequency." [

	...args
]
# 
extern "cpupower Determines which CPUs need to have their frequency coordinated by software." [

	...args
]]