# Starts all registered apps
extern "mix app.start" [

	...args
]

# Lists all archives
extern "mix archive" [
	--no-compile					# skip compilation
	...args
]

# Archives this project into a .ez file
extern "mix archive.build" [
	--no-compile					# skip compilation
	...args
]

# Installs an archive locally
extern "mix archive.install" [

	...args
]

# Uninstalls archives
extern "mix archive.uninstall" [

	...args
]

# Deletes generated application files
extern "mix clean" [
	--all					# Clean everything, including dependencies
	...args
]

# Executes the given command
extern "mix cmd" [

	...args
]

# Compiles source files
extern "mix compile" [

	...args
]

# Lists dependencies and their status
extern "mix deps" [

	...args
]

# Deletes the given dependencies' files
extern "mix deps.clean" [

	...args
]

# Compiles dependencies
extern "mix deps.compile" [

	...args
]

# Gets all out of date dependencies
extern "mix deps.get" [

	...args
]

# Unlocks the given dependencies
extern "mix deps.unlock" [

	...args
]

# Updates the given dependencies
extern "mix deps.update" [

	...args
]

# Executes the tasks separated by comma
extern "mix do" [

	...args
]

# Builds an escript for the project
extern "mix escript.build" [
	--force					# forces compilation regardless of modification times
	--no-compile					# skips compilation to .beam files
	...args
]

# Prints help information for tasks
extern "mix help" [

	...args
]

# Loads and persists the given configuration
extern "mix loadconfig" [

	...args
]

# Lists local tasks
extern "mix local" [

	...args
]

# Installs Hex locally
extern "mix local.hex" [

	...args
]

# Manages public keys
extern "mix local.public_keys" [

	...args
]

# Installs rebar locally
extern "mix local.rebar" [

	...args
]

# Creates a new Elixir project
extern "mix new" [
	--sup					# generate an OTP application skeleton with a supervision tree
	--umbrella					# can be given to generate an umbrella project
	--app					# can be given in order to name the OTP application
	--module					# can be given in order to name the modules in the generated code skeleton
	...args
]

# Profiles the given file or expression with fprof
extern "mix profile.fprof" [

	...args
]

# Runs the given file or expression
extern "mix run" [
	--config(-c)				# loads the given configuration file
	--eval(-e)					# evaluates the given code
	--require(-r)				# requires pattern before running the command
	--parallel-require			# requires pattern in parallel
	--pr						# requires pattern in parallel
	--no-compile				# does not compile even if files require compilation
	--no-deps-check				# does not check dependencies
	--no-halt					# does not halt the system after running the command
	--no-start					# does not start applications after compilation
	...args
]

# Runs a project's tests
extern "mix test" [
	--trace					# run tests with detailed reporting; automatically sets `--max-cases` to 1
	--max-cases					# set the maximum number of cases running async
	--cover					# the directory to include coverage results
	--force					# forces compilation regardless of modification times
	--no-compile					# do not compile, even if files require compilation
	--no-start					# do not start applications after compilation
	--no-color					# disable color in the output
	--color					# enable color in the output
	--include					# include tests that match the filter
	--exclude					# exclude tests that match the filter
	--only					# run only tests that match the filter
	--seed					# seeds the random number generator used to randomize test order
	--timeout					# set the timeout for the tests
	...args
]

# specify input directory
extern "mix" [

	...args
]