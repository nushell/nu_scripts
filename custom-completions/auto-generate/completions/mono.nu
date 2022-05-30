# Show help
extern "mono" [
	--help(-h)					# Show help
	--version(-V)					# Show version
	--aot-path					# Show additional directories to search for AOT images
	--attach					# Disable the attach functionality
	--config					# Read configuration from file instead of using default one
	--gc					# Use the Garbage Collector engine
	--gc-debug					# Specify MONO_GC_DEBUG environment variable value
	--gc-params					# Specify MONO_GC_PARAMS environment variable value
	--interpreter					# Use Mono interpreter to execute a given assembly
	--hybrid-aot					# Run assemblies that have been stripped of IL
	--llvm					# Use the LLVM optimization and code generation engine to JIT or AOT compile
	--ffast-math					# Use Mono and LLVM aggressive floating point optimizations
	--response					# Use a response file
	--server					# Optimize the virtual machine to be better suited for server operations
	--use-map-jit					# Generate code using MAP_JIT on MacOS
	--profile					# Use a profiler module with the given arguments
	--trace					# Show method names as they are invoked
	--no-x86-stack-align					# Dont align stack frames on the x86 architecture
	--jitmap					# Generate a JIT method map in a /tmp/perf-PID.map file
	--bisect					# This flag is used by the automatic optimization bug bisector
	--break
	--breakonex					# Use a breakpoint on exceptions
	--compile-all					# Compile all the methods in an assembly
	--verbose(-v)					# Show more messages
	...args
]

# Show version
extern "mono number" [
	--help(-h)					# Show help
	--version(-V)					# Show version
	--aot-path					# Show additional directories to search for AOT images
	--attach					# Disable the attach functionality
	--config					# Read configuration from file instead of using default one
	--gc					# Use the Garbage Collector engine
	--gc-debug					# Specify MONO_GC_DEBUG environment variable value
	--gc-params					# Specify MONO_GC_PARAMS environment variable value
	--interpreter					# Use Mono interpreter to execute a given assembly
	--hybrid-aot					# Run assemblies that have been stripped of IL
	--llvm					# Use the LLVM optimization and code generation engine to JIT or AOT compile
	--ffast-math					# Use Mono and LLVM aggressive floating point optimizations
	--response					# Use a response file
	--server					# Optimize the virtual machine to be better suited for server operations
	--use-map-jit					# Generate code using MAP_JIT on MacOS
	--profile					# Use a profiler module with the given arguments
	--trace					# Show method names as they are invoked
	--no-x86-stack-align					# Dont align stack frames on the x86 architecture
	--jitmap					# Generate a JIT method map in a /tmp/perf-PID.map file
	--bisect					# This flag is used by the automatic optimization bug bisector
	--break
	--breakonex					# Use a breakpoint on exceptions
	--compile-all					# Compile all the methods in an assembly
	--verbose(-v)					# Show more messages
	...args
]

# Disable the attach functionality
extern "mono disable" [
	--help(-h)					# Show help
	--version(-V)					# Show version
	--aot-path					# Show additional directories to search for AOT images
	--attach					# Disable the attach functionality
	--config					# Read configuration from file instead of using default one
	--gc					# Use the Garbage Collector engine
	--gc-debug					# Specify MONO_GC_DEBUG environment variable value
	--gc-params					# Specify MONO_GC_PARAMS environment variable value
	--interpreter					# Use Mono interpreter to execute a given assembly
	--hybrid-aot					# Run assemblies that have been stripped of IL
	--llvm					# Use the LLVM optimization and code generation engine to JIT or AOT compile
	--ffast-math					# Use Mono and LLVM aggressive floating point optimizations
	--response					# Use a response file
	--server					# Optimize the virtual machine to be better suited for server operations
	--use-map-jit					# Generate code using MAP_JIT on MacOS
	--profile					# Use a profiler module with the given arguments
	--trace					# Show method names as they are invoked
	--no-x86-stack-align					# Dont align stack frames on the x86 architecture
	--jitmap					# Generate a JIT method map in a /tmp/perf-PID.map file
	--bisect					# This flag is used by the automatic optimization bug bisector
	--break
	--breakonex					# Use a breakpoint on exceptions
	--compile-all					# Compile all the methods in an assembly
	--verbose(-v)					# Show more messages
	...args
]

# Use the Garbage Collector engine
extern "mono boehm\tBoehm sgen\tSGen" [
	--help(-h)					# Show help
	--version(-V)					# Show version
	--aot-path					# Show additional directories to search for AOT images
	--attach					# Disable the attach functionality
	--config					# Read configuration from file instead of using default one
	--gc					# Use the Garbage Collector engine
	--gc-debug					# Specify MONO_GC_DEBUG environment variable value
	--gc-params					# Specify MONO_GC_PARAMS environment variable value
	--interpreter					# Use Mono interpreter to execute a given assembly
	--hybrid-aot					# Run assemblies that have been stripped of IL
	--llvm					# Use the LLVM optimization and code generation engine to JIT or AOT compile
	--ffast-math					# Use Mono and LLVM aggressive floating point optimizations
	--response					# Use a response file
	--server					# Optimize the virtual machine to be better suited for server operations
	--use-map-jit					# Generate code using MAP_JIT on MacOS
	--profile					# Use a profiler module with the given arguments
	--trace					# Show method names as they are invoked
	--no-x86-stack-align					# Dont align stack frames on the x86 architecture
	--jitmap					# Generate a JIT method map in a /tmp/perf-PID.map file
	--bisect					# This flag is used by the automatic optimization bug bisector
	--break
	--breakonex					# Use a breakpoint on exceptions
	--compile-all					# Compile all the methods in an assembly
	--verbose(-v)					# Show more messages
	...args
]