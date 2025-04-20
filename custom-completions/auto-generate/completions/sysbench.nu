# 
extern "sysbench run\t'Run the test'" [
	--init-rng					# Specifies if random numbers generator should be initialized from timer (default: off)
	--debug					# Print more debug info (default: off)
	--validate					# Perform validation of test results where possible (default: off)
	--help					# Print help on general syntax
	--version					# Show version of program
	--batch					# Dump current results periodically (default: off)
	--file-fsync-all					# Do fsync() after each write operation (default: no)
	--file-fsync-end					# Do fsync() at the end of the test (default: yes)
	--oltp-read-only					# Read-only mode. No UPDATE, DELETE or INSERT queries will be performed. (default: off)
	--mysql-socket					# Unix socket file to communicate with the MySQL server
	--mysql-create-options					# Additional options passed to CREATE TABLE.
	...args
]

# 
extern "sysbench" [
	--init-rng					# Specifies if random numbers generator should be initialized from timer (default: off)
	--debug					# Print more debug info (default: off)
	--validate					# Perform validation of test results where possible (default: off)
	--help					# Print help on general syntax
	--version					# Show version of program
	--batch					# Dump current results periodically (default: off)
	--file-fsync-all					# Do fsync() after each write operation (default: no)
	--file-fsync-end					# Do fsync() at the end of the test (default: yes)
	--oltp-read-only					# Read-only mode. No UPDATE, DELETE or INSERT queries will be performed. (default: off)
	--mysql-socket					# Unix socket file to communicate with the MySQL server
	--mysql-create-options					# Additional options passed to CREATE TABLE.
	...args
]

# Specifies if random numbers generator should be initialized from timer (default: off)
extern "sysbench on off" [
	--init-rng					# Specifies if random numbers generator should be initialized from timer (default: off)
	--debug					# Print more debug info (default: off)
	--validate					# Perform validation of test results where possible (default: off)
	--help					# Print help on general syntax
	--version					# Show version of program
	--batch					# Dump current results periodically (default: off)
	--file-fsync-all					# Do fsync() after each write operation (default: no)
	--file-fsync-end					# Do fsync() at the end of the test (default: yes)
	--oltp-read-only					# Read-only mode. No UPDATE, DELETE or INSERT queries will be performed. (default: off)
	--mysql-socket					# Unix socket file to communicate with the MySQL server
	--mysql-create-options					# Additional options passed to CREATE TABLE.
	...args
]

# Do fsync() after each write operation (default: no)
extern "sysbench yes no" [
	--init-rng					# Specifies if random numbers generator should be initialized from timer (default: off)
	--debug					# Print more debug info (default: off)
	--validate					# Perform validation of test results where possible (default: off)
	--help					# Print help on general syntax
	--version					# Show version of program
	--batch					# Dump current results periodically (default: off)
	--file-fsync-all					# Do fsync() after each write operation (default: no)
	--file-fsync-end					# Do fsync() at the end of the test (default: yes)
	--oltp-read-only					# Read-only mode. No UPDATE, DELETE or INSERT queries will be performed. (default: off)
	--mysql-socket					# Unix socket file to communicate with the MySQL server
	--mysql-create-options					# Additional options passed to CREATE TABLE.
	...args
]