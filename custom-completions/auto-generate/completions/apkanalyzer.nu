# Analyze APK file attributes
extern "apkanalyzer apk" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Analyze the files inside the APK file
extern "apkanalyzer files" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Analyze the contents of the manifest file
extern "apkanalyzer manifest" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Analyze the DEX files inside the APK file
extern "apkanalyzer dex" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# View text, image and string resources
extern "apkanalyzer resources" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Human-readable output
extern "apkanalyzer" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the application ID, version code, and version name
extern "apkanalyzer summary" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the total file size of the APK
extern "apkanalyzer file-size" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints an estimate of the download size of the APK
extern "apkanalyzer download-size" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints features used by the APK that trigger Play Store filtering
extern "apkanalyzer features" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Compares the sizes of apk-file and apk-file
extern "apkanalyzer compare" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Lists all files in the APK
extern "apkanalyzer list" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints out the file contents
extern "apkanalyzer cat" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the APK manifest in XML format
extern "apkanalyzer print" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the application ID value
extern "apkanalyzer application-id" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the version name value
extern "apkanalyzer version-name" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the version code value
extern "apkanalyzer version-code" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the minimum SDK version
extern "apkanalyzer min-sdk" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the target SDK version
extern "apkanalyzer target-sdk" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the list of permissions
extern "apkanalyzer permissions" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints whether the APK is debuggable
extern "apkanalyzer debuggable" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the number of method references in the specified DEX files
extern "apkanalyzer references" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the class tree from DEX
extern "apkanalyzer packages" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the bytecode of a class or method in smali format
extern "apkanalyzer code" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints a list of configurations for the specified type
extern "apkanalyzer configs" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the value of the resource specified by config, name, and type
extern "apkanalyzer value" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints a list of resource names for a configuration and type
extern "apkanalyzer names" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]

# Prints the human-readable form of a binary XML file
extern "apkanalyzer xml" [
	--human-readable(-h)					# Human-readable output
	--not-required					# Include features marked as not required in the output
	--different-only					# Prints directories and files with differences
	--files-only					# Does not print directory entries
	--patch-size					# Shows an estimate of the file-by-file patch instead of a raw difference
	--defined-only					# Includes only classes defined in the APK in the output
	--files					# Specifies the DEX file names to include
	--proguard-folder					# Specifies the Proguard output folder to search for mappings
	--proguard-mapping					# Specifies the Proguard mapping file
	--proguard-seeds					# Specifies the Proguard seeds file
	--proguard-usage					# Specifies the Proguard usage file
	--show-removed					# Shows classes and members that were removed by Proguard
	--class					# Specifies the class name to print
	--method					# Specifies the method name to print
	...args
]