# Enable debugger
extern "jhipster" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Create a new JHipster application
extern "jhipster app" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Deploy the current application to AWS
extern "jhipster aws" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Create pipeline scripts for popular CI tools
extern "jhipster ci-cd" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Create a new JHipster client-side application
extern "jhipster client" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Prepare Cloud Foundry deployment
extern "jhipster cloudfoundry" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Create required Docker deployment configs for applications
extern "jhipster docker-compose" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Deploy the current application to Heroku
extern "jhipster heroku" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Display information about your current project and system
extern "jhipster info" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Deploy the current application to Kubernetes
extern "jhipster kubernetes" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Deploy the current application to OpenShift
extern "jhipster openshift" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Deploy the current application to Rancher
extern "jhipster rancher-compose" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Create a new JHipster server-side application
extern "jhipster server" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Upgrade the JHipster and the generated application
extern "jhipster upgrade" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]

# Print command completion script
extern "jhipster completion" [
	--debug(-d)					# Enable debugger
	--help(-h)					# Output usage information
	--version(-V)					# Output version number
	...args
]