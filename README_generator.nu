# Initial Message
print $"Nushell Scripts README Generator (ansi b)\(Made by @Dan-Gamin\)(ansi reset)\n"

# Ask user if it is
let is_in_dir = (input $"(ansi u)?(ansi reset) Are you in the same directory as this file? (ansi b)\(y/N\) »(ansi reset) " | str downcase)

if ($is_in_dir == 'y') {
	print $"(ansi -e '1A')(ansi g)√(ansi reset)"
} else if ($is_in_dir == 'n' || ($is_in_dir | empty?)) {
	print $"(ansi -e '1A')(ansi r)X(ansi reset)"
	print "\nIs it not recommended to run this script then. Exiting..."
	exit
} else {
	print $"(ansi -e '1A')(ansi r)X(ansi reset)"
	print "\nUnknown value. Exiting..."
	exit
}

print "\nGenerating File..."

let t = open './README_template.md'
let scripts = (glob '**/*.nu' # Get all files
	| par-each {|it| # Exclue auto-generated completions
		if (($it | path dirname | path split | last 2 | str collect ' ') != 'auto-generate completions') {
			$it
		}
	}
	| par-each {|it| # Exclude old files
		if (not (($it | path dirname | path split) | any? $it == 'before_v0.60')) {
			$it
		}
	})
let scripts_md = ($scripts 
	| par-each {|it| {
			Name: $"[($it | path basename)]\((build-string 'https://github.com/nushell/nu_scripts/blob/main/' ($it | path relative-to $env.PWD | str replace '\' '/' -a -s))\)", 
			Length: $'(open $it | size | get lines) lines',
			Dir: (if (($it | path dirname | path relative-to $env.PWD | str replace (char separator) '/' -a -s) | empty?) {
				"x"
			} else { ($it | path dirname | path relative-to $env.PWD | str replace (char separator) '/' -a -s) })
		}
	} | sort-by Name | to md)

$t 
	| str replace '{{scripts_list}}' $scripts_md -s # Add Script list
	| str replace '{{scriptcount}}' ($scripts | length | into string) -s -a # Add script count
	| prepend $'<!-- ⚠️ This README has been automatically generated on (date to-timezone UTC | date format "%Y-%m-%d %H:%M:%S UTC") ⚠️ -->' 
	| str collect "\n\n" 
	| save red.md