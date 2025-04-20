# Don\'t
extern "winemaker" [
	--nobanner					# Don\'t
	--backup					# Use backup
	--nobackup					# Don\'t
	--nosource-fix					# Perform source fixing
	--lower-all					# Transform everything to lowercase
	--lower-uppercase					# Transform uppercase to lowercase
	--lower-none					# Don\'t
	--lower-include					# Transform uppercase to lowercase when no referenced file found
	--guiexe					# Treat unknown app as GUI app
	--windows					# Treat unknown app as GUI app
	--cuiexe					# Treat unknown app as console app
	--console					# Treat unknown app as console app
	--dll					# Treat unknown app as library
	--mfc					# Use MFC based targets
	--nomfc					# Use MFC based targets
	--interactive					# Use interactive mode
	--generated-files					# Generate Makefile
	--nogenerated-files					# Don\'t
	--wine32					# Use 32-bit target
	...args
]