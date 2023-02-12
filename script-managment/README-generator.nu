#?type: script
#?version: 0.1.0
#?short-desc: Generates a README using a template
#
#? Generates a README using a template.

def main [] {
	# The original location of the user
	let orig_dir = $env.PWD

	# Initial Message
	print $"Nushell Scripts README Generator (ansi dgr)\(Made by @Dan-Gamin\)(ansi reset)\n"

	# Ask user where the `nu_scripts` directory is.
	let root = (input $"(ansi u)?(ansi reset) Where is the nu_scripts folder relative to you? (ansi dgr)\(.\) »(ansi reset) ")
	let root = if ($root | empty?) { '.' | path expand } else { $root | path expand }
	print $"(ansi -e '1A')(ansi g)√(ansi reset)" # Draw checkmark
	
	
	# Ask user where to save the file
	let file_loc = (input $"(ansi u)?(ansi reset) Where do you want to save the README? (ansi dgr)\(README.md\) »(ansi reset) ")
	let file_loc = if ($file_loc | empty?) { 'README.md' } else { $file_loc | path expand }
	print $"(ansi -e '1A')(ansi g)√(ansi reset)" # Draw checkmark
	
	cd $root
	
	let template = ('./script-managment/README-template.md' | path expand)
	print "\nGenerating File..."

	# Import the script manifest libary
	source './script-managment/script-manifest.nu'

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
		| par-each {|it| 
			let metadata = (get-script-data $it)
			{ # This code turns the filepath of the scripts to a table of script data
				Name: $"[($it | path basename)]\((build-string 'https://github.com/nushell/nu_scripts/blob/main/' ($it | path relative-to $root | str replace '\' '/' -a -s))\)", 
				Length: $'(open $it | size | get lines) lines',
				Dir: (if (($it | path dirname | path relative-to $root | str replace (char separator) '/' -a -s) | empty?) {
					' '
				} else { ($it | path dirname | path relative-to $root | str replace (char separator) '/' -a -s) }),
				Description: (if ($metadata | get description | empty?) {' '} else {$metadata | get description})
			}
		} | sort-by Name | to md)

	print $template

	# Write the template
	open $template
		| str replace '{{scripts_list}}' $scripts_md -s # Add Script list
		| str replace '{{scriptcount}}' ($scripts | length | into string) -s -a # Add script count
		| prepend $'<!-- ⚠️ This README has been automatically generated on (date to-timezone UTC | date format "%Y-%m-%d %H:%M:%S UTC") ⚠️ -->' 
		| str collect "\n\n" 
		| str trim -r -c "\n" # Don't question this
		| save ($file_loc) # Save the file

	print $"Done! (ansi g)√√√√√(ansi reset)\n"
}