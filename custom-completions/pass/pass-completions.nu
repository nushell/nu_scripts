def pass_completions_directory [] {
    if ($env | columns | any { |it| $it == "PASSWORD_STORE_DIR" }) {
        return $env.PASSWORD_STORE_DIR
    } else {
        return ("~/.password-store" | path expand)
    }
}

def "nu-complete pass-files" [] {
    let dir = (pass_completions_directory)
	ls ($dir | path join "**" | path join "*.gpg")
		| get name 
		| each {|it| ( $it
            | path relative-to $dir
            | str replace ".gpg" ""
            )
        }
}

def "nu-complete pass-directories" [] {
    let dir = (pass_completions_directory)
	ls ($dir | path join **)
        | get name
        | filter { |it| not (ls $it | is-empty) }
		| each {|it| ( $it | path relative-to $dir) }
}

def "nu-complete pass init" [] {
	gpg --list-keys
		| lines
		| skip 2
		| split list ''
		| each { |entry|
			{
				value: ($entry.1 | str trim),
				description: ($entry.2 | parse --regex '^uid\s*\[[\w\s]*\]\s*(.*?)\s*$' | get 0.capture0)
			}
		}
}

# Initialize new password storage or reencrypt existing passwords.
export extern "pass init" [
  ...gpg_ids: string@"nu-complete pass init"  # The ID(s) of the GPG public keys the passwords shall be encrypted with.
  --path(-p): string@"nu-complete pass-directories"  # Subfolder to selectively reencrypt.
]

# List passwords.
export extern "pass ls" [
	subfolder?: string@"nu-complete pass-directories" # The subfolder to list.
]

# List passwords that match pass-names.
export extern "pass find" [
  ...pass_names: string # List of terms to search for.
]

# Show the value of a password.
export extern "pass show" [
	name: string@"nu-complete pass-files" # The name of the password to show.
  --clip(-c) # Do not print the password but instead copy the first (or otherwise specified, example: -c2) line to the clipboard.
  --qrcode(-q) # Do not print the password but instead display a QR code.
]

# Search for password files containing a given search string when decrypted.
export extern "pass grep" [
  ...grepoptions        # Options that will be passed to ^grep.
  search_string: string # The search string.
]

# Insert a new password
export extern "pass insert" [
	name: string@"nu-complete pass-directories"
	--echo(-e) # Enable keyboard echo.
	--multiline(-m) # Lines will be read until EOF or Ctrl+D is reached.
	--force(-f) # Omit prompt when trying to overwrite existing password.
]

export alias "pass add" = pass insert

# Edit an existing password.
export extern "pass edit" [
	name: string@"nu-complete pass-files" # The name of the password.
]

# Generate a new password
export extern "pass generate" [
	name: string@"nu-complete pass-directories" # The name of the password.
	length?: int = 25 # the length of the new password.
	--no-symbols(-n) # Do not use any non-alphanumeric characters in the generated password.
	--clip(-c) # Do not print the password but instead copy it to the clipboard using xclip or wl-clipboard.
	--in-place(-i) # Do not interactively prompt, and only replace the first line of the password file with the new generated password, keeping the remainder of the file intact.
	--force(-f) # Omit prompt when trying to overwrite existing password.
]

# Remove a password or directory.
export extern "pass rm" [
	name: string@"nu-complete pass-files" # The name of the password or directory to remove.
	--recursive(-r) # delete pass-name recursively if it is a directory.
	--force(-f) # Do not interactively prompt before removal.
]

# Rename or move a password or directory.
export extern "pass mv" [
	oldname: string@"nu-complete pass-files" # The password or directory to copy.
	newname: string@"nu-complete pass-directories" # The path to copy the password or directory to.
	--force(-f) # Omit prompt when trying to overwrite existing password.
]

# Copy a password or directory.
export extern "pass cp" [
	oldname: string@"nu-complete pass-files" # The password or directory to copy.
	newname: string@"nu-complete pass-directories" # The path to copy the password or directory to.
	--force(-f) # Omit prompt when trying to overwrite existing password.
]

# If the password store is a git repository, execute a git command.
export extern "pass git" [
  ...git_command_args # The git command to run.
]

# Show help information.
export extern "pass help" []

# Show version information.
export extern "pass version" []

export extern "pass" [
	path: string@"nu-complete pass-files" # The password to show or subfolder to list.
  --clip(-c) # Do not print the password but instead copy the first (or otherwise specified, example: -c2) line to the clipboard.
  --qrcode(-q) # Do not print the password but instead display a QR code.
]
