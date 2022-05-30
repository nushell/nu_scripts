# Show help
extern "cf help" [

	...args
]

# Print the version
extern "cf version" [

	...args
]

# Log user in
extern "cf login" [

	...args
]

# Log user out
extern "cf logout" [

	...args
]

# Change user password
extern "cf passwd" [

	...args
]

# Set or view the targeted org or space
extern "cf target" [

	...args
]

# Set or view target api url
extern "cf api" [

	...args
]

# Authenticate user non-interactively
extern "cf auth" [

	...args
]

# List all apps in the target space
extern "cf apps" [

	...args
]

# Display health and status for an app
extern "cf app" [

	...args
]

# Push a new app or sync changes to an existing app
extern "cf push" [

	...args
]

# Change or view the instance count, disk space limit, and memory limit for an app
extern "cf scale" [

	...args
]

# Delete an app
extern "cf delete" [

	...args
]

# Rename an app
extern "cf rename" [

	...args
]

# Start an app
extern "cf start" [

	...args
]

# Stop an app
extern "cf stop" [

	...args
]

# Stop all instances of the app, then start them again. This causes downtime.
extern "cf restart" [

	...args
]

# Recreate the app's executable artifact using the latest pushed app files and the latest environment (variables, service bindings, buildpack, stack, etc.)
extern "cf restage" [

	...args
]

# Terminate, then restart an app instance
extern "cf restart-app-instance" [

	...args
]

# Run a one-off task on an app
extern "cf run-task" [

	...args
]

# List tasks of an app
extern "cf tasks" [

	...args
]

# Terminate a running task of an app
extern "cf terminate-task" [

	...args
]

# Show recent app events
extern "cf events" [

	...args
]

# Print out a list of files in a directory or the contents of a specific file of an app running on the DEA backend
extern "cf files" [

	...args
]

# Tail or show recent logs for an app
extern "cf logs" [

	...args
]

# Show all env variables for an app
extern "cf env" [

	...args
]

# Set an env variable for an app
extern "cf set-env" [

	...args
]

# Remove an env variable
extern "cf unset-env" [

	...args
]

# List all stacks (a stack is a pre-built file system, including an operating system, that can run apps)
extern "cf stacks" [

	...args
]

# Show information for a stack (a stack is a pre-built file system, including an operating system, that can run apps)
extern "cf stack" [

	...args
]

# Copies the source code of an application to another existing application (and restarts that application)
extern "cf copy-source" [

	...args
]

# Create an app manifest for an app that has been pushed successfully
extern "cf create-app-manifest" [

	...args
]

# Show the type of health check performed on an app
extern "cf get-health-check" [

	...args
]

# Change type of health check performed on an app
extern "cf set-health-check" [

	...args
]

# Enable ssh for the application
extern "cf enable-ssh" [

	...args
]

# Disable ssh for the application
extern "cf disable-ssh" [

	...args
]

# Reports whether SSH is enabled on an application container instance
extern "cf ssh-enabled" [

	...args
]

# SSH to an application container instance
extern "cf ssh" [

	...args
]

# List available offerings in the marketplace
extern "cf marketplace" [

	...args
]

# List all service instances in the target space
extern "cf services" [

	...args
]

# Show service instance info
extern "cf service" [

	...args
]

# Create a service instance
extern "cf create-service" [

	...args
]

# Update a service instance
extern "cf update-service" [

	...args
]

# Delete a service instance
extern "cf delete-service" [

	...args
]

# Rename a service instance
extern "cf rename-service" [

	...args
]

# Create key for a service instance
extern "cf create-service-key" [

	...args
]

# List keys for a service instance
extern "cf service-keys" [

	...args
]

# Show service key info
extern "cf service-key" [

	...args
]

# Delete a service key
extern "cf delete-service-key" [

	...args
]

# Bind a service instance to an app
extern "cf bind-service" [

	...args
]

# Unbind a service instance from an app
extern "cf unbind-service" [

	...args
]

# Bind a service instance to an HTTP route
extern "cf bind-route-service" [

	...args
]

# Unbind a service instance from an HTTP route
extern "cf unbind-route-service" [

	...args
]

# Make a user-provided service instance available to CF apps
extern "cf create-user-provided-service" [

	...args
]

# Update user-provided service instance
extern "cf update-user-provided-service" [

	...args
]

# List all orgs
extern "cf orgs" [

	...args
]

# Show org info
extern "cf org" [

	...args
]

# Create an org
extern "cf create-org" [

	...args
]

# Delete an org
extern "cf delete-org" [

	...args
]

