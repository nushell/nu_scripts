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
export def copy [
  --ansi (-a)                 # Copy ansi formatting
  --nu-highlight (-h)         # nu-highlight (as ANSI) a Nushell commandline
  --prefix (-p): string = ''  # String to preface each line on clipboard
]: any -> nothing {
  let input = $in | collect
  let text = match ($input | describe -d | get type) {
    $type if $type in [ table, record, list ] => {
      $input | table -e
    }
    _ => {$input}
  }

  let do_strip_ansi = match $ansi {
    true  => {{||}}
    false => {{|| ansi strip }}
  }
  let do_highlight = match $nu_highlight {
    true  => {{|| run-external ($nu.current-exe) '-n' '--stdin' '-c' '$in | nu-highlight'}}
    false => {{||}}
  }
  let do_add_prefix = match $prefix {
    '' => {{||}}
    _  => {{|| str replace --all -r '(?m)^(.*)$' $'($prefix)$1'}}
  }

  let output = (
    $text
    | do $do_strip_ansi
    | do $do_highlight
    | do $do_add_prefix
    | encode base64
  )

	print -n $'(ansi osc)52;c;($output)(ansi st)'
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
