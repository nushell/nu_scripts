use ../../nu-complete "nu-complete pass-files"

# Interactively update a set of passwords.
export extern "pass update" [
  ...paths: string@"nu-complete pass-files" # The passwords and/or directories to update.
  --clip(-c) # Write the password to the clipboard.
  --no-symbols(-n) # Do not use any non-alphanumeric characters.
  --length(-l): int = 25 # Provide a password length.
  --provide(-p) # Let the user specify a password by hand.
  --multiline(-m) # Update multiline passwords. If not set, only the first line of a password file is updated.
  --include(-i): string # Only update the passwords that match a regex.
  --exclude(-e): string # Do not update the passwords that match a regex.
  --edit(-E) # Edit the passwords using the default editor.
  --force(-f) # Force update.
  --version(-V) # Show version information.
  --help(-h) # Print a help message.
]
