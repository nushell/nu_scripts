# Omit false conditionals
export extern "as" [
	--alternate					# Initially turn on alternate macro syntax
	--nocompress-debug-sections					# Dont compress DWARF debug sections
	--execstack					# Require executable stack for this object
	--noexecstack					# Dont require executable stack for this object
	--elf-stt-common					# Generate ELF common symbols with STT_COMMON type
	--sectname-subst					# Enable section name substitution sequences
	--gen-debug(-g)					# Generate debugging information
	--gstabs					# Generate STABS debugging information
	# --gstabs+					# (breaks the nu parser) Generate STABS debug info with GNU extensions   
	--gdwarf-2					# Generate DWARF2 debugging information
	--gdwarf-sections					# Generate per-function section names for DWARF line information
	--help					# Show help message and exit
	--target-help					# Show target specific options
	--mri(-M)					# Assemble in MRI compatibility mode
	--reduce-memory-overheads					# Prefer smaller memory use
	--statistics					# Print various measured statistics from execution
	--strip-local-absolute					# Strip local absolute symbols
	--traditional-format					# Use same format as native assembler when possible
	--version					# Print assembler version number and exit
	--no-warn(-W)					# Suppress warnings
	--warn					# Dont suppress warnings
	--fatal-warnings					# Treat warnings as errors
	--listing-lhs-width
	--listing-lhs-width2
	--listing-rhs-width
	--listing-cont-lines
	--32					# Generate 32 bits code
	--64					# Generate 64 bits code
	--x32					# Generate x32 code
	...args
]

# Generate ELF common symbols with STT_COMMON type
export extern "as yes no" [
	--alternate					# Initially turn on alternate macro syntax
	--nocompress-debug-sections					# Dont compress DWARF debug sections
	--execstack					# Require executable stack for this object
	--noexecstack					# Dont require executable stack for this object
	--elf-stt-common					# Generate ELF common symbols with STT_COMMON type
	--sectname-subst					# Enable section name substitution sequences
	--gen-debug(-g)					# Generate debugging information
	--gstabs					# Generate STABS debugging information
	# --gstabs+					# (breaks the nu parser) Generate STABS debug info with GNU extensions   
	--gdwarf-2					# Generate DWARF2 debugging information
	--gdwarf-sections					# Generate per-function section names for DWARF line information
	--help					# Show help message and exit
	--target-help					# Show target specific options
	--mri(-M)					# Assemble in MRI compatibility mode
	--reduce-memory-overheads					# Prefer smaller memory use
	--statistics					# Print various measured statistics from execution
	--strip-local-absolute					# Strip local absolute symbols
	--traditional-format					# Use same format as native assembler when possible
	--version					# Print assembler version number and exit
	--no-warn(-W)					# Suppress warnings
	--warn					# Dont suppress warnings
	--fatal-warnings					# Treat warnings as errors
	--listing-lhs-width
	--listing-lhs-width2
	--listing-rhs-width
	--listing-cont-lines
	--32					# Generate 32 bits code
	--64					# Generate 64 bits code
	--x32					# Generate x32 code
	...args
]