def "nu-complete loco new log" [] {
	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
				sort: false,
    },
		completions: [
			"off" 
			"error" 
			"warn"
			"info"
			"debug"
			"trace"
		]
	}
}

def "nu-complete loco new db" [] {
	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
				sort: false,
    },
		completions: [
			"sqlite" 
			"postgres" 
			"none" 
		]
	}
}

def "nu-complete loco new bg" [] {
	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
				sort: false,
    },
		completions: [
			"async" 
			"queue" 
			"blocking" 
			"none"
		]
	}
}

def "nu-complete loco new os" [] {
	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
				sort: false,
    },
		completions: [
			"windows" 
			"linux" 
			"macos" 
		]
	}
}

def "nu-complete loco new assets" [] {
	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
				sort: false,
    },
		completions: [
			"serverside" 
			"clientside" 
			"none" 
		]
	}
}

def "nu-complete loco subcommands" [] {
	{	
    options: {
			sort: false
    },
    completions : [
      { value: "new", description: "Create a new Loco app" },
      { value: "help", description: "Print this message or the help of the given subcommand(s)" },
    ]
  }
}

# Loco new app generator
export extern "loco" [
	subcommand?: string@"nu-complete loco subcommands"
 	--log(-l): string@"nu-complete loco new log" = "error" # Verbosity level
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Create a new Loco app
export extern "loco new" [
 	--log(-l): string@"nu-complete loco new log" = "error" # Verbosity level
 	--path(-p): path = "." # Local path to generate into
 	--name(-n): string # App name
 	--db: string@"nu-complete loco new db" # Database provider
 	--bg: string@"nu-complete loco new bg" # Background worker configuration
 	--assets: string@"nu-complete loco new assets" # Assets serving configuration 
	--allow-in-git-repo(-a) # Create the starter in target git repository
 	--os: string@"nu-complete loco new os" = "linux" # Create a Unix (linux, mac) or Windows optimized starter
 	--help(-h) # Print help
 	--version(-V) # Print version
]
