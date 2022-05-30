# Prints out help for a specific command, or lists all commands
extern "makensis" [

	...args
]

# Specifies input charset
extern "makensis ACP OEM UTF8 UTF16LE UTF16BE" [

	...args
]

# Specifies output charset
extern "makensis ACP OEM UTF8 UTF8SIG UTF16LE UTF16BE UTF16LEBOM UTF16BEBOM" [

	...args
]