# Run only single command (SQL or internal) and exit
extern "psql" [
	--command(-c)					# Run only single command (SQL or internal) and exit
	--list(-l)					# List available databases, then exit
	--no-psqlrc(-X)					# Do not read startup file (~/.psqlrc)
	--single-transaction(-1)					# Execute command file as a single transaction
	--help(-?)					# Show this help, then exit
	--version					# Output version information, then exit
	--echo-all(-a)					# Echo all input from script
	--echo-errors(-b)					# Echo failed commands
	--echo-queries(-e)					# Echo commands sent to server
	--echo-hidden(-E)					# Display queries that internal commands generate
	--no-readline(-n)					# Disable enhanced command line editing (readline)
	--quiet(-q)					# Run quietly (no messages, only query output)
	--single-step(-s)					# Single-step mode (confirm each query)
	--single-line(-S)					# Single-line mode (end of line terminates SQL command)
	--no-align(-A)					# Unaligned table output mode
	--html(-H)					# HTML table output mode
	--pset(-P)					# Set printing option VAR to ARG (see \pset command)
	--tuples-only(-t)					# Print rows only
	--table-attr(-T)					# Set HTML table tag attributes (e.g., width, border)
	--expanded(-x)					# Turn on expanded table output
	--record-separator-zero(-0)					# Set record separator for unaligned output to zero byte
	--no-password(-w)					# Never prompt for password
	--password(-W)					# Force password prompt (should happen automatically)
	...args
]

# Show this help, then exit
extern "psql options commands variables" [
	--command(-c)					# Run only single command (SQL or internal) and exit
	--list(-l)					# List available databases, then exit
	--no-psqlrc(-X)					# Do not read startup file (~/.psqlrc)
	--single-transaction(-1)					# Execute command file as a single transaction
	--help(-?)					# Show this help, then exit
	--version					# Output version information, then exit
	--echo-all(-a)					# Echo all input from script
	--echo-errors(-b)					# Echo failed commands
	--echo-queries(-e)					# Echo commands sent to server
	--echo-hidden(-E)					# Display queries that internal commands generate
	--no-readline(-n)					# Disable enhanced command line editing (readline)
	--quiet(-q)					# Run quietly (no messages, only query output)
	--single-step(-s)					# Single-step mode (confirm each query)
	--single-line(-S)					# Single-line mode (end of line terminates SQL command)
	--no-align(-A)					# Unaligned table output mode
	--html(-H)					# HTML table output mode
	--pset(-P)					# Set printing option VAR to ARG (see \pset command)
	--tuples-only(-t)					# Print rows only
	--table-attr(-T)					# Set HTML table tag attributes (e.g., width, border)
	--expanded(-x)					# Turn on expanded table output
	--record-separator-zero(-0)					# Set record separator for unaligned output to zero byte
	--no-password(-w)					# Never prompt for password
	--password(-W)					# Force password prompt (should happen automatically)
	...args
]