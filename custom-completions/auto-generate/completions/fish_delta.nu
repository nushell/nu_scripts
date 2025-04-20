# Ignore completions
extern "fish_delta" [
	--no-completions(-c)					# Ignore completions
	--no-functions(-f)					# Ignore function files
	--no-config(-C)					# Ignore config files
	--no-diff(-d)					# Don\'t
	--new(-n)					# Include new files
	--vendor(-V)					# Choose how to count vendor files
	...args
]