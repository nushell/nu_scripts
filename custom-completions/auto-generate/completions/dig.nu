# Use IPv4 query transport only
extern "dig" [

	...args
]

# TCP mode
extern "dig +vc +novc" [

	...args
]

# TCP mode, alternate syntax
extern "dig +tcp +notcp" [

	...args
]

# Set whether to use searchlist
extern "dig +search +nosearch" [

	...args
]

# Search with intermediate results
extern "dig +showsearch +noshowsearch" [

	...args
]

# Deprecated, treated as a synonym for +[no]search
extern "dig +defname +nodefname" [

	...args
]

# Recursive mode
extern "dig +recurse +norecurse" [

	...args
]

# Dont revert to TCP for TC responses.
extern "dig +ignore +noignore" [

	...args
]

# Dont try next server on SERVFAIL
extern "dig +fail +nofail" [

	...args
]

# Try to parse even illegal messages
extern "dig +besteffort +nobesteffort" [

	...args
]

# Set AA flag in query (+[no]aaflag)
extern "dig +aaonly +noaaonly" [

	...args
]

# Set AD flag in query
extern "dig +adflag +noadflag" [

	...args
]

# Set CD flag in query
extern "dig +cdflag +nocdflag" [

	...args
]

# Control display of class in records
extern "dig +cl +nocl" [

	...args
]

# Control display of command line
extern "dig +cmd +nocmd" [

	...args
]

# Control display of comment lines
extern "dig +comments +nocomments" [

	...args
]

# Control display of question
extern "dig +question +noquestion" [

	...args
]

# Control display of answer
extern "dig +answer +noanswer" [

	...args
]

# Control display of authority
extern "dig +authority +noauthority" [

	...args
]

# Control display of additional
extern "dig +additional +noadditional" [

	...args
]

# Control display of statistics
extern "dig +stats +nostats" [

	...args
]

# Disable everything except short form of answer
extern "dig +short +noshort" [

	...args
]

# Control display of ttls in records
extern "dig +ttlid +nottlid" [

	...args
]

# Set or clear all display flags
extern "dig +all +noall" [

	...args
]

# Print question before sending
extern "dig +qr +noqr" [

	...args
]

# Search all authoritative nameservers
extern "dig +nssearch +nonssearch" [

	...args
]

# ID responders in short answers
extern "dig +identify +noidentify" [

	...args
]

# Trace delegation down from root
extern "dig +trace +notrace" [

	...args
]

# Request DNSSEC records
extern "dig +dnssec +nodnssec" [

	...args
]

# Request Name Server ID
extern "dig +nsid +nonsid" [

	...args
]

# Print records in an expanded format
extern "dig +multiline +nomultiline" [

	...args
]

# AXFR prints only one soa record
extern "dig +onesoa +noonesoa" [

	...args
]

# Set number of UDP attempts
extern "dig +tries=" [

	...args
]

# Set number of UDP retries
extern "dig +retry=" [

	...args
]

# Set query timeout
extern "dig +time=" [

	...args
]

# Set EDNS0 Max UDP packet size
extern "dig +bufsize=" [

	...args
]

# Set NDOTS value
extern "dig +ndots=" [

	...args
]

# Set EDNS version
extern "dig +edns=" [

	...args
]