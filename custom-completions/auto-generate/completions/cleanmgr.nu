# Specify the drive
extern "cleanmgr /d" [

	...args
]

# Run the specified tasks that are assigned to the n value
extern "cleanmgr /sagerun" [

	...args
]

# Run /sageset and /sagerun for the same n
extern "cleanmgr /tuneup" [

	...args
]

# Run with the default settings
extern "cleanmgr /lowdisk" [

	...args
]

# Run with the default settings, no user prompts
extern "cleanmgr /verylowdisk" [

	...args
]

# Show help
extern "cleanmgr /?" [

	...args
]