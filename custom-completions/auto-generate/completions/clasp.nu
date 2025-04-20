# Show [h]elp
extern "clasp" [
	--help(-h)					# Show [h]elp
	--version(-v)					# Show [v]ersion
	--auth(-A)					# Path to a '.clasprc.json' or to a directory with it
	--ignore(-I)					# Path to a '.claspignore.json' or to a directory with it
	--project(-P)					# Path to a '.clasp.json' or to a directory with it
	--why(-W)					# Display some debugging info upon exit
	--no-localhost					# Do not run a local server, manually enter code instead
	--creds					# Specify a relative path to credentials
	--status					# Show who is logged in
	--type					# A project type
	--title					# A project title
	--parentId					# A project container ID
	--rootDir					# Path to a directory with project files
	--rootDir					# Path to a directory project files
	--versionNumber					# A project version to pull
	--force(-f)					# Forcibly overwrite a remote manifest
	--watch(-w)					# Watch for local changes in non-ignored files and push when they occur
	--json					# Show in JSON format
	--webapp					# Open a web application in a browser
	--creds					# Open the URL to create credentials
	--addon					# List parent IDs and open the URL of the first one
	--deploymentId					# Use a custom deployment ID with a web application
	--versionNumber(-V)					# A project version
	--description(-d)					# A deployment description
	--deploymentId(-i)					# A deployment ID to redeploy
	--all					# Undeploy all deployments
	--noShorten					# Do not shorten long names
	--json					# Show logs in JSON form
	--open					# Open the StackDriver logs in a browser
	--setup					# Setup StackDriver logs
	--watch					# Watch and list new logs
	--simplified					# Hide timestamps with logs
	--nondev					# Run a function in non-development mode
	--params(-p)					# Specify parameters for a function as a JSON array
	--open					# Open API Console in a browser
	...args
]