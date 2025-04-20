# 
extern "" [

	...args
]

# Show supported commands and general usage
extern "cpupower" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# Show manpage for subcommands
extern "cpupower help" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# Retrieve cpufreq kernel information
extern "cpupower frequency-info" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# Modify cpufreq settings
extern "cpupower frequency-set" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# Retrieve cpu idle kernel information
extern "cpupower idle-info" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# Set cpu idle state specific kernel options
extern "cpupower idle-set" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# Set processor power related kernel or hardware config
extern "cpupower set" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# Show processor power related kernel or hardware config
extern "cpupower info" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# Report processor frequency and idle statistics
extern "cpupower monitor" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# 
extern "cpupower Determines which CPUs run at the same hardware frequency" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]

# 
extern "cpupower Determines which CPUs need to have their frequency coordinated by software" [
	--help(-h)					# Show supported commands and general usage
	--cpu(-c)
	--debug(-e)					# Prints out debug information
	--freq(-f)					# Get frequency the CPU currently runs at, according to the cpufreq core
	--hwfreq(-w)					# Get frequency the CPU currently runs at, by reading it from hardware
	--hwlimits(-l)					# Determine the minimum and maximum CPU frequency allowed
	--driver(-d)					# Determines the used cpufreq kernel driver
	--policy(-p)					# Gets the currently used cpufreq policy
	--governors(-g)					# Determines available cpufreq governors
	--stats(-s)					# Shows cpufreq statistics if available
	--latency(-y)					# Determines the maximum latency on CPU frequency changes
	--proc(-o)					# Prints out information like the old /proc/cpufreq
	--human(-m)					# human-readable output for the -f, -w, -s and -y parameters
	--no-rounding(-n)					# Output frequencies and latencies without rounding off values
	--related-cpus
	--affected-cpus(-a)
	--related(-r)					# modify all hardware-related CPUs at the same time
	--silent(-f)					# Only print a summary of all available C-states in the system
	--enable-all(-E)					# Enable all idle states if not enabled already
	--perf-bias(-b)					# Set relative importance of performance vs energy savings
	--perf-bias(-b)					# Get relative importance of performance vs energy savings
	...args
]