# Display help and exit
extern "apt-listbugs" [
	--help(-h)					# Display help and exit
	--severity(-s)					# Set severity
	--tag(-T)					# Tags you want to see
	--stats(-S)					# Bug-status you want to see
	--showless(-l)					# Ignore bugs in your system
	--showgreater(-g)					# Ignore newer bugs than upgrade packages
	--show-downgrade(-D)					# Bugs for downgrade packages
	--hostname(-H)					# Bug Tracking system
	--port(-p)					# Specify port for web interface
	--release-critical(-R)					# Use daily bug report
	--index(-I)					# Use the raw index.db
	--indexdir(-X)					# Specify index dir
	--pin-priority(-P)					# Specify Pin-Priority value
	--title					# Specify the title of rss
	--force-download(-f)					# Retrieve fresh bugs
	--quiet(-q)					# Do not display progress bar
	--cache-dir(-c)					# Specify local cache dir
	--timer(-t)					# Specify the expire cache timer
	--aptconf(-C)					# Specify apt config file
	--force-yes(-y)					# Assume yes to all questions
	--force-no(-n)					# Assume no to all questions
	...args
]

# Set severity
extern "apt-listbugs critical grave" [
	--help(-h)					# Display help and exit
	--severity(-s)					# Set severity
	--tag(-T)					# Tags you want to see
	--stats(-S)					# Bug-status you want to see
	--showless(-l)					# Ignore bugs in your system
	--showgreater(-g)					# Ignore newer bugs than upgrade packages
	--show-downgrade(-D)					# Bugs for downgrade packages
	--hostname(-H)					# Bug Tracking system
	--port(-p)					# Specify port for web interface
	--release-critical(-R)					# Use daily bug report
	--index(-I)					# Use the raw index.db
	--indexdir(-X)					# Specify index dir
	--pin-priority(-P)					# Specify Pin-Priority value
	--title					# Specify the title of rss
	--force-download(-f)					# Retrieve fresh bugs
	--quiet(-q)					# Do not display progress bar
	--cache-dir(-c)					# Specify local cache dir
	--timer(-t)					# Specify the expire cache timer
	--aptconf(-C)					# Specify apt config file
	--force-yes(-y)					# Assume yes to all questions
	--force-no(-n)					# Assume no to all questions
	...args
]

# Bug-status you want to see
extern "apt-listbugs outstanding 'pending upload' resolved done open" [
	--help(-h)					# Display help and exit
	--severity(-s)					# Set severity
	--tag(-T)					# Tags you want to see
	--stats(-S)					# Bug-status you want to see
	--showless(-l)					# Ignore bugs in your system
	--showgreater(-g)					# Ignore newer bugs than upgrade packages
	--show-downgrade(-D)					# Bugs for downgrade packages
	--hostname(-H)					# Bug Tracking system
	--port(-p)					# Specify port for web interface
	--release-critical(-R)					# Use daily bug report
	--index(-I)					# Use the raw index.db
	--indexdir(-X)					# Specify index dir
	--pin-priority(-P)					# Specify Pin-Priority value
	--title					# Specify the title of rss
	--force-download(-f)					# Retrieve fresh bugs
	--quiet(-q)					# Do not display progress bar
	--cache-dir(-c)					# Specify local cache dir
	--timer(-t)					# Specify the expire cache timer
	--aptconf(-C)					# Specify apt config file
	--force-yes(-y)					# Assume yes to all questions
	--force-no(-n)					# Assume no to all questions
	...args
]

