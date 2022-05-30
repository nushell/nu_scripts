# Prints version and exit
extern "iex" [
	--app					# Start the given app and its dependencies
	--erl					# Switches to be passed down to erlang
	--name					# Makes and assigns a name to the distributed node
	--sname					# Makes and assigns a short name to the distributed node
	--cookie					# Sets a cookie for this distributed node
	--hidden					# Makes a hidden node
	--detached					# Starts the Erlang VM detached from console
	--remsh					# Connects to a node using a remote shell
	--dot-iex					# Overrides default .iex file and uses path instead; path can be empty, then no file will be loaded
	...args
]