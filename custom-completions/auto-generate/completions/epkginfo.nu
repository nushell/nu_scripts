# 
extern "epkginfo" [
	--help(-h)					# display help
	--description(-d)					# extended pkg description
	--herd(-H)					# herd(s) for the pkg
	--keywords(-k)					# keywords for all matching pkg versions
	--license(-l)					# licenses for the best matching version
	--maintainer(-m)					# maintainer(s) for the pkg
	--stablreq(-S)					# STABLEREQ arches (cc's) for all matching pkg versio
	--useflags(-u)					# per-pkg USE flag descriptions
	--upstream(-U)					# pkg's upstream information
	--xml(-x)					# plain metadata.xml file
	...args
]