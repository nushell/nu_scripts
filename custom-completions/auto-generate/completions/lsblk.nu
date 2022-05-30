# print all devices
extern "lsblk" [
	--all(-a)					# print all devices
	--bytes(-b)					# print SIZE in bytes rather than in human readable format
	--nodeps(-d)					# don't print slaves or holders
	--discard(-D)					# print discard capabilities
	--exclude(-e)					# exclude devices by major number (default: RAM disks)
	--fs(-f)					# output info about filesystems
	--help(-h)					# usage information (this)
	--ascii(-i)					# use ascii characters only
	--perms(-m)					# output info about permissions
	--noheadings(-n)					# don't print headings
	--output(-o)					# output columns
	--pairs(-P)					# use key='value' output format
	--raw(-r)					# use raw output format
	--topology(-t)					# output info about topology
	--list(-l)					# use list format output
	...args
]