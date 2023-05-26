def "nu-complete make" [] {
    ls 
	| find --ignore-case makefile
	| open $in.0.name
	| lines 
	| find ':' 
	| where ($it | str starts-with '.') == false 
	| split column ' ' 
	| get column1 
	| find ':' 
	| str replace ':' ''
}

def "nu-complete make jobs" [] {
	seq 1 (sys | get cpu | length)
}

def "nu-complete make files" [] {
	ls **/* | where type == file | get name
}

def "nu-complete make dirs" [] {
	ls **/* | where type == dir | get name
}

export extern "make" [
	command?: string@"nu-complete make"
	--always-make(-B)                                 # Unconditionally make all targets.
	--directory(-C): string@"nu-complete make dirs"   # Change to DIRECTORY before doing anything.
	--debug(-d)                                       # Print various types of debugging information.
	--environment-overrides(-e)                       # Environment variables override makefiles.
	--eval(-E): string                                # Evaluate STRING as a makefile statement.
	--file(-f)                                        # Read FILE as a makefile.
	--help(-h)                                        # Print this message and exit.
	--ignore-errors(-i)                               # Ignore errors from recipes.
	--include-dir(-I): string@"nu-complete make dirs" # Search DIRECTORY for included makefiles.
	--jobs(-j): int@"nu-complete make jobs"           # Allow N jobs at once; infinite jobs with no arg.
	--keep-going(-k)                                  # Keep going when some targets can't be made.
	--load-average(-l): int@"nu-complete make jobs"   # Don't start multiple jobs unless load is below N.
	--check-symlink-times(-L)                         # Use the latest mtime between symlinks and target.
	--just-print(-n)                                  # Don't actually run any recipe; just print them.
	--dry-run
	--recon
	--assume-old: string@"nu-complete make files"     # Consider FILE to be very old and don't remake it.
	--old-file(-o): string@"nu-complete make files"
	--output-sync(-O)                                 # Synchronize output of parallel jobs by TYPE.
	--print-data-base(-p)                             # Print make's internal database.
	--question(-q)                                    # Run no recipe; exit status says if up to date.
	--no-builtin-rules(-r)                            # Disable the built-in implicit rules.
	--no-builtin-variables(-R)                        # Disable the built-in variable settings.
	--silent(-s)                                      # Don't echo recipes.
	--quiet
	--no-silent                                       # Echo recipes (disable --silent mode).
	--stop(-S)                                        # Turns off -k.
	--no-keep-going
	--touch(-t)                                       # Touch targets instead of remaking them.
	--trace                                           # Print tracing information.
	--version(-v)                                     # Print the version number of make and exit.
	--print-directory(-w)                             # Print the current directory.
	--no-print-directory                              # Turn off -w, even if it was turned on implicitly.
	--what-if(-W): string@"nu-complete make files"    # Consider FILE to be infinitely new.
	--new-file: string@"nu-complete make files"
	--assume-new: string@"nu-complete make files"
	--warn-undefined-variables                        # Warn when an undefined variable is referenced.
]