# Rename an org
extern "cf rename-org" [

	...args
]

# List all spaces in an org
extern "cf spaces" [

	...args
]

# Show space info
extern "cf space" [

	...args
]

# Create a space
extern "cf create-space" [

	...args
]

# Delete a space
extern "cf delete-space" [

	...args
]

# Rename a space
extern "cf rename-space" [

	...args
]

# Allow SSH access for the space
extern "cf allow-space-ssh" [

	...args
]

# Disallow SSH access for the space
extern "cf disallow-space-ssh" [

	...args
]

# Reports whether SSH is allowed in a space
extern "cf space-ssh-allowed" [

	...args
]

# List domains in the target org
extern "cf domains" [

	...args
]

# Create a domain in an org for later use
extern "cf create-domain" [

	...args
]

# Delete a domain
extern "cf delete-domain" [

	...args
]

# Create a domain that can be used by all orgs (admin-only)
extern "cf create-shared-domain" [

	...args
]

# Delete a shared domain
extern "cf delete-shared-domain" [

	...args
]

# List router groups
extern "cf router-groups" [

	...args
]

# List all routes in the current space or the current organization
extern "cf routes" [

	...args
]

# Create a url route in a space for later use
extern "cf create-route" [

	...args
]

# Perform a simple check to determine whether a route currently exists or not
extern "cf check-route" [

	...args
]

# Add a url route to an app
extern "cf map-route" [

	...args
]

# Remove a url route from an app
extern "cf unmap-route" [

	...args
]

# Delete a route
extern "cf delete-route" [

	...args
]

# Delete all orphaned routes (i.e. those that are not mapped to an app)
extern "cf delete-orphaned-routes" [

	...args
]

# List direct network traffic policies
extern "cf network-policies" [

	...args
]

# Create policy to allow direct network traffic from one app to another
extern "cf add-network-policy" [

	...args
]

# Remove network traffic policy of an app
extern "cf remove-network-policy" [

	...args
]

# List all buildpacks
extern "cf buildpacks" [

	...args
]

# Create a buildpack
extern "cf create-buildpack" [

	...args
]

# Update a buildpack
extern "cf update-buildpack" [

	...args
]

# Rename a buildpack
extern "cf rename-buildpack" [

	...args
]

# Delete a buildpack
extern "cf delete-buildpack" [

	...args
]

# Create a new user
extern "cf create-user" [

	...args
]

# Delete a user
extern "cf delete-user" [

	...args
]

# Show org users by role
extern "cf org-users" [

	...args
]

# Assign an org role to a user
extern "cf set-org-role" [

	...args
]

# Remove an org role from a user
extern "cf unset-org-role" [

	...args
]

# Show space users by role
extern "cf space-users" [

	...args
]

# Assign a space role to a user
extern "cf set-space-role" [

	...args
]

# Remove a space role from a user
extern "cf unset-space-role" [

	...args
]

# List available usage quotas
extern "cf quotas" [

	...args
]

# Show quota info
extern "cf quota" [

	...args
]

# Assign a quota to an org
extern "cf set-quota" [

	...args
]

# Define a new resource quota
extern "cf create-quota" [

	...args
]

# Delete a quota
extern "cf delete-quota" [

	...args
]

# Update an existing resource quota
extern "cf update-quota" [

	...args
]

# Share a private domain with an org
extern "cf share-private-domain" [

	...args
]

# Unshare a private domain with an org
extern "cf unshare-private-domain" [

	...args
]

# List available space resource quotas
extern "cf space-quotas" [

	...args
]

# Show space quota info
extern "cf space-quota" [

	...args
]

# Define a new space resource quota
extern "cf create-space-quota" [

	...args
]

# Update an existing space quota
extern "cf update-space-quota" [

	...args
]

# Delete a space quota definition and unassign the space quota from all spaces
extern "cf delete-space-quota" [

	...args
]

# Assign a space quota definition to a space
extern "cf set-space-quota" [

	...args
]

# Unassign a quota from a space
extern "cf unset-space-quota" [

	...args
]

# List service auth tokens
extern "cf service-auth-tokens" [

	...args
]

# Create a service auth token
extern "cf create-service-auth-token" [

	...args
]

# Update a service auth token
extern "cf update-service-auth-token" [

	...args
]

# Delete a service auth token
extern "cf delete-service-auth-token" [

	...args
]

# List service brokers
extern "cf service-brokers" [

	...args
]

# Create a service broker
extern "cf create-service-broker" [

	...args
]

# Update a service broker
extern "cf update-service-broker" [

	...args
]

