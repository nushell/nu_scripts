# Shows information about Poetry.
extern "poetry about" [
  ...args
]

# Adds a new dependency to pyproject.toml.
extern "poetry add" [
  ...args
]

# Builds a package, as a tarball and a wheel by default.
extern "poetry build" [
  ...args
]

# Checks the validity of the pyproject.toml file.
extern "poetry check" [
  ...args
]

# Manages configuration settings.
extern "poetry config" [
  ...args
]

# Exports the lock file to alternative formats.
extern "poetry export" [
  ...args
]

# Displays help for a command.
extern "poetry help" [
  ...args
]

# Creates a basic pyproject.toml file in the current directory.
extern "poetry init" [
  ...args
]

# Installs the project dependencies.
extern "poetry install" [
  ...args
]

# Lists commands.
extern "poetry list" [
  ...args
]

# Locks the project dependencies.
extern "poetry lock" [
  ...args
]

# Creates a new Python project at <path>.
extern "poetry new" [
  ...args
]

# Publishes a package to a remote repository.
extern "poetry publish" [
  ...args
]

# Removes a package from the project dependencies.
extern "poetry remove" [
  ...args
]

# Runs a command in the appropriate environment.
extern "poetry run" [
  ...args
]

# Searches for packages on remote repositories.
extern "poetry search" [
  ...args
]

# Spawns a shell within the virtual environment.
extern "poetry shell" [
  ...args
]

# Shows information about packages.
extern "poetry show" [
  ...args
]

# Update the dependencies as according to the pyproject.toml file.
extern "poetry update" [
  ...args
]

# Shows the version of the project or bumps it when a valid bump rule is provided.
extern "poetry version" [
  ...args
]

# Clears Poetry's cache.
extern "poetry cache clear" [
    ...args
]

# List Poetry's caches.
extern "poetry cache list" [
    ...args
]

# Shows debug information.
extern "poetry debug info" [
    ...args
]

# Debugs dependency resolution.
extern "poetry debug resolve" [
    ...args
]

# Displays information about the current environment.
extern "poetry env info" [
    ...args
]

# Lists all virtualenvs associated with the current project.
extern "poetry env list" [
    ...args
]

# Remove virtual environments associated with the project.
extern "poetry env remove" [
    ...args
]

# Activates or creates a new virtualenv for the current project.
extern "poetry env use" [
    ...args
]

# Add additional packages to Poetry's runtime environment.
extern "poetry self add" [
    ...args
]

# Install locked packages (incl. addons) required by this Poetry installation.
extern "poetry self install" [
    ...args
]

# Lock the Poetry installation's system requirements.
extern "poetry self lock" [
    ...args
]

# Remove additional packages from Poetry's runtime environment.
extern "poetry self remove" [
    ...args
]

# Show packages from Poetry's runtime environment.
extern "poetry self show" [
    ...args
]

# Shows information about the currently installed plugins.
extern "poetry self show plugins" [
    ...args
]

# Updates Poetry to the latest version.
extern "poetry self update" [
    ...args
]

# Add source configuration for project.
extern "poetry source add" [
    ...args
]

# Remove source configured for the project.
extern "poetry source remove" [
    ...args
]

# Show information about sources configured for the project.
extern "poetry source show" [
    ...args
]
