# Verbose mode
extern "pg_dump" [
	--verbose(-v)					# Verbose mode
	--version(-V)					# Output version information
	--no-sync					# Do not wait for changes to be written safely to disk
	--help(-?)					# Show this help
	--data-only(-a)					# Dump only the data, not the schema
	--blobs(-b)					# Include large objects in dump
	--no-blobs(-B)					# Exclude large objects in dump
	--clean(-c)					# Clean (drop) database objects before recreating
	--create(-C)					# Include commands to create database in dump
	--oids(-o)					# Include OIDs in dump
	--no-owner(-O)					# Skip restoration of object ownership in plain-text format
	--schema-only(-s)					# Dump only the schema, no data
	--no-privileges(-x)					# Do not dump privileges (grant/revoke)
	--binary-upgrade					# For use by upgrade utilities only
	--column-inserts					# Dump data as INSERT commands with column names
	--disable-dollar-quoting					# Disable dollar quoting, use SQL standard quoting
	--disable-triggers					# Disable triggers during data-only restore
	--enable-row-security					# Enable row security (dump only content user has access to)
	--if-exists					# Use IF EXISTS when dropping objects
	--inserts					# Dump data as INSERT commands, rather than COPY
	--load-via-partition-root					# Load partitions via the root table
	--no-comments					# Do not dump comments
	--no-publications					# Do not dump publications
	--no-security-labels					# Do not dump security label assignments
	--no-subscriptions					# Do not dump subscriptions
	--no-synchronized-snapshots					# Do not use synchronized snapshots in parallel jobs
	--no-tablespaces					# Do not dump tablespace assignments
	--no-unlogged-table-data					# Do not dump unlogged table data
	--quote-all-identifiers					# Quote all identifiers, even if not key words
	--serializable-deferrable					# Wait until the dump can run without anomalies
	--strict-names					# Require table/schema include patterns to match entities
	--use-set-session-authorization					# Use SET SESSION AUTHORIZATION instead of ALTER OWNER
	--no-password(-w)					# Never prompt for password
	--password(-W)					# Force password prompt (should happen automatically)
	...args
]