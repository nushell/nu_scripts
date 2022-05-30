# Short for: --action open
extern "cygstart" [
	--open(-o)					# Short for: --action open
	--explore(-x)					# Short for: --action explore
	--edit(-e)					# Short for: --action edit
	--find(-f)					# Short for: --action find
	--print(-p)					# Short for: --action print
	--hide					# Hide window and activates another window
	--maximize					# Maximize the specified window
	--minimize					# Minimize the specified window
	--restore					# Activate and display window
	--show					# Activate window and display in current size and position
	--showmaximized					# Activate and maximize window
	--showminimized					# Activate and minimize window
	--showminnoactive					# Display window minimized
	--showna					# Display window in current state
	--shownoactivate					# Display a window in most recent size and position
	--shownormal					# Activate and display a window
	--wait(-w)					# Wait until the application terminates before exiting
	--verbose(-v)					# Show the actual ShellExecute call made
	--help(-?)					# Show this help message
	--usage					# Display brief usage message
	--version					# Display version information
	--license					# Display licensing information
	--reference					# Open MSDN reference for ShellExecute
	...args
]