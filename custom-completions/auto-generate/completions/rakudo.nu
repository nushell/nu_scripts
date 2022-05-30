# Check syntax only. Runs BEGIN and CHECK blocks
extern "rakudo" [
	--doc					# Extract documentation and print it as text
	--target					# Specify compilation stage to emit
	--stagestats					# Display time spent in the compilation stages
	--profile-stage					# Write profile information for the given compilation stage to a file. Use --profile-compile to set name and format
	--tracing					# Output a line to stderr on every interpreter instr, if enabled in MoarVM
	...args
]

# Specify compilation stage to emit
extern "rakudo start parse syntaxcheck ast optimize mast mbc moar" [
	--doc					# Extract documentation and print it as text
	--target					# Specify compilation stage to emit
	--stagestats					# Display time spent in the compilation stages
	--profile-stage					# Write profile information for the given compilation stage to a file. Use --profile-compile to set name and format
	--tracing					# Output a line to stderr on every interpreter instr, if enabled in MoarVM
	...args
]