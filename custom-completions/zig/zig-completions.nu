# zvm
def "nu-complete zvm versions" [] {
  ^zvm list
  | lines
}

# switch between versions of Zig
export extern "zvm use" [
  --sync  #sync your current version of Zig with the repository
  --help(-h)
  version: string@"nu-complete zvm versions"
]

 # download and install a version of Zig
export extern "zvm install" []
# run a command with the given Zig version
export extern "zvm run" []
# list installed Zig versions. Flag `--all` to see remote options
export extern "zvm list" []
# remove an installed version of Zig
export extern "zvm uninstall" []
# remove build artifacts (good if you're a scrub)
export extern "zvm clean" []
# self-upgrade ZVM
export extern "zvm upgrade" []
# set ZVM's mirror list URL for custom Zig distribution servers, or set to "disabled" to download directly from ziglang.org
export extern "zvm mirrorlist" []
# set ZVM's version map URL for custom Zig distribution servers
export extern "zvm vmu" []
# Shows a list of commands or help for one command
export extern "zvm help" []
# =======

# zig
# =======

def "nu-complete zig build" [] {
  ^zig build -l
  | lines
  | parse --regex '^\s+(\S+)(?:\s+\(default\))?\s{2,}(.+)'
  | rename value description
  | update description { str trim }
}

# Build project from build.zig
export extern "zig build" [
  step?: string@"nu-complete zig build"
]


# Copy a package into global cache and print its hash
export extern "zig fetch" []
# Initialize a Zig package in the current directory
export extern "zig init" []
# Create executable from source or object files
export extern "zig build-exe" []
# Create library from source or object files
export extern "zig build-lib" []
# Create object from source or object files
export extern "zig build-obj" []
# Perform unit testing
export extern "zig test" []
# Create object for unit testing
export extern "zig test-obj" []
# Create executable and run immediately
export extern "zig run" []
# Look for simple compile errors in any set of files
export extern "zig ast-check" []
# Reformat Zig source into canonical form
export extern "zig fmt" []
# Minimize a bug report
export extern "zig reduce" []
# Convert C code to Zig code
export extern "zig translate-c" []
# Use Zig as a drop-in archiver
export extern "zig ar" []
# Use Zig as a drop-in C compiler
export extern "zig cc" []
# Use Zig as a drop-in C++ compiler
export extern "zig c++" []
# Use Zig as a drop-in dlltool.exe
export extern "zig dlltool" []
# Use Zig as a drop-in lib.exe
export extern "zig lib" []
# Use Zig as a drop-in ranlib
export extern "zig ranlib" []
# Use Zig as a drop-in objcopy
export extern "zig objcopy" []
# Use Zig as a drop-in rc.exe
export extern "zig rc" []
# Print lib path, std path, cache directory, and version
export extern "zig env" []
# Print this help and exit
export extern "zig help" []
# View standard library documentation in a browser
export extern "zig std" []
# Display native libc paths file or validate one
export extern "zig libc" []
# List available compilation targets
export extern "zig targets" []
# Print version number and exit
export extern "zig version" []
# Print Zen of Zig and exit
export extern "zig zen" []
