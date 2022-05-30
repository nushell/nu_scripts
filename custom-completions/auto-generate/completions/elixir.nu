# Prints version and exit
extern "elixir" [
	--app					# Start the given app and its dependencies
	--erl					# Switches to be passed down to erlang
	--name					# Makes and assigns a name to the distributed node
	--sname					# Makes and assigns a short name to the distributed node
	--cookie					# Sets a cookie for this distributed node
	--hidden					# Makes a hidden node
	--detached					# Starts the Erlang VM detached from console
	--no-halt					# Does not halt the Erlang VM after execution
	...args
]