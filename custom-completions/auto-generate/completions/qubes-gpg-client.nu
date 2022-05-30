[# Make a detached signature
extern "qubes-gpg-client" [
	--detach-sign(-b)					# Make a detached signature
	--armor(-a)					# Create ASCII armored output
	--symmetric(-c)					# Encrypt with a symmetric cipher using a passphrase
	--decrypt					# Decrypt specified file or stdin
	--encrypt(-e)					# Encrypt data
	--list-keys(-k)					# List all keys from the public keyrings, or just the ones given on the command line
	--list-secret-keys(-K)					# List all keys from the secret keyrings, or just the ones given on the command line
	--dry-run(-n)					# Don't make any changes (this is not completely implemented)
	--quiet(-q)					# Quiet mode
	--sign(-s)					# Make a signature
	--textmode(-t)					# Treat input files as text and store them in the OpenPGP canonical text form with standard 'CRLF' line endings
	--verbose(-v)					# Give more information during processing
	--always-trust					# Skip key validation and assume that used keys are always valid
	--batch					# Batch mode
	--display-charset					# Set the native character set
	--clearsign					# Make a clear text signature
	--disable-mdc					# Disable the use of the modification detection code
	--emit-version					# Include the version string in ASCII armored output
	--fingerprint					# List all keys with their fingerprints
	--fixed-list-mode					# Do not merge primary user ID and primary key in --with-colons listing mode and print all timestamps as UNIX timestamps
	--force-mdc					# Force the use of encryption with a modification detection code
	--force-v3-sigs					# Force v3 signatures for signatures on data
	--force-v4-certs					# Always use v4 key signatures even on v3 keys
	--gnupg					# Use standard GnuPG behavior
	--list-options					# Display various internal configuration parameters of GnuPG
	--list-only					# Changes the behaviour of some commands. This is like --dry-run but different
	--list-sigs					# Same as --list-keys, but the signatures are listed too
	--no-comments					# Don't use a comment string
	--no-emit-version					# Don't include the version string in ASCII armored output
	--no-force-v3-sigs					# Do not force v3 signatures for signatures on data
	--no-force-v4-certs					# Don't use v4 key signatures on v3 keys
	--no-greeting					# Suppress the initial copyright message
	--no-secmem-warning					# Suppress the warning about 'using insecure memory'
	--no-tty					# Never write output to terminal
	--no-verbose					# Reset verbose level to 0
	--openpgp					# Reset all packet, cipher, and digest options to strict OpenPGP behavior
	--s2k-mode					# Selects how passphrases are mangled
	--store					# Store only (make a simple RFC1991 packet)
	--trust-model					# Specify trust model
	--use-agent					# Try to use the GnuPG-Agent
	--version					# Display version and supported algorithms, and exit
	--with-colons					# Print key listings delimited by colons
	--with-fingerprint					# Same as the command --fingerprint but changes only the format of the output and may be used together with another command
	--with-keygrip					# Include the keygrip in the key listings
	...args
]]

[# 
extern "qubes-gpg-client-wrapper" [

	...args
]]