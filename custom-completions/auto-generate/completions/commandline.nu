# Display help and exit
extern "commandline" [
	--help(-h)					# Display help and exit
	--append(-a)					# Add text to the end of the selected area
	--insert(-i)					# Add text at cursor
	--insert-smart(-i)					# Add text at cursor but DWIM, stripping leading $
	--replace(-r)					# Replace selected part
	--current-job(-j)					# Select job under cursor
	--current-process(-p)					# Select process under cursor
	--current-selection(-s)					# Select current selection
	--current-token(-t)					# Select token under cursor
	--current-buffer(-b)					# Select entire command line (default)
	--cut-at-cursor(-c)					# Only return that part of the command line before the cursor
	--function(-f)					# Inject readline functions to reader
	--tokens-expanded(-x)					# Print a list of expanded tokens
	--tokens-raw					# Print a list of raw tokens
	--input(-I)					# Specify command to operate on
	--cursor(-C)					# Set/get cursor position, not buffer contents
	--selection-start(-B)					# Get current selection starting position
	--selection-end(-E)					# Get current selection ending position
	--line(-L)					# Print/set the line the cursor is on
	--column					# Print/set the column the cursor is on
	--search-mode(-S)					# Return true if performing a history search
	--paging-mode(-P)					# Return true if showing pager content
	--paging-full-mode					# Return true if pager is showing all content
	--search-field					# Operate on the pager search field
	--is-valid					# Return true if the command line is syntactically valid and complete
	--showing-suggestion					# Return true if the command line has an autosuggestion
	...args
]