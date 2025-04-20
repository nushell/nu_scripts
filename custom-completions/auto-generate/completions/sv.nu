# Report status for up, down, term, once, cont, and exit
extern "" [

	...args
]

# Check if the service is in it's requested state
extern " check" [

	...args
]

# Run term, cont, and  up, report status
extern " try-restart" [

	...args
]

# Run exit, report status or kill on timeout
extern " force-shutdown" [

	...args
]

# Run term, cont and up, report status
extern " force-restart" [

	...args
]

# Run term and  cont, report status
extern " force-reload" [

	...args
]

# Run down, report status or kill on timeout
extern " force-stop" [

	...args
]

# Run exit, report status
extern " shutdown" [

	...args
]

# Run term, cont, and  up, report status using ./check
extern " restart" [

	...args
]

# Run hup, report status
extern " reload" [

	...args
]

# Run down, report status
extern " stop" [

	...args
]

# Run up, report status
extern " start" [

	...args
]

# Alias for exit
extern " e" [

	...args
]

# Alias for kill
extern " k" [

	...args
]

# Alias for term
extern " t" [

	...args
]

# Alias for 2
extern " 2" [

	...args
]

# Alias for 1
extern " 1" [

	...args
]

# Alias for quit
extern " q" [

	...args
]

# Alias for interrupt
extern " i" [

	...args
]

# Alias for alarm
extern " a" [

	...args
]

# Alias for hup
extern " h" [

	...args
]

# Alias for cont
extern " c" [

	...args
]

# Alias for pause
extern " p" [

	...args
]

# Send TERM, and CONT, report status
extern " exit" [

	...args
]

# Send SIGKILL
extern " kill" [

	...args
]

# Send SIGTERM
extern " term" [

	...args
]

# Send SIGQUIT
extern " quit" [

	...args
]

# Send SIGINT
extern " interrupt" [

	...args
]

# Send SIGALRM
extern " alarm" [

	...args
]

# Send SIGHUP
extern " hup" [

	...args
]

# Send SIGCONT
extern " cont" [

	...args
]

# Send SIGSTOP
extern " pause" [

	...args
]

# Alias for once
extern " o" [

	...args
]

# Alias for down
extern " d" [

	...args
]

# Alias for up
extern " u" [

	...args
]

# Alias for status
extern " s" [

	...args
]

# Start service, but don't restart it
extern " once" [

	...args
]

# Send it the TERM signal
extern " down" [

	...args
]

# Start a service
extern " up" [

	...args
]

# Report the current status of the service
extern " status" [

	...args
]