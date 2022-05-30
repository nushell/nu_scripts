# Display help and exit
extern "jobs" [
	--help(-h)					# Display help and exit
	--pid(-p)					# Show the process id of each process in the job
	--group(-g)					# Show group id of job
	--command(-c)					# Show commandname of each job
	--last(-l)					# Only show status for last job to be started
	--query(-q)					# Check if a job exists without output
	...args
]