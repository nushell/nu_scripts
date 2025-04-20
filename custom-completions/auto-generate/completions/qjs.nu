# list options
extern "qjs" [
	--help(-h)					# list options
	--interactive(-i)					# go to interactive mode
	--module(-m)					# load as ES6 module (default=autodetect)
	--script					# load as ES6 module (default=autodetect)
	--std					# make 'std' and 'os' available to the loaded script
	--bignum					# enable the bignum extensions (BigFloat, BigDecimal)
	--qjscalc					# load the QJSCalc runtime (default if invoked as qjscalc)
	--trace(-T)					# trace memory allocation
	--dump					# dump the memory usage stats
	--unhandled-rejection					# dump unhandled promise rejections
	--quit(-q)					# just instantiate the interpreter and quit
	...args
]