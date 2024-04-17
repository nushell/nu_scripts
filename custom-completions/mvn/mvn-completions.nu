# Display a help message
extern "mvn" [
    --also-make                    # If project list is specified, also build projects required by the list
    --also-make-dependents         # If project list is specified, also build projects that depend on projects on the list
    --batch-mode(-B)               # Run in non-interactive (batch) mode (disables output color)
    --builder(-b)                  # The id of the build strategy to use
    --strict-checksums(-C)         # Fail the build if checksums don't match
    --lax-checksums(-c)            # Warn if checksums don't match
    --color                        # Defines the color mode of the output. Supported are 'auto', 'always', 'never'.
    --check-plugin-updates         # Ineffective, only kept for backward compatibility
    --define(-D)                   # Define a user property
    --errors(-e)                   # Produce execution error messages
    --encrypt-master-password      # Encrypt master security password
    --encrypt-password             # Encrypt server password
    --file(-f)                     # Force the use of an alternate POM file (or directory with pom.xml)
    --fail-at-end                  # Only fail the build afterwards; allow all non-impacted builds to continue
    --fail-fast                    # Stop at first failure in reactorized builds
    --fail-never                   # NEVER fail the build, regardless of project result
    --global-settings              # Alternate path for the global settings file
    --global-toolchains            # Alternate path for the global toolchains file
    --help(-h)                     # Display help information
    --log-file(-l)                 # Log file where all build output will go (disables output color)
    --legacy-local-repository      # UNSUPPORTED: Use of this option will make Maven invocation fail.
    --non-recursive(-N)            # Do not recurse into sub-projects
    --no-plugin-registry           # Ineffective, only kept for backward compatibility
    --no-plugin-updates            # Ineffective, only kept for backward compatibility
    --no-snapshot-updates          # Suppress SNAPSHOT updates
    --no-transfer-progress         # Do not display transfer progress when downloading or uploading
    --offline(-o)                  # Work offline
    --activate-profiles(-P)        # Comma-delimited list of profiles to activate
    --projects                     # Comma-delimited list of specified reactor projects to build instead of all projects. A project can be specified by [groupId]:artifactId or by its relative path
    --quiet(-q)                    # Quiet output - only show errors
    --resume-from                  # Resume reactor from specified project
    --settings(-s)                 # Alternate path for the user settings file
    --toolchains(-t)               # Alternate path for the user toolchains file
    --threads(-T)                  # Thread count, for instance 4 (int) or 2C/2.5C (int/float) where C is core multiplied
    --update-snapshots(-U)         # Forces a check for missing releases and updated snapshots on remote repositories
    --update-plugins               # Ineffective, only kept for backward compatibility
    --version(-v)                  # Display version information
    --show-version(-V)             # Display version information WITHOUT stopping build
    --debug(-X)                    # Produce execution debug output
    ...args
]

# default mvn plugins
# Clean up after the build
extern "mvn clean" [
]

# Clean project and Skip test and Install the built artifact into the local repository. 
extern "mvn clean install -DskipTests" [
    --debug(-X)                    # Produce execution debug output
    --define(-D)                   # Define a user property
    --errors(-e)                   # Produce execution error messages
    --file(-f)                     # Force the use of an alternate POM file (or directory with pom.xml)
    --threads(-T)                  # Thread count, for instance 4 (int) or 2C/2.5C (int/float) where C is core multiplied
    --settings(-s)                 # Alternate path for the user settings file
    ...args
]

# Validates the project's POMs
extern "mvn validate" [

    ...args
]

# Compiles Java source
extern "mvn compile" [
    --debug(-X)                    # Produce execution debug output
    --define(-D)                   # Define a user property
    --errors(-e)                   # Produce execution error messages
    --file(-f)                     # Force the use of an alternate POM file (or directory with pom.xml)
    --threads(-T)                  # Thread count, for instance 4 (int) or 2C/2.5C (int/float) where C is core multiplied
    --settings(-s)                 # Alternate path for the user settings file
    ...args
]

# Run project test class
extern "mvn test" [
    --debug(-X)                    # Produce execution debug output
    --define(-D)                   # Define a user property
    --errors(-e)                   # Produce execution error messages
    --file(-f)                     # Force the use of an alternate POM file (or directory with pom.xml)
    --threads(-T)                  # Thread count, for instance 4 (int) or 2C/2.5C (int/float) where C is core multiplied
    --settings(-s)                 # Alternate path for the user settings file
    ...args
]

# Build and package the project
extern "mvn package" [
    --debug(-X)                    # Produce execution debug output
    --define(-D)                   # Define a user property
    --errors(-e)                   # Produce execution error messages
    --file(-f)                     # Force the use of an alternate POM file (or directory with pom.xml)
    --threads(-T)                  # Thread count, for instance 4 (int) or 2C/2.5C (int/float) where C is core multiplied
    --settings(-s)                 # Alternate path for the user settings file
    ...args
]

# Useful for integration tests - verifies the existence of certain conditions.
extern "mvn verify" [

    ...args
]

# Install the built artifact into the local repository.
extern "mvn install" [
    --debug(-X)                    # Produce execution debug output
    --define(-D)                   # Define a user property
    --errors(-e)                   # Produce execution error messages
    --file(-f)                     # Force the use of an alternate POM file (or directory with pom.xml)
    --threads(-T)                  # Thread count, for instance 4 (int) or 2C/2.5C (int/float) where C is core multiplied
    --settings(-s)                 # Alternate path for the user settings file
    ...args
]

# Skip test and Install the built artifact into the local repository.
extern "mvn install -DskipTests" [
    --debug(-X)                    # Produce execution debug output
    --define(-D)                   # Define a user property
    --errors(-e)                   # Produce execution error messages
    --file(-f)                     # Force the use of an alternate POM file (or directory with pom.xml)
    --threads(-T)                  # Thread count, for instance 4 (int) or 2C/2.5C (int/float) where C is core multiplied
    --settings(-s)                 # Alternate path for the user settings file
    ...args
]

# Generate a site for the current project.
extern "mvn site" [

    ...args
]

# Deploy the build artifacts to the remote repository.
extern "mvn deploy" [
    --non-recursive(-N)            # Do not recurse into sub-projects
    --projects                     # Comma-delimited list of specified reactor projects to build instead of all projects. A project can be specified by [groupId]:artifactId or by its relative path
    ...args
]