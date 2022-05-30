# Number sets BitsPerPixel value
extern "wesnoth" [
	--bpp					# Number sets BitsPerPixel value
	--compress					# <in> <out> compress a savefile from text to binary format
	--debug(-d)					# Shows extra debugging information
	--decompress					# <in> <out> decompress a savefile from binary to text format
	--fullscreen(-f)					# Runs the game in full screen mode
	--fps					# Shows frames per second
	--help(-h)					# Display a summary of command line options
	--load					# Loads the file savegame from the standard save game directory
	--log-info					# Set the severity level of debugging domains
	--multiplayer					# Runs a multiplayer game
	--nocache					# Disables caching of game data
	--nosound					# Runs the game without sounds and music
	--path					# Prints the name of the game data directory and exits
	--resolution(-r)					# XxY sets the screen resolution
	--test(-t)					# Runs the game in a small test scenario
	--version(-v)					# Shows the version number and exits
	--windowed(-w)					# Runs the game in windowed mode
	--no-delay					# Runs the game without any delays for graphic benchmarking
	--exit-at-end					# Exits once the scenario is over, without displaying dialog
	--algorithm					# Selects a non-standard algorithm to be used by the AI controller
	--controller					# Selects the controller for this side
	--era					# Use this option to play in the selected era
	--nogui					# Runs the game without the GUI
	--parm					# Sets additional parameters for this side
	--scenario					# Selects a multiplayer scenario
	--side					# Selects a faction of the current era for this side
	--turns					# Sets the number of turns for the chosen scenario
	...args
]