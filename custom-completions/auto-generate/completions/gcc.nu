# Use specified version of the C++ ABI
extern "gcc" [
	--help					# Print help
	--target-help					# Print a description of target specific options for each tool
	--version					# Display the version number and copyrights
	--coverage					# This option is used to compile and link code instrumented for coverage analysis
	--param					# In some places, GCC uses various constants to control the amount of optimization that is done
	--help					# Print text describing all the command line options instead of preprocessing anything
	--target-help					# Print text describing all the command line options instead of preprocessing anything
	--version					# Print out GNU CPP’s version number
	...args
]

# Only meaningful in line-wrapping mode
extern "gcc once" [
	--help					# Print help
	--target-help					# Print a description of target specific options for each tool
	--version					# Display the version number and copyrights
	--coverage					# This option is used to compile and link code instrumented for coverage analysis
	--param					# In some places, GCC uses various constants to control the amount of optimization that is done
	--help					# Print text describing all the command line options instead of preprocessing anything
	--target-help					# Print text describing all the command line options instead of preprocessing anything
	--version					# Print out GNU CPP’s version number
	...args
]

# Warn about strict aliasing rules
extern "gcc 2" [
	--help					# Print help
	--target-help					# Print a description of target specific options for each tool
	--version					# Display the version number and copyrights
	--coverage					# This option is used to compile and link code instrumented for coverage analysis
	--param					# In some places, GCC uses various constants to control the amount of optimization that is done
	--help					# Print text describing all the command line options instead of preprocessing anything
	--target-help					# Print text describing all the command line options instead of preprocessing anything
	--version					# Print out GNU CPP’s version number
	...args
]

# Specify the source language
extern "gcc c  c-header  cpp-output" [
	--help					# Print help
	--target-help					# Print a description of target specific options for each tool
	--version					# Display the version number and copyrights
	--coverage					# This option is used to compile and link code instrumented for coverage analysis
	--param					# In some places, GCC uses various constants to control the amount of optimization that is done
	--help					# Print text describing all the command line options instead of preprocessing anything
	--target-help					# Print text describing all the command line options instead of preprocessing anything
	--version					# Print out GNU CPP’s version number
	...args
]

# Set the default ELF image symbol visibility
extern "gcc default internal hidden protected" [
	--help					# Print help
	--target-help					# Print a description of target specific options for each tool
	--version					# Display the version number and copyrights
	--coverage					# This option is used to compile and link code instrumented for coverage analysis
	--param					# In some places, GCC uses various constants to control the amount of optimization that is done
	--help					# Print text describing all the command line options instead of preprocessing anything
	--target-help					# Print text describing all the command line options instead of preprocessing anything
	--version					# Print out GNU CPP’s version number
	...args
]