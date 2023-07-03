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

# Show folders in the password store
export extern "pass ls" [
	subfolder?: string@"nu-complete pass-directories"
]

# Show the value of a password
export extern "pass show" [
	name: string@"nu-complete pass-files"
    --clip(-c) # do not print the password but instead copy the first (or otherwise specified, example: -c2) line to the clipboard.
    --qrcode(-q) # do not print the password but instead display a QR code.
]

# Add a new password
export extern "pass add" [
	name: string@"nu-complete pass-directories"
	--echo(-e) # Enable keyboard echo
	--multiline(-m) # Lines will be read until EOF or Ctrl+D is reached
	--force(-f) # Omit prompt when trying to overwrite existing password
]

# Edit an existing password
export extern "pass edit" [
	name: string@"nu-complete pass-files"
]

# Generate a new password
export extern "pass generate" [
	name: string@"nu-complete pass-directories"
	length?: number
	--no-symbols(-n) # Do not use any non-alphanumeric characters in the generated password
	--clip(-c) # Do not print the password but instead copy it to the clipboard using xclip or wl-clipboard
	--in-place(-i) # Do not interactively prompt, and only replace the first line of the password file with the new generated password, keeping the remainder of the file intact
	--force(-f) # Omit prompt when trying to overwrite existing password
]

# Remove a password
export extern "pass rm" [
	name: string@"nu-complete pass-files"
	--recursive(-r) # delete pass-name recursively if it is a directory
	--force(-f) # Do not interactively prompt before removal
]

# Rename a password
export extern "pass mv" [
	oldname: string@"nu-complete pass-files"
	newname: string@"nu-complete pass-directories"
	--force(-f) # Omit prompt when trying to overwrite existing password
]

# Copy a password
export extern "pass cp" [
	oldname: string@"nu-complete pass-files"
	newname: string@"nu-complete pass-directories"
	--force(-f) # Omit prompt when trying to overwrite existing password
]

