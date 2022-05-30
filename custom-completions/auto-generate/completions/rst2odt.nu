# Specify a stylesheet
extern "rst2odt" [
	--stylesheet					# Specify a stylesheet
	--odf-config-file					# Specify additional ODF options
	--cloak-email-addresses					# Enable obfuscate email addresses
	--no-cloak-email-addresses					# Disable obfuscate email addresses
	--table-border-thickness					# Specify the thickness of table borders
	--add-syntax-highlighting					# Enable syntax highlighting
	--no-syntax-highlighting					# Disable syntax highlighting
	--create-sections					# Create sections
	--no-sections					# Don't create sections
	--create-links					# Create links
	--no-links					# Don't create links
	--endnotes-end-doc					# Generate endnotes
	--no-endnotes-end-doc					# Generate footnotes
	--generate-list-toc					# Generate a bullet list TOC
	--generate-oowriter-toc					# Generate an ODF TOC
	--custom-odt-header					# Specify a custom header
	--custom-odt-footer					# Specify a custom footer
	...args
]