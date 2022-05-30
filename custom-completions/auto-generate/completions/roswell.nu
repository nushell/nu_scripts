# Run repl
extern "ros" [

	...args
]

# skip /etc/rosrc, ~/.roswell/init.lisp
extern "ros +R" [

	...args
]

# do not use quicklisp
extern "ros +Q" [

	...args
]