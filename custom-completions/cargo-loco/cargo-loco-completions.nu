def _locate_cargo_root [] {
	cargo --quiet locate-project --message-format plain e> /dev/null
}

def _scheduler_jobs [
	context: string, 
] {
	let environment = $context 
		| parse --regex '(?:--environment|-e)\s+(?P<environment>[a-z0-9_-]+)'
		| get 0?.environment?
		| default "development"

	_locate_cargo_root
		| path dirname
		| path join $"config/($environment).yaml"
		| open $in
		| get scheduler?.jobs
		| transpose name settings
}

def "nu-complete environment" [] {
	let environments = _locate_cargo_root 
		| path dirname
		| path join "config"
		| ls $in
		| get name
		| path parse
		| get stem

	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
    },
		completions: $environments
	}
}

def "nu-complete tasks" [] {
	let tasks = _locate_cargo_root
		| path dirname
		| path join "src/tasks"
		| ls $in
		| get name
		| path parse
		| get stem
		| skip while {|file| $file == "mod"}

	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
    },
		completions: $tasks
	}
}

def "nu-complete scheduler jobs" [
	context: string, 
] {
	let jobs = _scheduler_jobs $context
		| get name

	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
    },
		completions: $jobs
	}
}

def "nu-complete scheduler tags" [
	context: string, 
] {
	let tags = _scheduler_jobs $context
		| get settings?.tags
		|	flatten
		| uniq 

	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
    },
		completions: $tags
	}
}

def "nu-complete kind" [] {
	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
				sort: false,
    },
		completions: [
			"htmx" 
			"html" 
			"api"
		]
	}
}

def "nu-complete deployment" [] {
	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
				sort: false,
    },
		completions: [
			"docker"
			"shuttle"
			"nginx"
		]
	}
}

def "nu-complete status" [] {
	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
				sort: false,
    },
		completions: [
			"queued"
			"processing"
			"completed"
			"failed"
			"cancelled"
		]
	}
}

def "nu-complete template" [] {
	{ 
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
				sort: false,
    },
		completions: [
      "controller"
      "controller/api"
      "controller/api/controller.t"
      "controller/api/test.t"
      "controller/html"
      "controller/html/controller.t"
      "controller/html/view.t"
      "controller/htmx"
      "controller/htmx/controller.t"
      "controller/htmx/view.t"

      "deployment"
      "deployment/docker"
      "deployment/docker/docker.t"
      "deployment/docker/ignore.t"
      "deployment/nginx"
      "deployment/nginx/nginx.t"
      "deployment/shuttle"
      "deployment/shuttle/config.t"
      "deployment/shuttle/shuttle.t"

     	"mailer"
      "mailer/html.t"
      "mailer/mailer.t"
      "mailer/subject.t"
      "mailer/text.t"

      "migration"
      "migration/add_columns.t"
      "migration/add_references.t"
      "migration/empty.t"
      "migration/join_table.t"
      "migration/remove_columns.t"

      "model"
      "model/model.t"
      "model/test.t"

      "scaffold"
      "scaffold/api"
      "scaffold/api/controller.t"
      "scaffold/api/test.t"
      "scaffold/html"
      "scaffold/html/base.t"
      "scaffold/html/controller.t"
      "scaffold/html/view.t"
      "scaffold/html/view_create.t"
      "scaffold/html/view_edit.t"
      "scaffold/html/view_list.t"
      "scaffold/html/view_show.t"
      "scaffold/htmx"
      "scaffold/htmx/base.t"
      "scaffold/htmx/controller.t"
      "scaffold/htmx/view.t"
      "scaffold/htmx/view_create.t"
      "scaffold/htmx/view_edit.t"
      "scaffold/htmx/view_list.t"
      "scaffold/htmx/view_show.t"

      "scheduler"
      "scheduler/scheduler.t"

      "task"
      "task/task.t"
      "task/test.t"

      "worker"
      "worker/test.t"
      "worker/worker.t"
		]
	}
}

def columns [
	name: string
	query?: string
] {
  mut columns = [
    "uuid"
    "uuid_col"
    "uuid_col!"

    "string"
    "string!"
    "string^"

    "text"
    "text!"

    "tiny_integer"
    "tiny_integer!"
    "tiny_integer^"

    "small_integer"
    "small_integer!"
    "small_integer^"

    "int"
    "int!"
    "int^"

    "big_int"
    "big_int!"
    "big_int^"

    "float"
    "float!"

    "double"
    "double!"

    "decimal"
    "decimal!"

    "decimal_len"
    "decimal_len!"

    "bool"
    "bool!"

    "tstz"
    "tstz!"

    "date"
    "date!"

    "ts"
    "ts!"

    "json"
    "json!"

    "jsonb"
    "jsonb!"
  ]

	if not ($query | is-empty) {
		$columns = $columns | filter { 
			$in | str contains --ignore-case $query
		}
	}

	$columns | each {|column| $"($name):($column) "}
}

