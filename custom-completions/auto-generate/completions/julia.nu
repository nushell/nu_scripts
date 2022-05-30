# Display version
extern "julia" [
	--version(-v)					# Display version
	--help(-h)					# Print help
	--help-hidden					# Print help of uncommon options
	--project					# Set DIR as the home project/environment
	--machine-file					# Run processes on hosts listed in FILE
	--quiet(-q)					# Quiet startup
	--bug-report					# Launch a bug report session
	--output-o					# Generate an object file
	--output-ji					# Generate a SYSIMAGE
	--output-unopt-bc					# Generate unoptimized LLVM bitcode
	--output-jit-bc					# Dump all IR
	--output-bc					# Generate LLVM bitcode
	--output-asm					# Generate an assembly
	...args
]