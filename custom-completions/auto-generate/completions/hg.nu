# do not prompt, automatically pick the first choice for all prompts
extern "hg" [
	--noninteractive(-y)					# do not prompt, automatically pick the first choice for all prompts
	--quiet(-q)					# suppress output
	--verbose(-v)					# enable additional output
	--debug					# enable debugging output
	--debugger					# start debugger
	--traceback					# always print a traceback on exception
	--time					# time how long the command takes
	--profile					# print command execution profile
	--version					# output version information and exit
	--help(-h)					# display help and exit
	--hidden					# consider hidden changesets
	--subrepos(-S)					# recurse into subrepositories
	--dry-run(-n)					# do not perform actions, just print output
	--mq					# operate on patch repository
	--force(-f)					# set branch name even if it shadows an existing branch
	--clean(-C)					# reset branch name to parent branch name
	--mq					# operate on patch repository
	--edit(-e)					# invoke editor on commit messages
	--git(-g)					# use git extended diff format
	--currentuser(-U)					# add \"From:
	--user(-u)
	--currentdate(-D)					# add \"Date:
	--date(-d)
	--interactive(-i)					# interactively record a new patch
	--force(-f)					# force tag
	--local(-l)					# make the tag local
	--remove					# remove a tag
	--edit(-e)					# invoke editor on commit messages
	--mq					# operate on patch repository
	--mq					# operate on patch repository
	...args
]