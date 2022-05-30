# Use configuration file
extern "lightdm" [
	--config(-c)					# Use configuration file
	--debug(-d)					# Print debugging messages
	--test-mode					# Skip things requiring root access
	--pid-file					# File to write PID into
	--xsessions-dir					# Directory to load X sessions from
	--xgreeters-dir					# Directory to load X greeters from
	--log-dir					# Directory to write logs to
	--run-dir					# Directory to store running state
	--cache-dir					# Directory to cache information
	...args
]