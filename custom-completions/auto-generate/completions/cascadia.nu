# Show help
extern "cascadia" [
	--help(-h)					# Show help
	--in(-i)					# Specify the html/xml file to read from or stdin
	--out(-o)					# Specify the output file or stdout
	--css(-c)					# Specify the CSS selectors
	--text(-t)					# Specify the text output for none-block selection mode
	--Raw(-R)					# Use the raw text output
	--piece(-p)					# Specify CSS sub-selectors within --css to split that block up
	--delimiter(-d)					# Specify the delimiter for pieces csv output
	--wrap-html(-w)					# Wrap up the output with html tags
	--style(-y)					# Style component within the wrapped html head
	--base(-b)					# Specify the base href tag used in the wrapped up html
	--quiet(-q)					# Do not show any output
	...args
]