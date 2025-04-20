# Show a dialog with options
extern "ark" [
	--dialog(-d)					# Show a dialog with options
	--mimetypes(-m)					# List all supported MIME types
	--destination(-o)					# Specify an extraction directory
	--add(-c)					# Add files and directories to an archive interactively
	--add-to(-t)					# Add files and directories to an archive
	--changetofirstpath(-p)					# Use a first argument as input path
	--autofilename(-f)					# Specify suffix for automatically chosen filename
	--batch(-b)					# Use a batch interface
	--autodestination(-e)					# Use a first argument as output path
	--autosubfolder(-a)					# Create subfolder automatically for multiple archives
	--opendestination(-O)					# Open upon extraction completion
	...args
]