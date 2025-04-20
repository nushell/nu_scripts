# Run repl
extern "ros" [
	--load					# load lisp FILE while building
	--load					# load lisp FILE while building
	--source-registry					# override source registry of asdf systems
	--system					# load asdf SYSTEM while building
	--load-system					# same as above (buildapp compatibility)
	--package					# change current package to PACKAGE
	--system-package					#  combination of -s SP and -p SP
	--eval					# evaluate FORM while building
	--require					# require MODULE while building
	--quit					# quit lisp here
	--restart					# restart from build by calling (FUNC)
	--entry					# restart from build by calling (FUNC argv)
	--init					# evaluate FORM after restart
	--print					# evaluate and princ FORM after restart
	--write					# evaluate and write FORM after restart
	--final					# evaluate FORM before dumping IMAGE
	--no-rc					# skip /etc/rosrc, ~/.roswell/init.lisp
	--asdf					# use new asdf
	--noquicklisp					# do not use quicklisp
	--verbose					# be quite noisy while building
	--quiet					# be quite quiet while building (default)
	--test					# for test purpose
	...args
]

# skip /etc/rosrc, ~/.roswell/init.lisp
extern "ros +R" [
	--load					# load lisp FILE while building
	--load					# load lisp FILE while building
	--source-registry					# override source registry of asdf systems
	--system					# load asdf SYSTEM while building
	--load-system					# same as above (buildapp compatibility)
	--package					# change current package to PACKAGE
	--system-package					#  combination of -s SP and -p SP
	--eval					# evaluate FORM while building
	--require					# require MODULE while building
	--quit					# quit lisp here
	--restart					# restart from build by calling (FUNC)
	--entry					# restart from build by calling (FUNC argv)
	--init					# evaluate FORM after restart
	--print					# evaluate and princ FORM after restart
	--write					# evaluate and write FORM after restart
	--final					# evaluate FORM before dumping IMAGE
	--no-rc					# skip /etc/rosrc, ~/.roswell/init.lisp
	--asdf					# use new asdf
	--noquicklisp					# do not use quicklisp
	--verbose					# be quite noisy while building
	--quiet					# be quite quiet while building (default)
	--test					# for test purpose
	...args
]

# do not use quicklisp
extern "ros +Q" [
	--load					# load lisp FILE while building
	--load					# load lisp FILE while building
	--source-registry					# override source registry of asdf systems
	--system					# load asdf SYSTEM while building
	--load-system					# same as above (buildapp compatibility)
	--package					# change current package to PACKAGE
	--system-package					#  combination of -s SP and -p SP
	--eval					# evaluate FORM while building
	--require					# require MODULE while building
	--quit					# quit lisp here
	--restart					# restart from build by calling (FUNC)
	--entry					# restart from build by calling (FUNC argv)
	--init					# evaluate FORM after restart
	--print					# evaluate and princ FORM after restart
	--write					# evaluate and write FORM after restart
	--final					# evaluate FORM before dumping IMAGE
	--no-rc					# skip /etc/rosrc, ~/.roswell/init.lisp
	--asdf					# use new asdf
	--noquicklisp					# do not use quicklisp
	--verbose					# be quite noisy while building
	--quiet					# be quite quiet while building (default)
	--test					# for test purpose
	...args
]