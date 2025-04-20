# sets bootnum active
extern "efibootmgr" [
	--active(-a)					# sets bootnum active
	--inactive(-A)					# sets bootnum inactive
	--bootnum(-b)					# modify BootXXXX (hex)
	--delete-bootnum(-B)					# delete bootnum
	--create(-c)					# create new variable bootnum and add to bootorder
	--create-only(-C)					# create new variable bootnum and do not add to bootorder
	--remove-dups(-D)					# remove duplicate values from BootOrder
	--driver(-r)					# Operate on Driver variables, not Boot Variables.
	--edd(-e)					# force EDD 1.0 or 3.0 creation variables, or guess
	--gpt(-g)					# force disk with invalid PMBR to be treated as GPT
	--label(-L)					# Boot manager display label (Default: Linux)
	--mirror-below-4G(-m)					# t|f mirror memory below 4GB
	--mirror-above-4G(-M)					# X percentage memory to mirror above 4GB
	--bootnext(-n)					# set BootNext to XXXX (hex)
	--delete-bootnext(-N)					# delete BootNext
	--bootorder(-o)					# explicitly set BootOrder XXXX,YYYY,ZZZZ (hex)
	--delete-bootorder(-O)					# delete BootOrder
	--part(-p)					# partition containing loader (Default: 1)
	--quiet(-q)					# be quiet
	--delete-timeout(-T)					# delete Timeout.
	--UCS-2(-u)					# handle extra args as Unicode(UCS-2)
	--verbose(-v)					# print additional information
	--version(-V)					# return version and exit
	--write-signature(-w)					# write unique sig to MBR if needed
	--sysprep(-y)					# Operate on SysPrep variables, not Boot Variables.
	--help(-h)					# show help/usage
	...args
]

# 
extern "" [
	---l
	...args
]