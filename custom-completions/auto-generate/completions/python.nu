# Dont write .py[co] files on import
extern "python" [

	...args
]

# Control validation behaviour of pyc files
extern "python default always never" [

	...args
]