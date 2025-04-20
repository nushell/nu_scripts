# 
extern "heroku" [
	--ORG(-o)					# the org to list the apps for
	--all(-A)					# list all apps in the org. Not just joined apps
	--personal(-p)					# list apps in personal account when a default org is set
	--app(-a)
	--app(-a)
	--app(-a)
	--app(-a)
	--app(-a)
	--app(-a)
	--app(-a)
	--shell(-s)					# output config vars in shell format
	--NUM(-n)					# the number of lines to display
	--PS(-p)					# only display logs from the given process
	--SOURCE(-s)					# only display logs from the given source
	--tail(-t)					# continually stream logs
	--NUM(-n)					# number of releases to show, maximum 50
	--SIZE(-s)					# specify dyno size
	--tail(-t)					# stream logs for the dyno
	...args
]