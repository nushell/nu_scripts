# Format all input files like typing stubs regardless of file extension
extern "black" [
	--pyi					# Format all input files like typing stubs regardless of file extension
	--skip-string-normalization(-S)					# Don't normalize string quotes or prefixes
	--skip-magic-trailing-comma(-C)					# Don't use trailing commas as a reason to split lines
	--check					# Don't write the files back, just return the status
	--diff					# Don't write the files back, just output a diff for each file
	--color					# Show colored diff
	--no-color					# Do not color diff output
	--fast					# Skip temporary sanity checks
	--safe					# Do not skip temporary sanity checks
	--quiet(-q)					# Only print error messages to stderr
	--verbose(-v)					# Report files that were unchanged or ignored
	--version					# Show version
	--help(-h)					# Show help
	...args
]