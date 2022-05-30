# Check syntax and warn on reflection.
extern "lein check" [

	...args
]

# Write the classpath of the current project to output-file.
extern "lein classpath" [

	...args
]

# Remove all files from project's target-path.
extern "lein clean" [

	...args
]

# Compile Clojure source into .class files.
extern "lein compile" [

	...args
]

# Build jar and deploy to remote repository.
extern "lein deploy" [

	...args
]

# Show details about dependencies.
extern "lein deps" [

	...args
]

# Higher-order task to perform other tasks in succession.
extern "lein do" [

	...args
]

# Display a list of tasks or help for a given task or subtask.
extern "lein help" [

	...args
]

# Install current project to the local repository.
extern "lein install" [

	...args
]

# Package up all the project's files into a jar file.
extern "lein jar" [

	...args
]

# Compile Java source files.
extern "lein javac" [

	...args
]

# Start a Light Table client for this project
extern "lein light" [

	...args
]

# Generate scaffolding for a new project based on a template.
extern "lein new" [

	...args
]

# DEPRECATED. Please use the :user profile instead.
extern "lein plugin" [

	...args
]

# Write a pom.xml file to disk for Maven interoperability.
extern "lein pom" [

	...args
]

# Start a repl session either with the current project or standalone.
extern "lein repl" [

	...args
]

# Run only the test namespaces which failed last time around.
extern "lein retest" [

	...args
]

# Run the project's -main function.
extern "lein run" [

	...args
]

# Search remote maven repositories for matching jars.
extern "lein search" [

	...args
]

# List all available profiles or display one if given an argument.
extern "lein show-profiles" [

	...args
]

# Run the project's tests.
extern "lein test" [

	...args
]

# Run a task without nesting the project's JVM inside Leiningen's.
extern "lein trampoline" [

	...args
]

# Package up the project files and all dependencies into a jar file.
extern "lein uberjar" [

	...args
]

# Perform arbitrary transformations on your project map.
extern "lein update-in" [

	...args
]

# Upgrade Leiningen to specified version or latest stable.
extern "lein upgrade" [

	...args
]

# Print version for Leiningen and the current JVM.
extern "lein version" [

	...args
]

# Apply the given task with the profile(s) specified.
extern "lein with-profile" [

	...args
]