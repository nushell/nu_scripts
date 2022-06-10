# Initial Message
print $"Nushell Scripts README Generator (ansi b)\(Made by @Dan-Gamin\)(ansi reset)\n"

# Ask user if it is in the same dir as this file
let is_in_dir = (input $"(ansi u)?(ansi reset) Are you in the same directory as this file? (ansi b)\(y/N\) »(ansi reset) " | str downcase)

if ($is_in_dir == 'y') {
	print $"(ansi -e '1A')(ansi g)√(ansi reset)" # Draw checkmark
} else if ($is_in_dir == 'n' || ($is_in_dir | empty?)) {
	print $"(ansi -e '1A')(ansi r)X(ansi reset)" # Draw X
	print "\nIs it not recommended to run this script then. Exiting..."
	exit
} else {
	print $"(ansi -e '1A')(ansi r)X(ansi reset)" # Draw X
	print "\nUnknown value. Exiting..."
	exit
}

# Ask user where to save the file
let file_loc = (input $"(ansi u)?(ansi reset) Where do you want to save the README? (ansi b)\(README.md) »(ansi reset) ")
let file_loc = if ($file_loc | empty?) { 'README.md' } else { $file_loc }

print "\nGenerating File..."

# Get a list of all the scripts
let scripts = (glob '**/*.nu' # Get all files
	| par-each {|it| # Exclude auto-generated completions
		if (($it | path dirname | path split | last 2 | str collect ' ') != 'auto-generate completions') {
			$it
		}
	}
	| par-each {|it| # Exclude old files
		if (not (($it | path dirname | path split) | any? $it == 'before_v0.60')) {
			$it
		}
	})

# Add more data and convert the list to markdown
let scripts_md = ($scripts 
	| par-each {|it| { # This code turns the filepath of the scripts to a table of script data
			Name: $"[($it | path basename)]\((build-string 'https://github.com/nushell/nu_scripts/blob/main/' ($it | path relative-to $env.PWD | str replace '\' '/' -a -s))\)", 
			Length: $'(open $it | size | get lines) lines',
			Dir: (if (($it | path dirname | path relative-to $env.PWD | str replace (char separator) '/' -a -s) | empty?) {
				"x"
			} else { ($it | path dirname | path relative-to $env.PWD | str replace (char separator) '/' -a -s) })
		}
	} | sort-by Name | to md)

# Write the template
open './README_template.md'
	| str replace '{{scripts_list}}' $scripts_md -s # Add Script list
	| str replace '{{scriptcount}}' ($scripts | length | into string) -s -a # Add script count
	| prepend $'<!-- ⚠️ This README has been automatically generated on (date to-timezone UTC | date format "%Y-%m-%d %H:%M:%S UTC") ⚠️ -->' 
	| str collect "\n\n"
	| str trim -r -c "\n"
	| save ($file_loc)
