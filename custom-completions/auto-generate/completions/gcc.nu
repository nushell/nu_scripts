# Use specified version of the C++ ABI
extern "gcc" [
	--help					# Print help
	--target-help					# Print a description of target specific options for each tool
	--version					# Display the version number and copyrights
	--coverage					# Used to compile and link code instrumented for coverage analysis
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
	--coverage					# Used to compile and link code instrumented for coverage analysis
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
	--coverage					# Used to compile and link code instrumented for coverage analysis
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
	--coverage					# Used to compile and link code instrumented for coverage analysis
	--param					# In some places, GCC uses various constants to control the amount of optimization that is done
	--help					# Print text describing all the command line options instead of preprocessing anything
	--target-help					# Print text describing all the command line options instead of preprocessing anything
	--version					# Print out GNU CPP’s version number
	...args
]

# Which dependences are considered costly by the target during instruction scheduling
extern "gcc no all true_store_to_load store_to_load" [
	--help					# Print help
	--target-help					# Print a description of target specific options for each tool
	--version					# Display the version number and copyrights
	--coverage					# Used to compile and link code instrumented for coverage analysis
	--param					# In some places, GCC uses various constants to control the amount of optimization that is done
	--help					# Print text describing all the command line options instead of preprocessing anything
	--target-help					# Print text describing all the command line options instead of preprocessing anything
	--version					# Print out GNU CPP’s version number
	...args
]

# Which nop insertion scheme to use during the second scheduling pass
extern "gcc no pad regroup_exact" [
	--help					# Print help
	--target-help					# Print a description of target specific options for each tool
	--version					# Display the version number and copyrights
	--coverage					# Used to compile and link code instrumented for coverage analysis
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
	--coverage					# Used to compile and link code instrumented for coverage analysis
	--param					# In some places, GCC uses various constants to control the amount of optimization that is done
	--help					# Print text describing all the command line options instead of preprocessing anything
	--target-help					# Print text describing all the command line options instead of preprocessing anything
	--version					# Print out GNU CPP’s version number
	...args
]