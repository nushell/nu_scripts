# Print DOS/short form (C:PROGRA~1)
extern "cygpath" [
	--dos(-d)					# Print DOS/short form (C:PROGRA~1)
	--mixed(-m)					# Print Windows form with regular slashes (C:/WINNT)
	--mode(-M)					# Report on mode of file
	--unix(-u)					# Print Unix form (/cygdrive/c/winnt)
	--windows(-w)					# Print Windows form (C:\\WINNT)
	--type(-t)					# Print TYPE form
	--absolute(-a)					# Output absolute path
	--long-name(-l)					# Print Windows long form
	--path(-p)					# NAME is a colon-separated list
	--proc-cygdrive(-U)					# Emit /proc/cygdrive instead of /cygdrive prefix
	--short-name(-s)					# Print DOS/short form
	--allusers(-A)					# Use "All Users" instead of current user
	--desktop(-D)					# Output "Desktop" directory
	--homeroot(-H)					# Output "Profiles" directory
	--mydocs(-O)					# Output "My Documents" directory
	--smprograms(-P)					# Output Start Menu "Programs" directory
	--sysdir(-S)					# Output system directory
	--windir(-W)					# Output "Windows" directory
	--option(-o)					# Read options from FILE as well
	--ignore(-i)					# Ignore missing argument
	--help(-h)					# Output usage information
	--version(-V)					# Output version information
	...args
]

# Print TYPE form
extern "cygpath dos mixed unix windows" [
	--dos(-d)					# Print DOS/short form (C:PROGRA~1)
	--mixed(-m)					# Print Windows form with regular slashes (C:/WINNT)
	--mode(-M)					# Report on mode of file
	--unix(-u)					# Print Unix form (/cygdrive/c/winnt)
	--windows(-w)					# Print Windows form (C:\\WINNT)
	--type(-t)					# Print TYPE form
	--absolute(-a)					# Output absolute path
	--long-name(-l)					# Print Windows long form
	--path(-p)					# NAME is a colon-separated list
	--proc-cygdrive(-U)					# Emit /proc/cygdrive instead of /cygdrive prefix
	--short-name(-s)					# Print DOS/short form
	--allusers(-A)					# Use "All Users" instead of current user
	--desktop(-D)					# Output "Desktop" directory
	--homeroot(-H)					# Output "Profiles" directory
	--mydocs(-O)					# Output "My Documents" directory
	--smprograms(-P)					# Output Start Menu "Programs" directory
	--sysdir(-S)					# Output system directory
	--windir(-W)					# Output "Windows" directory
	--option(-o)					# Read options from FILE as well
	--ignore(-i)					# Ignore missing argument
	--help(-h)					# Output usage information
	--version(-V)					# Output version information
	...args
]