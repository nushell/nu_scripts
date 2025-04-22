# Output is terse
extern "nmcli" [
	--terse(-t)					# Output is terse
	--pretty(-p)					# Output is pretty
	--mode(-m)					# Switch between tabular and multiline mode
	--color(-c)					# Whether to use colors in output
	--fields(-f)					# Specify the output fields
	--escape(-e)					# Whether to escape ":" and "\\" characters
	--ask(-a)					# Ask for missing parameters
	--show-secrets(-s)					# Allow displaying passwords
	--active					# List only active profiles
	--order					# Custom connection ordering
	--temporary
	--temporary
	--temporary
	...args
]