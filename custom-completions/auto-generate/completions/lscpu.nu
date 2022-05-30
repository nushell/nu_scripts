# Print both online and offline CPUs
extern "lscpu" [
	--all(-a)					# Print both online and offline CPUs
	--online(-b)					# Print online CPUs only
	--offline(-c)					# Print offline CPUs only
	--hex(-x)					# Print hexadecimal masks rather thans lists of CPUs
	--help(-h)					# Display help
	--version(-V)					# Display version
	...args
]