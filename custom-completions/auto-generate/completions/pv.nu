# Turn progress bar on
extern "pv" [
	--progress(-p)					# Turn progress bar on
	--timer(-t)					# Show timer
	--eta(-e)					# Show estimated time left
	--fineta(-I)					# Show estimated time of arrival
	--rate(-r)					# Show rate counter
	--average-rate(-a)					# Show average rate
	--bytes(-b)					# Show total byte counter
	--buffer-percent(-T)					# Show transfer buffer percentage
	--last-written(-A)					# Show the last NUM bytes written
	--numeric(-n)					# Numeric output
	--quiet(-q)					# No output
	--wait(-W)					# Wait for first byte before showing progress
	--line-mode(-l)					# Count lines instead of bytes
	--null(-0)					# Count null-terminated lines
	--force(-f)					# Force output
	--cursor(-c)					# Use cursor positioning escape sequence instead of \r
	--no-splice(-C)					# Dont use slice
	--skip-errors(-E)					# Ignore read errors
	--stop-at-size(-S)					# Stop transfer after given number of bytes
	--help(-h)					# Show help and exit
	--version(-V)					# Show version and exit
	...args
]