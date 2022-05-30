# Back up the original contents of each file
extern "patch" [
	--backup(-b)					# Back up the original contents of each file
	--backup-if-mismatch					# Back up files if patch doesn't match exactly
	--no-backup-if-mismatch					# Don't back up for mismatching patches
	--context(-c)					# Interpret patch as context diff
	--directory(-d)					# Change directory to DIR first
	--dry-run					# Don't change files; just print what would happen
	--ed(-e)					# Interpret patch as an 'ed' script
	--remove-empty-files(-E)					# Remove output files empty after patching
	--force(-f)					# Like -t, but ignore bad-Prereq patches, assume unreversed
	--help					# Display help
	--ignore-whitespace(-l)					# Ignore whitespace changes between patch & input
	--normal(-n)					# Interpret patch as normal diff
	--forward(-N)					# Ignore patches that seem reversed or already applied
	--posix					# Conform to the POSIX standard
	--reverse(-R)					# Assume patches were created with old/new files swapped
	--quiet(-s)					# Work silently unless an error occurs
	--batch(-t)					# Ask no questions; skip bad-Prereq patches; assume reversed
	--set-time(-T)					# Set times of patched files assuming diff uses local time
	--unified(-u)					# Interpret patch file as a unified diff
	--version(-v)					# Display version
	--verbose					# Output extra information about work being done
	--set-utc(-Z)					# Set times of patched files assuming diff uses UTC
	...args
]