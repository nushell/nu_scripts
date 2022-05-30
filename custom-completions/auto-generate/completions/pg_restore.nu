# Print summarized TOC of the archive
extern "pg_restore" [
	--list(-l)					# Print summarized TOC of the archive
	--verbose(-v)					# Verbose mode
	--version(-V)					# Output version information
	--help(-?)					# Show help
	--data-only(-a)					# Restore only the data, no schema
	--clean(-c)					# Clean (drop) database objects before recreating
	--create(-C)					# Create the target database
	--exit-on-error(-e)					# Exit on error, default is to continue
	--no-owner(-O)					# Skip restoration of object ownership
	--schema-only(-s)					# Restore only the schema, no data
	--no-privileges(-x)					# Skip restoration of access privileges (grant/revoke)
	--single-transaction(-1)					# Restore as a single transaction
	--disable-triggers					# Disable triggers during data-only restore
	--enable-row-security					# Enable row security
	--if-exists					# Use IF EXISTS when dropping objects
	--no-comments					# Do not restore comments
	--no-data-for-failed-tables					# Don't restore data of tables that could not be created
	--no-publications					# Do not restore publications
	--no-security-labels					# Do not restore security labels
	--no-subscriptions					# Do not restore subscriptions
	--no-tablespaces					# Do not restore tablespace assignments
	--strict-names					# Require table/schema include patterns to match entities
	--use-set-session-authorization					# Use SET SESSION AUTHORIZATION instead of ALTER OWNER
	--no-password(-w)					# Never prompt for password
	--password(-W)					# Force password prompt (should happen automatically)
	...args
]