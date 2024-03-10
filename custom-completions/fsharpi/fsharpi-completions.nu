# Use the given file on startup
extern "fsharpi" [
    --use                    # Use the given file on startup
    --load                    # #load the given file on startup
    --reference                    # Reference an assembly
    #--debug+(-g)                    # Emit debug information
    --debug-                    # Disable --debug
    #--optimize+(-O)                    # Enable optimizations
    --optimize-                    # Disable --optimize
    #--tailcalls+                    # Enable or disable tailcalls
    --tailcalls-                    # Disable --tailcalls
    #--deterministic+                    # Produce a deterministic assembly
    --deterministic-                    # Disable --deterministic
    #--crossoptimize+                    # Enable or disable cross-module optimizations
    --crossoptimize-                    # Disable --crossoptimize
    #--warnaserror+                    # Report all warnings as errors
    --warnaserror-                    # Disable --warnaserror
    #--warnaserror+                    # Report specific warnings as errors
    --warnaserror-                    # Disable --warnaserror:
    --nowarn                    # Disable specific warning messages
    --warnon                    # Enable specific warnings that may be off by default
    #--consolecolors+                    # Output warning and error messages in color
    --consolecolors-                    # Disable --consolecolors
    #--checked+                    # Generate overflow checks
    --checked-                    # Disable --checked
    --define                    # Define conditional compilation symbols
    --mlcompatibility                    # Ignore ML compatibility warnings
    --nologo                    # Suppress compiler copyright message
    --help(-?)                    # Display this usage message
    --codepage                    # Specify the codepage used to read source files
    --utf8output                    # Output messages in UTF-8 encoding
    --fullpaths                    # Output messages with fully qualified paths
    --lib                    # Specify a dir for the include path for source files and assemblies
    --simpleresolution                    # Resolve assembly references using directory-based rules
    --targetprofile                    # Specify target framework profile: mscorlib, netcore or netstandard
    --noframework                    # Do not reference the default CLI assemblies by default
    --exec                    # Exit fsi after loading files or running the .fsx script
    #--gui+                    # Execute interactions on a Windows Forms event loop
    --gui-                    # Disable --gui
    --quiet                    # Suppress fsi writing to stdout
    #--readline+                    # Support TAB completion in console
    --readline-                    # Disable --readline
    #--quotations-debug+                    # Emit debug information in quotations
    --quotations-debug-                    # Disable --quotations-debug
    #--shadowcopyreferences+                    # Prevents references being locked by the F# Interactive process
    --shadowcopyreferences-                    # Disable --shadowcopyreferences
    ...args
]