# use STYLE for numbering body lines
extern "nl" [
	--body-numbering(-b)					# use STYLE for numbering body lines
	--footer-numbering(-f)					# use STYLE for numbering footer lines
	--header-numbering(-h)					# use STYLE for numbering header lines
	--number-format(-n)					# left justified, no leading zeroes
	--number-format(-n)					# right justified, no leading zeroes
	--number-format(-n)					# right justified, leading zeroes
	--no-renumber(-p)					# do not reset line numbers at logical pages
	--help					# display this help and exit
	--version					# output version information and exit
	...args
]