def "nu-complete generate fields" [
	context: string, 
	position?: int
] {
	let field = $context
		| split row --regex '\s+'
		| last
		| str trim
		| split column ':' name column
		| last
		| { name: ($in.name | str snake-case), column: $in.column }

	{
    options: {
        case_sensitive: false,
        completion_algorithm: fuzzy,
    },
		completions: (columns $field.name $field.column)
	}
}

def "nu-complete subcommands" [] {
	{	
    options: {
			sort: false
    },
    completions : [
      { value: "start", description: "Start an app" },
      { value: "db", description: "Perform DB operations" },
      { value: "routes", description: "Describe all application endpoints" },
      { value: "middleware", description: "Describe all application middlewares" },
      { value: "task", description: "Run a custom task" },
      { value: "jobs", description: "Managing jobs queue" },
      { value: "scheduler", description: "Run the scheduler" },
      { value: "generate", description: "code generation creates a set of files and code templates based on a predefined set of rules" },
      { value: "doctor", description: "Validate and diagnose configurations" },
      { value: "version", description: "Display the app version" },
      { value: "watch", description: "Watch and restart the app" },
      { value: "help", description: "Print this message or the help of the given subcommand(s)" },

  		# Aliases
      { value: "g", description: "Alias for `generate`" }
    ]
  }
}

def "nu-complete generate subcommands" [] {
	{	
    options: {
			sort: false
    },
    completions: [
      { value: "model", description: "Generates a new model file for defining the data structure of your application, and test file logic" },
      { value: "migration", description: "Generates a new migration file" },
      { value: "scaffold", description: "Generates a CRUD scaffold, model and controller" },
      { value: "controller", description: "Generate a new controller with the given controller name, and test file" },
      { value: "task", description: "Generate a Task based on the given name" },
      { value: "scheduler", description: "Generate a scheduler jobs configuration template" },
      { value: "worker", description: "Generate worker" },
      { value: "mailer", description: "Generate mailer" },
      { value: "deployment", description: "Generate a deployment infrastructure" },
      { value: "override", description: "Override templates and allows you to take control of them. You can always go back when deleting the local template" },
      { value: "help", description: "Print this message or the help of the given subcommand(s)" }
    ]
	}
}

def "nu-complete jobs" [] {
	{	
    options: {
			sort: false
    },
    completions: [
  		{ value: "cancel", description: "Cancels jobs with the specified names, setting their status to `cancelled`" }
      { value: "tidy", description: "Deletes jobs that are either completed or cancelled" }
      { value: "purge", description: "Deletes jobs based on their age in days" }
      { value: "dump", description: "Saves the details of all jobs to files in the specified folder" }
      { value: "import", description: "Imports jobs from a file" }
      { value: "help", description: "Print this message or the help of the given subcommand(s)" }
    ]
	}
}

