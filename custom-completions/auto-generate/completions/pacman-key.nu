# Add or update keys from <file>
extern "pacman-key" [
	--add(-a)					# Add or update keys from <file>
	--config					# Use an alternate config <file>
	--delete(-d)					# Remove the <keys> from the keyring
	--export(-e)					# Export <keys> to stdout
	--edit-key					# Present a menu on specified <keys>
	--finger(-f)					# List a fingerprint for each specified <key>
	--gpgdir					# Alternate home <dir> for GnuPG
	--help(-h)					# Output syntax and command line options
	--import					# Imports keys from <dir>/pubring.gpg
	--import-trustdb					# Imports ownertrust values from <dir>/trustdb.gpg
	--init					# Initialize the keyring
	--keyserver					# Use the specified <keyserver>
	--list-keys(-l)					# Lists all or specified <keys> from the keyring
	--list-sigs					# Same as --list-keys, but with signatures
	--lsign-key					# Locally sign the given <key>
	--recv-keys(-r)					# Equivalent to --recv-keys in GnuPG
	--refresh-keys					# Equivalent to --refresh-keys in GnuPG
	--populate					# Reload the default keys
	--updatedb(-u)					# Equivalent to --check-trustdb in GnuPG
	--verify(-v)					# Verify the given <signature> file
	--version(-V)					# Displays the program version
	...args
]