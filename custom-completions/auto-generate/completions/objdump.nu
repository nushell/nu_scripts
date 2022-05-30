# Display archive header information
extern "objdump" [
	--archive-headers(-a)					# Display archive header information
	--file-headers(-f)					# Display contents of the overall file header
	--private-headers(-p)					# Display object format specific file header contents
	--header(-h)					# Display contents of section headers
	--section-header(-h)					# Display content of section headers
	--all-headers(-x)					# Display the contents of all headers
	--disassemble(-d)					# Display assembler contents of executable sections
	--disassemble-all(-D)					# Display assembler contents of all sections
	--source(-S)					# Intermix source code with disassembly
	--full-contents(-s)					# Display full contents of all sections requested
	--debugging(-g)					# Display debug information in object file
	--debugging-tags(-e)					# Display debug information using ctags style
	--stabs(-G)					# Display (in raw form) any STABS info in file
	--syms(-t)					# Display contents of symbol table(s)
	--dynamic-syms(-T)					# Display contents of dynamic symbol table
	--reloc(-r)					# Display relocation entries in file
	--dynamic-reloc(-R)					# Display dynamic relocation entries in file
	--version(-v)					# Display version number
	--info(-i)					# List object formats and architectures supported
	--help(-H)					# Display help
	--file-start-context					# Include context from start of file (with -S)
	--line-numbers(-l)					# Include line numbers and filenames in output
	--file-offsets(-F)					# Include file offsets when displaying information
	--wide(-w)					# Format output for more than 80 columns
	--disassemble-zeroes(-z)					# Do not skip blocks of zeroes when disassembling
	--prefix-addresses					# Print complete address alongside disassembly
	--show-raw-insn					# Display hex alongside symbolic disassembly
	--no-show-raw-insn					# Don't display hex alongside symbolic disassembly
	--special-syms					# Include special symbols in symbol dumps
	--dwarf-check					# Make additional dwarf internal consistency checks
	...args
]