# Verbose mode
extern "pg_dumpall" [
	--verbose(-v)					# Verbose mode
	--version(-V)					# Output version information
	--help(-?)					# Show this help
	--data-only(-a)					# Dump only the data, not the schema
	--clean(-c)					# Clean (drop) database objects before recreating
	--globals-only(-g)					# Dump only global objects, no databases
	--oids(-o)					# Include OIDs in dump
	--no-owner(-O)					# Skip restoration of object ownership
	--roles-only(-r)					# Dump only roles, no databases or tablespaces
	--schema-only(-s)					# Dump only the schema, no data
	--tablespaces-only(-t)					# Dump only tablespaces, no databases or roles
	--no-privileges(-x)					# Do not dump privileges (grant/revoke)
	--binary-upgrade					# For use by upgrade utilities only
	--column-inserts					# Dump data as INSERT commands with column names
	--disable-dollar-quoting					# Disable dollar quoting, use SQL standard quoting
	--disable-triggers					# Disable triggers during data-only restore
	--if-exists					# Use IF EXISTS when dropping objects
	--inserts					# Dump data as INSERT commands, rather than COPY
	--load-via-partition-root					# Load partitions via the root table
	--no-comments					# Do not dump comments
	--no-publications					# Do not dump publications
	--no-role-passwords					# Do not dump passwords for roles
	--no-security-labels					# Do not dump security label assignments
	--no-subscriptions					# Do not dump subscriptions
	--no-sync					# Do not wait for changes to be written safely to disk
	--no-tablespaces					# Do not dump tablespace assignments
	--no-unlogged-table-data					# Do not dump unlogged table data
	--quote-all-identifiers					# Quote all identifiers, even if not key words
	--use-set-session-authorization					# Use SET SESSION AUTHORIZATION instead of ALTER OWNER
	--no-password(-w)					# Never prompt for password
	--password(-W)					# Force password prompt (should happen automatically)
	...args
]