# Bug Tracking system
extern "apt-listbugs osdn.debian.or.jp" [
	--help(-h)					# Display help and exit
	--severity(-s)					# Set severity
	--tag(-T)					# Tags you want to see
	--stats(-S)					# Bug-status you want to see
	--showless(-l)					# Ignore bugs in your system
	--showgreater(-g)					# Ignore newer bugs than upgrade packages
	--show-downgrade(-D)					# Bugs for downgrade packages
	--hostname(-H)					# Bug Tracking system
	--port(-p)					# Specify port for web interface
	--release-critical(-R)					# Use daily bug report
	--index(-I)					# Use the raw index.db
	--indexdir(-X)					# Specify index dir
	--pin-priority(-P)					# Specify Pin-Priority value
	--title					# Specify the title of rss
	--force-download(-f)					# Retrieve fresh bugs
	--quiet(-q)					# Do not display progress bar
	--cache-dir(-c)					# Specify local cache dir
	--timer(-t)					# Specify the expire cache timer
	--aptconf(-C)					# Specify apt config file
	--force-yes(-y)					# Assume yes to all questions
	--force-no(-n)					# Assume no to all questions
	...args
]

# Specify local cache dir
extern "apt-listbugs /var/cache/apt-listbugs/" [
	--help(-h)					# Display help and exit
	--severity(-s)					# Set severity
	--tag(-T)					# Tags you want to see
	--stats(-S)					# Bug-status you want to see
	--showless(-l)					# Ignore bugs in your system
	--showgreater(-g)					# Ignore newer bugs than upgrade packages
	--show-downgrade(-D)					# Bugs for downgrade packages
	--hostname(-H)					# Bug Tracking system
	--port(-p)					# Specify port for web interface
	--release-critical(-R)					# Use daily bug report
	--index(-I)					# Use the raw index.db
	--indexdir(-X)					# Specify index dir
	--pin-priority(-P)					# Specify Pin-Priority value
	--title					# Specify the title of rss
	--force-download(-f)					# Retrieve fresh bugs
	--quiet(-q)					# Do not display progress bar
	--cache-dir(-c)					# Specify local cache dir
	--timer(-t)					# Specify the expire cache timer
	--aptconf(-C)					# Specify apt config file
	--force-yes(-y)					# Assume yes to all questions
	--force-no(-n)					# Assume no to all questions
	...args
]

# List bugs from packages
extern "apt-listbugs list" [
	--help(-h)					# Display help and exit
	--severity(-s)					# Set severity
	--tag(-T)					# Tags you want to see
	--stats(-S)					# Bug-status you want to see
	--showless(-l)					# Ignore bugs in your system
	--showgreater(-g)					# Ignore newer bugs than upgrade packages
	--show-downgrade(-D)					# Bugs for downgrade packages
	--hostname(-H)					# Bug Tracking system
	--port(-p)					# Specify port for web interface
	--release-critical(-R)					# Use daily bug report
	--index(-I)					# Use the raw index.db
	--indexdir(-X)					# Specify index dir
	--pin-priority(-P)					# Specify Pin-Priority value
	--title					# Specify the title of rss
	--force-download(-f)					# Retrieve fresh bugs
	--quiet(-q)					# Do not display progress bar
	--cache-dir(-c)					# Specify local cache dir
	--timer(-t)					# Specify the expire cache timer
	--aptconf(-C)					# Specify apt config file
	--force-yes(-y)					# Assume yes to all questions
	--force-no(-n)					# Assume no to all questions
	...args
]

# List bugs in rss format
extern "apt-listbugs rss" [
	--help(-h)					# Display help and exit
	--severity(-s)					# Set severity
	--tag(-T)					# Tags you want to see
	--stats(-S)					# Bug-status you want to see
	--showless(-l)					# Ignore bugs in your system
	--showgreater(-g)					# Ignore newer bugs than upgrade packages
	--show-downgrade(-D)					# Bugs for downgrade packages
	--hostname(-H)					# Bug Tracking system
	--port(-p)					# Specify port for web interface
	--release-critical(-R)					# Use daily bug report
	--index(-I)					# Use the raw index.db
	--indexdir(-X)					# Specify index dir
	--pin-priority(-P)					# Specify Pin-Priority value
	--title					# Specify the title of rss
	--force-download(-f)					# Retrieve fresh bugs
	--quiet(-q)					# Do not display progress bar
	--cache-dir(-c)					# Specify local cache dir
	--timer(-t)					# Specify the expire cache timer
	--aptconf(-C)					# Specify apt config file
	--force-yes(-y)					# Assume yes to all questions
	--force-no(-n)					# Assume no to all questions
	...args
]