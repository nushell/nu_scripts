# show help message
extern "reuse" [
	--help(-h)					# show help message
	--debug					# enable debug logging
	--suppress-deprecation					# hide deprecation warnings
	--include-submodules					# do not ignore Git submodules
	--include-meson-subprojects					# do not ignore Meson subprojects
	--no-multiprocessing					# disable multiprocessing
	--version					# show version number
	--exclude-year					# do not include year in statement
	--merge-copyrights					# merge copyright lines if copyright statements are identical
	--single-line					# force single-line comment style
	--multi-line					# force multi-line comment style
	--recursive(-r)					# annotate all files recursively
	--no-replace					# do not replace the first header in the file
	--force-dot-license					# always write a .license file
	--fallback-dot-license					# write a .license file to files with unrecognised comment styles
	--skip-unrecognised					# skip files with unrecognised comment styles
	--skip-existing					# skip files that already contain REUSE information
	--all					# download all missing licenses
	--quiet(-q)					# prevents output
	--json(-j)					# formats output as JSON
	--plain(-p)					# formats output as plain text
	--add-license-concluded					# populate the LicenseConcluded field
	...args
]