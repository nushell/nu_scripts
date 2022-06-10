#! REMOVE FILE BEFORE MERGE !#
#! This is just a temporary file to test how script data would work. !#

# Get's the data of a script.
def get-script-data [
	script-path: path # The path of the script
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
	$data | merge {{"description": $description}}
}

#! This is just a temporary file to test how script data would work. !#
#! REMOVE FILE BEFORE MERGE !#