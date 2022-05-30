# Dont use banner
extern "winemaker" [
	--nobanner					# Dont use banner
	--backup					# Use backup
	--nobackup					# Dont use backup
	--nosource-fix					# Perform source fixing
	--lower-all					# Transform everything to lowercase
	--lower-uppercase					# Transform uppercase to lowercase
	--lower-none					# Dont transform uppercase to lowercase
	--lower-include					# Transform uppercase to lowercase when no referenced file found
	--nolower-include					# Dont transform uppercase to lowercase when no referenced file found
	--guiexe					# Treat unknown app as GUI app
	--windows					# Treat unknown app as GUI app
	--cuiexe					# Treat unknown app as console app
	--console					# Treat unknown app as console app
	--dll					# Treat unknown app as library
	--nodlls					# Dont use stadard libraries
	--mfc					# Use MFC based targets
	--nomfc					# Use MFC based targets
	--nomsvcrt					# Dont use msvcrt compilation
	--interactive					# Use interactive mode
	--generated-files					# Generate Makefile
	--nogenerated-files					# Dont generate Makefile
	--wine32					# Use 32-bit target
	...args
]