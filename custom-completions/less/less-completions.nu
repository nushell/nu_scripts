# Display help and exit
extern "less" [
	--help(-?)					# Display help and exit
	--search-skip-screen(-a)					# Search after end of screen
	--auto-buffers(-B)					# Disable automatic buffer allocation
	--clear-screen(-c)					# Repaint from top
	--CLEAR-SCREEN(-C)					# Clear and repaint from top
	--dumb(-d)					# Suppress error for lacking terminal capability
	--quit-at-eof(-e)					# Exit on second EOF
	--QUIT-AT-EOF(-E)					# Exit on EOF
	--force(-f)					# Open non-regular files
	--quit-if-one-screen(-F)					# Quit if file shorter than one screen
	--hilite-search(-g)					# Highlight one search target
	--HILITE-SEARCH(-G)					# No search highlighting
	--ignore-case(-i)					# Search ignores lowercase case
	--IGNORE-CASE(-I)					# Search ignores all case
	--status-column(-J)					# Display status column
	--no-lessopen(-L)					# Ignore $LESSOPEN
	--long-prompt(-m)					# Prompt with percentage
	--LONG-PROMPT(-M)					# Verbose prompt
	--line-numbers(-n)					# Display line number
	--LINE-NUMBERS(-N)					# Display line number for each line
	--quiet(-q)					# Silent mode
	--silent					# Silent mode
	--QUIET(-Q)					# Completely silent mode
	--SILENT					# Completely silent mode
	--raw-control-chars(-r)					# Display control chars
	--RAW-CONTROL-CHARS(-R)					# Display control chars, guess screen appearance
	--squeeze-blank-lines(-s)					# Multiple blank lines sqeezed
	--chop-long-lines(-S)					# Do not fold long lines
	--underline-special(-u)					# Allow backspace and carriage return
	--UNDERLINE-SPECIAL(-U)					# Allow backspace, tab and carriage return
	--version(-V)					# Display version and exit
	--hilite-unread(-w)					# Highlight first unread line on new page
	--HILITE-UNREAD(-W)					# Highlight first unread line on any movement
	--no-init(-X)					# No termcap init
	--no-keypad					# No keypad init
	--tilde(-~)					# Lines after EOF are blank
	--shift					# Characters to scroll on left/right arrows
	# this breaks the parser
	# --shift(-#)					# Characters to scroll on left/right arrows
	...args
]

# Characters to scroll on left/right arrows
extern "less 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19" [
	--help(-?)					# Display help and exit
	--search-skip-screen(-a)					# Search after end of screen
	--auto-buffers(-B)					# Disable automatic buffer allocation
	--clear-screen(-c)					# Repaint from top
	--CLEAR-SCREEN(-C)					# Clear and repaint from top
	--dumb(-d)					# Suppress error for lacking terminal capability
	--quit-at-eof(-e)					# Exit on second EOF
	--QUIT-AT-EOF(-E)					# Exit on EOF
	--force(-f)					# Open non-regular files
	--quit-if-one-screen(-F)					# Quit if file shorter than one screen
	--hilite-search(-g)					# Highlight one search target
	--HILITE-SEARCH(-G)					# No search highlighting
	--ignore-case(-i)					# Search ignores lowercase case
	--IGNORE-CASE(-I)					# Search ignores all case
	--status-column(-J)					# Display status column
	--no-lessopen(-L)					# Ignore $LESSOPEN
	--long-prompt(-m)					# Prompt with percentage
	--LONG-PROMPT(-M)					# Verbose prompt
	--line-numbers(-n)					# Display line number
	--LINE-NUMBERS(-N)					# Display line number for each line
	--quiet(-q)					# Silent mode
	--silent					# Silent mode
	--QUIET(-Q)					# Completely silent mode
	--SILENT					# Completely silent mode
	--raw-control-chars(-r)					# Display control chars
	--RAW-CONTROL-CHARS(-R)					# Display control chars, guess screen appearance
	--squeeze-blank-lines(-s)					# Multiple blank lines sqeezed
	--chop-long-lines(-S)					# Do not fold long lines
	--underline-special(-u)					# Allow backspace and carriage return
	--UNDERLINE-SPECIAL(-U)					# Allow backspace, tab and carriage return
	--version(-V)					# Display version and exit
	--hilite-unread(-w)					# Highlight first unread line on new page
	--HILITE-UNREAD(-W)					# Highlight first unread line on any movement
	--no-init(-X)					# No termcap init
	--no-keypad					# No keypad init
	--tilde(-~)					# Lines after EOF are blank
	# --shift(-#)					# Characters to scroll on left/right arrows
	...args
]