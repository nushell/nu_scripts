def main [] {
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
		| par-each {|it| 
			let metadata = (get-script-data $it)
			{ # This code turns the filepath of the scripts to a table of script data
				Name: $"[($it | path basename)]\((build-string 'https://github.com/nushell/nu_scripts/blob/main/' ($it | path relative-to $env.PWD | str replace '\' '/' -a -s))\)", 
				Length: $'(open $it | size | get lines) lines',
				Dir: (if (($it | path dirname | path relative-to $env.PWD | str replace (char separator) '/' -a -s) | empty?) {
					' '
				} else { ($it | path dirname | path relative-to $env.PWD | str replace (char separator) '/' -a -s) }),
				Description: (if ($metadata | get description | empty?) {' '} else {$metadata | get description})
			}
		} | sort-by Name | to md)

	# Write the template
	open './README_template.md'
		| str replace '{{scripts_list}}' $scripts_md -s # Add Script list
		| str replace '{{scriptcount}}' ($scripts | length | into string) -s -a # Add script count
		| prepend $'<!-- ⚠️ This README has been automatically generated on (date to-timezone UTC | date format "%Y-%m-%d %H:%M:%S UTC") ⚠️ -->' 
		| str collect "\n\n" 
		| str trim -r -c "\n" # Don't question this
		| save ($file_loc) # Save the file

	''
}






#** FUNCTIONS **#

# Get's the data of a script.
def get-script-data [
	script-path: path # The path of the script
	scripts-root: path = "." # The location of the nu_scripts folder
	#
	# Format info:
	#
	# Description '#? this is a part of my description'
	# Specific value '#?version: 1.0.2'
	#
	# For what keys you should add to your scripts, check here: https://github.com/nushell/nu_scripts/pull/246
] {
	let file = open $script-path # Get the contents of the script
	# All keyless attributes are appended to the description:
	# This is the expected syntax: #? {TEXT}
	let description = ($file | lines | each {|line|
		if ($line =~ '^#\? .*') { # Check line if it matches a regex
			$line | str substring '2,' | str trim # If yes, format it
		} # If no, discard. (`each` can be used as a filter)
	} | str collect ' ') # Collect all the formatted strings


	# All the keyed/indexed attributes are stored in this record (json like object)
	# This is the expected syntax: #?{KEY}:{VALUE}
	# TODO: Maybe the conversion from table to record can be removed somehow?
	let data = ($file | lines | each {|line|
		if ($line =~ '^#\?[a-z\-]+?:') { # Check line if it matches a regex

			# As far as I know, there is no way to get the matching string from a regex.
			# So we remove the text around the text we want to get.
			let key = ($line | str replace '^#\?' '' | str replace ':.*$' '' | str trim)
			let value = ($line | str replace '^#\?[a-z\-]+?:' '' | str trim)

			# Output the result as a table of keys and values.
			{
				"key": $key
				"value": $value
			}
		} # If no, discard. (`each` can be used as a filter)
	} | reduce -f {} {|it, acc| # Convert the table of keys and values in a record (json like object)
		$acc | merge {{$it.key: $it.value}}
	})

	# Add the description to the data and your done!
	{ "path": ($script-path | path relative-to ($scripts-root | path expand) 
		| str replace (char separator) '/' -a -s) } 
		| merge { $data } 
		| merge {{"description": $description}}
}

# Like `get-script-data` but auto-fills some data
def get-auto-script-data [
	script-path: path
	scripts-root: path = "."
] {
	let data = get-script-data $script-path $scripts-root

	

	{
		name: ($data.path | path basename),
		script-url: ($'https://github.com/nushell/nu_scripts/blob/main/($data.path)'),
		authors: (do {
			let apidata = ([
				[path]; 
				[(($script-path 
					| path expand 
					| path relative-to ($scripts-root | path expand)) 
					| str replace (char separator) '/' -s -a)
				]
			] | to url)
			let res = fetch $'http://api.github.com/repos/nushell/nu_scripts/commits?($apidata)'

			
			let authors = ($res | each {|c|
				if (($c | get author) != $nothing) {
					$c | get author
				}
			})

			$authors
		})
	}  | merge {($data | reject name)}
}