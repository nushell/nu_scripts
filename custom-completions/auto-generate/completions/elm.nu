# Open up an interactive programming session
extern "elm repl" [
	--no-colors					# Turn off the colors in REPL
	--interpreter					# Path to an alternative JS interpreter
	--port					# Compile code with a click
	--output					# Specify the name of resulting JS file
	--debug					# Turn on the time-travelling debugger
	--optimize					# Turn on optimizations to make code smaller and faster
	--docs					# Generate a JSON file of documentation for a package
	--help					# Show a more detailed description
	...args
]

# Turn off the colors in REPL
extern "elm" [
	--no-colors					# Turn off the colors in REPL
	--interpreter					# Path to an alternative JS interpreter
	--port					# Compile code with a click
	--output					# Specify the name of resulting JS file
	--debug					# Turn on the time-travelling debugger
	--optimize					# Turn on optimizations to make code smaller and faster
	--docs					# Generate a JSON file of documentation for a package
	--help					# Show a more detailed description
	...args
]

# Compile code with a click
extern "elm reactor" [
	--no-colors					# Turn off the colors in REPL
	--interpreter					# Path to an alternative JS interpreter
	--port					# Compile code with a click
	--output					# Specify the name of resulting JS file
	--debug					# Turn on the time-travelling debugger
	--optimize					# Turn on optimizations to make code smaller and faster
	--docs					# Generate a JSON file of documentation for a package
	--help					# Show a more detailed description
	...args
]

# Compiles Elm code in JS or HTML
extern "elm make" [
	--no-colors					# Turn off the colors in REPL
	--interpreter					# Path to an alternative JS interpreter
	--port					# Compile code with a click
	--output					# Specify the name of resulting JS file
	--debug					# Turn on the time-travelling debugger
	--optimize					# Turn on optimizations to make code smaller and faster
	--docs					# Generate a JSON file of documentation for a package
	--help					# Show a more detailed description
	...args
]

# Start an Elm project
extern "elm init" [
	--no-colors					# Turn off the colors in REPL
	--interpreter					# Path to an alternative JS interpreter
	--port					# Compile code with a click
	--output					# Specify the name of resulting JS file
	--debug					# Turn on the time-travelling debugger
	--optimize					# Turn on optimizations to make code smaller and faster
	--docs					# Generate a JSON file of documentation for a package
	--help					# Show a more detailed description
	...args
]

# Fetches packages from Elm repository
extern "elm install" [
	--no-colors					# Turn off the colors in REPL
	--interpreter					# Path to an alternative JS interpreter
	--port					# Compile code with a click
	--output					# Specify the name of resulting JS file
	--debug					# Turn on the time-travelling debugger
	--optimize					# Turn on optimizations to make code smaller and faster
	--docs					# Generate a JSON file of documentation for a package
	--help					# Show a more detailed description
	...args
]

# Figures out the next version number based on API changes
extern "elm bump" [
	--no-colors					# Turn off the colors in REPL
	--interpreter					# Path to an alternative JS interpreter
	--port					# Compile code with a click
	--output					# Specify the name of resulting JS file
	--debug					# Turn on the time-travelling debugger
	--optimize					# Turn on optimizations to make code smaller and faster
	--docs					# Generate a JSON file of documentation for a package
	--help					# Show a more detailed description
	...args
]

# See what changed in a package between different versions
extern "elm diff" [
	--no-colors					# Turn off the colors in REPL
	--interpreter					# Path to an alternative JS interpreter
	--port					# Compile code with a click
	--output					# Specify the name of resulting JS file
	--debug					# Turn on the time-travelling debugger
	--optimize					# Turn on optimizations to make code smaller and faster
	--docs					# Generate a JSON file of documentation for a package
	--help					# Show a more detailed description
	...args
]

# Publishes your package on package.elm-lang.org so anyone in the community can use it
extern "elm publish" [
	--no-colors					# Turn off the colors in REPL
	--interpreter					# Path to an alternative JS interpreter
	--port					# Compile code with a click
	--output					# Specify the name of resulting JS file
	--debug					# Turn on the time-travelling debugger
	--optimize					# Turn on optimizations to make code smaller and faster
	--docs					# Generate a JSON file of documentation for a package
	--help					# Show a more detailed description
	...args
]