# Same as -b -d --login -p -r -t -T -u
extern "who" [
	--all(-a)					# Same as -b -d --login -p -r -t -T -u
	--boot(-b)					# Print time of last boot
	--dead(-d)					# Print dead processes
	--heading(-H)					# Print line of headings
	--idle(-i)					# Print idle time
	--login(-l)					# Print login process
	--lookup					# Canonicalize hostnames via DNS
	--process(-p)					# Print active processes spawned by init
	--count(-q)					# Print all login names and number of users logged on
	--runlevel(-r)					# Print current runlevel
	--short(-s)					# Print name, line, and time
	--time(-t)					# Print last system clock change
	--mesg(-T)					# Print users message status as +, - or ?
	--writable(-w)					# Print users message status as +, - or ?
	--message					# Print users message status as +, - or ?
	--users(-u)					# List users logged in
	--help					# Display help and exit
	--version					# Display version and exit
	...args
]