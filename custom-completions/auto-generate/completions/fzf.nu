# no-extended
extern "fzf" [
	--no-extended					# no-extended
	--exact(-e)					# Enable exact-match
	--literal					# Do not normalize latin script letters for matching
	--no-sort					# Do not sort the result
	--tac					# Reverse the order of the input
	--disabled					# Do not perform search
	--multi(-m)					# Enable multi-select with tab/shift-tab
	--no-multi					# Disable multi-select
	--no-mouse					# Disable mouse
	--cycle					# Enable cyclic scroll
	--keep-right					# Keep the right end of the line visible on overflow
	--no-hscroll					# Disable horizontal scroll
	--filepath-word					# Make word-wise movements respect path separators
	--reverse					# A synonym for --layout=reverse
	--no-unicode					# Draw border with ASCII characters
	--margin					# Expression for margins around the finder
	--inline-info					# Display finder info inline with the query
	--ansi					# Enable processing of ANSI color codes
	--no-bold					# Do not use bold text
	--black					# Use black background
	--select-1(-1)					# Automatically select the only match
	--exit-0(-0)					# Exit immediately when there\'s
	--print-query					# Print query as the first line
	--read0					# Read input delimited by ASCII NUL characters
	--print0					# Print output delimited by ASCII NUL characters
	--no-clear					# Do not clear finder interface on exit
	--sync					# Synchronous search for multi-staged filtering
	--version					# Display version information and exit
	...args
]

# no-extended
extern "fzf +x" [
	--no-extended					# no-extended
	--exact(-e)					# Enable exact-match
	--literal					# Do not normalize latin script letters for matching
	--no-sort					# Do not sort the result
	--tac					# Reverse the order of the input
	--disabled					# Do not perform search
	--multi(-m)					# Enable multi-select with tab/shift-tab
	--no-multi					# Disable multi-select
	--no-mouse					# Disable mouse
	--cycle					# Enable cyclic scroll
	--keep-right					# Keep the right end of the line visible on overflow
	--no-hscroll					# Disable horizontal scroll
	--filepath-word					# Make word-wise movements respect path separators
	--reverse					# A synonym for --layout=reverse
	--no-unicode					# Draw border with ASCII characters
	--margin					# Expression for margins around the finder
	--inline-info					# Display finder info inline with the query
	--ansi					# Enable processing of ANSI color codes
	--no-bold					# Do not use bold text
	--black					# Use black background
	--select-1(-1)					# Automatically select the only match
	--exit-0(-0)					# Exit immediately when there\'s
	--print-query					# Print query as the first line
	--read0					# Read input delimited by ASCII NUL characters
	--print0					# Print output delimited by ASCII NUL characters
	--no-clear					# Do not clear finder interface on exit
	--sync					# Synchronous search for multi-staged filtering
	--version					# Display version information and exit
	...args
]

# case-sensitive match
extern "fzf +i" [
	--no-extended					# no-extended
	--exact(-e)					# Enable exact-match
	--literal					# Do not normalize latin script letters for matching
	--no-sort					# Do not sort the result
	--tac					# Reverse the order of the input
	--disabled					# Do not perform search
	--multi(-m)					# Enable multi-select with tab/shift-tab
	--no-multi					# Disable multi-select
	--no-mouse					# Disable mouse
	--cycle					# Enable cyclic scroll
	--keep-right					# Keep the right end of the line visible on overflow
	--no-hscroll					# Disable horizontal scroll
	--filepath-word					# Make word-wise movements respect path separators
	--reverse					# A synonym for --layout=reverse
	--no-unicode					# Draw border with ASCII characters
	--margin					# Expression for margins around the finder
	--inline-info					# Display finder info inline with the query
	--ansi					# Enable processing of ANSI color codes
	--no-bold					# Do not use bold text
	--black					# Use black background
	--select-1(-1)					# Automatically select the only match
	--exit-0(-0)					# Exit immediately when there\'s
	--print-query					# Print query as the first line
	--read0					# Read input delimited by ASCII NUL characters
	--print0					# Print output delimited by ASCII NUL characters
	--no-clear					# Do not clear finder interface on exit
	--sync					# Synchronous search for multi-staged filtering
	--version					# Display version information and exit
	...args
]

# Do not sort the result
extern "fzf +s" [
	--no-extended					# no-extended
	--exact(-e)					# Enable exact-match
	--literal					# Do not normalize latin script letters for matching
	--no-sort					# Do not sort the result
	--tac					# Reverse the order of the input
	--disabled					# Do not perform search
	--multi(-m)					# Enable multi-select with tab/shift-tab
	--no-multi					# Disable multi-select
	--no-mouse					# Disable mouse
	--cycle					# Enable cyclic scroll
	--keep-right					# Keep the right end of the line visible on overflow
	--no-hscroll					# Disable horizontal scroll
	--filepath-word					# Make word-wise movements respect path separators
	--reverse					# A synonym for --layout=reverse
	--no-unicode					# Draw border with ASCII characters
	--margin					# Expression for margins around the finder
	--inline-info					# Display finder info inline with the query
	--ansi					# Enable processing of ANSI color codes
	--no-bold					# Do not use bold text
	--black					# Use black background
	--select-1(-1)					# Automatically select the only match
	--exit-0(-0)					# Exit immediately when there\'s
	--print-query					# Print query as the first line
	--read0					# Read input delimited by ASCII NUL characters
	--print0					# Print output delimited by ASCII NUL characters
	--no-clear					# Do not clear finder interface on exit
	--sync					# Synchronous search for multi-staged filtering
	--version					# Display version information and exit
	...args
]

# Disable multi-select
extern "fzf +m" [
	--no-extended					# no-extended
	--exact(-e)					# Enable exact-match
	--literal					# Do not normalize latin script letters for matching
	--no-sort					# Do not sort the result
	--tac					# Reverse the order of the input
	--disabled					# Do not perform search
	--multi(-m)					# Enable multi-select with tab/shift-tab
	--no-multi					# Disable multi-select
	--no-mouse					# Disable mouse
	--cycle					# Enable cyclic scroll
	--keep-right					# Keep the right end of the line visible on overflow
	--no-hscroll					# Disable horizontal scroll
	--filepath-word					# Make word-wise movements respect path separators
	--reverse					# A synonym for --layout=reverse
	--no-unicode					# Draw border with ASCII characters
	--margin					# Expression for margins around the finder
	--inline-info					# Display finder info inline with the query
	--ansi					# Enable processing of ANSI color codes
	--no-bold					# Do not use bold text
	--black					# Use black background
	--select-1(-1)					# Automatically select the only match
	--exit-0(-0)					# Exit immediately when there\'s
	--print-query					# Print query as the first line
	--read0					# Read input delimited by ASCII NUL characters
	--print0					# Print output delimited by ASCII NUL characters
	--no-clear					# Do not clear finder interface on exit
	--sync					# Synchronous search for multi-staged filtering
	--version					# Display version information and exit
	...args
]