# Commands for interacting with the system clipboard
#
# > These commands require your terminal to support OSC 52
# > Terminal multiplexers such as screen, tmux, zellij etc may interfere with this command

# Copy input to system clipboard
#
# # Example
# ```nushell
# >_ "Hello" | clip copy
# ```
export def copy []: [string -> nothing] {
	print -n $'(ansi osc)52;c;($in | encode base64)(ansi st)'
}

# Paste contenst of system clipboard
#
# # Example
# ```nushell
# >_ clip paste
# "Hello"
# ```
export def paste []: [nothing -> string] {
	try {
		term query $'(ansi osc)52;c;?(ansi st)' -p $'(ansi osc)52;c;' -t (ansi st)
	} catch {
		error make -u {
			msg: "Terminal did not responds to OSC 52 paste request."
			help: $"Check if your terminal supports OSC 52."
		}
	}
	| decode
	| decode base64
	| decode
}
