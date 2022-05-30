# Modify the treatment of string after /c or /k
extern "cmd /s" [

	...args
]

# Turn the echo off
extern "cmd /q" [

	...args
]

# Disable execution of AutoRun commands
extern "cmd /d" [

	...args
]

# Set the background and foreground color
extern "cmd /t" [

	...args
]

# Manage command extensions
extern "cmd /e" [

	...args
]

# Manage file and directory name completion
extern "cmd /f" [

	...args
]

# Manage delayed environment variable expansion
extern "cmd /v" [

	...args
]

# Show help
extern "cmd /?" [

	...args
]