# Delete a service broker
extern "cf delete-service-broker" [

	...args
]

# Rename a service broker
extern "cf rename-service-broker" [

	...args
]

# Migrate service instances from one service plan to another
extern "cf migrate-service-instances" [

	...args
]

# Recursively remove a service and child objects from Cloud Foundry database without making requests to a service broker
extern "cf purge-service-offering" [

	...args
]

# Recursively remove a service instance and child objects from Cloud Foundry database without making requests to a service broker
extern "cf purge-service-instance" [

	...args
]

# List service access settings
extern "cf service-access" [

	...args
]

# Enable access to a service or service plan for one or all orgs
extern "cf enable-service-access" [

	...args
]

# Disable access to a service or service plan for one or all orgs
extern "cf disable-service-access" [

	...args
]

# Show a single security group
extern "cf security-group" [

	...args
]

# List all security groups
extern "cf security-groups" [

	...args
]

# Create a security group
extern "cf create-security-group" [

	...args
]

# Update a security group
extern "cf update-security-group" [

	...args
]

# Deletes a security group
extern "cf delete-security-group" [

	...args
]

# Bind a security group to a particular space, or all existing spaces of an org
extern "cf bind-security-group" [

	...args
]

# Unbind a security group from a space
extern "cf unbind-security-group" [

	...args
]

# Bind a security group to the list of security groups to be used for staging applications
extern "cf bind-staging-security-group" [

	...args
]

# List security groups in the staging set for applications
extern "cf staging-security-groups" [

	...args
]

# Unbind a security group from the set of security groups for staging applications
extern "cf unbind-staging-security-group" [

	...args
]

# Bind a security group to the list of security groups to be used for running applications
extern "cf bind-running-security-group" [

	...args
]

# List security groups in the set of security groups for running applications
extern "cf running-security-groups" [

	...args
]

# Unbind a security group from the set of security groups for running applications
extern "cf unbind-running-security-group" [

	...args
]

# Retrieve the contents of the running environment variable group
extern "cf running-environment-variable-group" [

	...args
]

# Retrieve the contents of the staging environment variable group
extern "cf staging-environment-variable-group" [

	...args
]

# Pass parameters as JSON to create a staging environment variable group
extern "cf set-staging-environment-variable-group" [

	...args
]

# Pass parameters as JSON to create a running environment variable group
extern "cf set-running-environment-variable-group" [

	...args
]

# List all isolation segments
extern "cf isolation-segments" [

	...args
]

# Create an isolation segment
extern "cf create-isolation-segment" [

	...args
]

# Delete an isolation segment
extern "cf delete-isolation-segment" [

	...args
]

# Entitle an organization to an isolation segment
extern "cf enable-org-isolation" [

	...args
]

# Revoke an organization's entitlement to an isolation segment
extern "cf disable-org-isolation" [

	...args
]

# Set the default isolation segment used for apps in spaces in an org
extern "cf set-org-default-isolation-segment" [

	...args
]

# Reset the default isolation segment used for apps in spaces of an org
extern "cf reset-org-default-isolation-segment" [

	...args
]

# Assign the isolation segment for a space
extern "cf set-space-isolation-segment" [

	...args
]

# Reset the space's isolation segment to the org default
extern "cf reset-space-isolation-segment" [

	...args
]

# Retrieve list of feature flags with status
extern "cf feature-flags" [

	...args
]

# Retrieve an individual feature flag with status
extern "cf feature-flag" [

	...args
]

# Allow use of a feature
extern "cf enable-feature-flag" [

	...args
]

# Prevent use of a feature
extern "cf disable-feature-flag" [

	...args
]

# Executes a request to the targeted API endpoint
extern "cf curl" [

	...args
]

# Write default values to the config
extern "cf config" [

	...args
]

# Retrieve and display the OAuth token for the current session
extern "cf oauth-token" [

	...args
]

# Get a one time password for ssh clients
extern "cf ssh-code" [

	...args
]

# Add a new plugin repository
extern "cf add-plugin-repo" [

	...args
]

# Remove a plugin repository
extern "cf remove-plugin-repo" [

	...args
]

# List all the added plugin repositories
extern "cf list-plugin-repos" [

	...args
]

# List all available plugins in specified repository or in all added repositories
extern "cf repo-plugins" [

	...args
]

# List commands of installed plugins
extern "cf plugins" [

	...args
]

# Install CLI plugin
extern "cf install-plugin" [

	...args
]

# Uninstall CLI plugin
extern "cf uninstall-plugin" [

	...args
]