# The one-person framework for Rust
export extern "cargo loco" [
	subcommand?: string@"nu-complete subcommands"
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Start an app
export extern "cargo loco start" [
  --worker(-w) # start worker
  --server-and-worker(-s) # start same-process server and worker
  --binding(-b): string # server bind address
  --port(-p): number # server port address
  --no-banner(-n) # disable the banner display
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Describe all application endpoints
export extern "cargo loco routes" [
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Start an app
export extern "cargo loco middleware" [
  --config(-c): path
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Run a custom task
export extern "cargo loco task" [
	name: string@"nu-complete tasks" # Task name (identifier)
	...params: string # Task params (e.g. `foo:bar baz:qux`)
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Run a custom task
export extern "cargo loco jobs" [
	subcommand?: string@"nu-complete jobs"
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Cancels jobs with the specified names, setting their status to `cancelled`
export extern "cargo loco jobs cancel" [
	--name: string # Names of jobs to cancel
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Deletes jobs that are either completed or cancelled
export extern "cargo loco jobs tidy" [
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Deletes jobs based on their age in days
export extern "cargo loco jobs purge" [
	--max-age: number = 90 # Deletes jobs with errors or cancelled, older than the specified maximum age in days
	--status: string@"nu-complete status" # Limits the jobs being saved to those with specific criteria like `completed` or `queued`
	--dump: path # Saves the details of jobs into a file before deleting them
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Saves the details of all jobs to files in the specified folder
export extern "cargo loco jobs dump" [
	--status: string@"nu-complete status" # Limits the jobs being saved to those with specific criteria like `completed` or `queued`
	--folder(-f): path = "." # Folder to save the job files
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Imports jobs from a file
export extern "cargo loco jobs import" [
	--file(-f): path # Path to the file containing job details to import
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Run the scheduler
export extern "cargo loco scheduler" [
	--name(-n): string@"nu-complete scheduler jobs" # Run a specific job by its name
	--tag(-t): string@"nu-complete scheduler tags" # Run jobs that are associated with a specific tag
	--config(-c): path # Specify a path to a dedicated scheduler configuration file. by default load schedulers job setting from environment config
	--list(-l) # Show all configured jobs
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# code generation creates a set of files and code templates based on a predefined set of rules
export extern "cargo loco generate" [
	subcommand?: string@"nu-complete generate subcommands"
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generates a new model file for defining the data structure of your application, and test file logic
export extern "cargo loco generate model" [
	name: string #  Name of the thing to generate
	...fields: string@"nu-complete generate fields" # Model fields, eg. title:string hits:int
	--link(-l) # Is it a link table? Use this in many-to-many relations
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generates a new migration file
export extern "cargo loco generate migration" [
	name: string #  Name of the migration to generate
	...fields: string@"nu-complete generate fields" # Table fields, eg. title:string hits:int
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate a new controller with the given controller name, and test file
export extern "cargo loco generate controller" [
	name: string #  Name of the thing to generate
	...actions: string # Actions
	--kind(-k): string@"nu-complete kind" # The kind of controller actions to generate
 	--htmx # Use HTMX controller actions
 	--html # Use HTML controller actions
 	--api # Use API controller actions
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generates a CRUD scaffold, model and controller
export extern "cargo loco generate scaffold" [
	name: string #  Name of the thing to generate
	...fields: string@"nu-complete generate fields" # Model fields, eg. title:string hits:int
	--kind(-k): string@"nu-complete kind" # The kind of controller actions to generate
 	--htmx # Use HTMX controller actions
 	--html # Use HTML controller actions
 	--api # Use API controller actions
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate a Task based on the given name
export extern "cargo loco generate task" [
	name: string #  Name of the thing to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate a scheduler jobs configuration template
export extern "cargo loco generate scheduler" [
	name: string #  Name of the thing to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate worker
export extern "cargo loco generate worker" [
	name: string #  Name of the thing to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate mailer
export extern "cargo loco generate mailer" [
	name: string #  Name of the thing to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate a deployment infrastructure
export extern "cargo loco generate deployment" [
	--kind: string@"nu-complete deployment" # The kind of deployment to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Override templates and allows you to take control of them. You can always go back when deleting the local template
export extern "cargo loco generate override" [
	template: path@"nu-complete template" # The path to a specific template or directory to copy
	--info # Show available templates to copy under the specified directory without actually coping them
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]


# code generation creates a set of files and code templates based on a predefined set of rules
export extern "cargo loco g" [
	subcommand?: string@"nu-complete generate subcommands"
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generates a new model file for defining the data structure of your application, and test file logic
export extern "cargo loco g model" [
	name: string #  Name of the thing to generate
	...fields: string@"nu-complete generate fields" # Model fields, eg. title:string hits:int
	--link(-l) # Is it a link table? Use this in many-to-many relations
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generates a new migration file
export extern "cargo loco g migration" [
	name: string #  Name of the migration to generate
	...fields: string@"nu-complete generate fields" # Table fields, eg. title:string hits:int
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate a new controller with the given controller name, and test file
export extern "cargo loco g controller" [
	name: string #  Name of the thing to generate
	...actions: string # Actions
	--kind(-k): string@"nu-complete kind" # The kind of controller actions to generate
 	--htmx # Use HTMX controller actions
 	--html # Use HTML controller actions
 	--api # Use API controller actions
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generates a CRUD scaffold, model and controller
export extern "cargo loco g scaffold" [
	name: string #  Name of the thing to generate
	...fields: string@"nu-complete generate fields" # Model fields, eg. title:string hits:int
	--kind(-k): string@"nu-complete kind" # The kind of controller actions to generate
 	--htmx # Use HTMX controller actions
 	--html # Use HTML controller actions
 	--api # Use API controller actions
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate a Task based on the given name
export extern "cargo loco g task" [
	name: string #  Name of the thing to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate a scheduler jobs configuration template
export extern "cargo loco g scheduler" [
	name: string #  Name of the thing to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate worker
export extern "cargo loco g worker" [
	name: string #  Name of the thing to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate mailer
export extern "cargo loco g mailer" [
	name: string #  Name of the thing to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Generate a deployment infrastructure
export extern "cargo loco g deployment" [
	--kind: string@"nu-complete deployment" # The kind of deployment to generate
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Override templates and allows you to take control of them. You can always go back when deleting the local template
export extern "cargo loco g override" [
	template: path@"nu-complete template" # The path to a specific template or directory to copy
	--info # Show available templates to copy under the specified directory without actually coping them
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Validate and diagnose configurations
export extern "cargo loco doctor" [
	--config(-c) # print out the current configurations
	--production(-p) # print out the current configurations
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Display the app version
export extern "cargo loco version" [
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]

# Watch
export extern "cargo loco watch" [
	--worker(-w) # start worker
	--server-and-worker(-s) # start same-process server and worker
	--environment(-e): string@"nu-complete environment" = "development" # Specify the environment
 	--help(-h) # Print help
 	--version(-V) # Print version
]
