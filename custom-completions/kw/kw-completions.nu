def "nu-complete kw warnings" [] {
    [
        [value description]; 
        ["1" "not too often, may be relevant"] 
        ["2" "quite often, may still be relevant"] 
        ["3" "more obscure, likely ignorable"]
        ["12" "warns 1 and 2"]
        ["13" "warns 1 and 3"]
        ["23" "warns 2 and 3"]
        ["123" "all warnings"]
    ]
}

def "nu-complete kw target" [] {
    ["local", "remote"]
}

def "nu-complete kw init template" [] {
    ["x86-64", "rpi4-raspbian-32-cross-x86-arm", "rpi4-raspbian-64-cross-x86-arm"]
}

def "nu-complete kw init arch" [] {
    if ("arch" | path exists) {
        ls arch 
        | where type == "dir" 
        | get name 
        | each {|el| $el | str replace 'arch/' ''}
    } else {
        []
    }
}

def "nu-complete kw deploy alert" [] {
    ["s", "v", "sv", "vs", "n"]
}

def "nu-complete kw cores" [] {
    1..(sys cpu | length)
}

# The inglorious kernel developer workflow tool
export extern "kw" [
    --help(-h)          # Shows help page
    --version(-v)       # Shows version
]

# Initalize kworkflow config file
export extern "kw init" [
    --template: string@"nu-complete kw init template"   # Uses a template as the kworkflow.config
    --arch: string@"nu-complete kw init arch"           # Sets the variable arch from the newly created kworkflow.config
    --remote: string                                    # <user>@<host>:<port> set the variables ssh_user, ssh_ip, and ssh_port to <user>, <ip>, and <port>, respectively.
    --target: string@"nu-complete kw target"            # Sets default_deploy_target from kworkflow.config
    --help(-h)                                          # Shows help page
    --verbose                                           # Verbose mode
]

# Builds the kernel
export extern "kw build" [
    ...flags: string                                 
    --info(-i)                                          # Displays build information
    --menu(-n)                                          # Invokes the kernel menuconfig
    --doc(-d)                                           # Builds the documentation
    --cpu-scaling(-S): int@"nu-complete kw cores"       # Sets the number of jobs to use for building the kernel (the -j flag)    
    --ccache                                            # Enable ccache  
    --warnings(-w): string@"nu-complete kw warnings"    # Sets the warning level for the kernel build
    --save-log-to(-s): string                           # Saves the build log to a file
    --llvm                                              # Uses LLVM toolchain during compilation and linking
    --clean(-c)                                         # Removes build files (keeps the configuration)
    --full-cleanup(-f)                                  # Runs make distclean to reset the tree to the default state
    --cflags                                            # Allow passing of flags to the compiler
    --alert: string
    --help(-h)                                          # Shows help page
    --verbose                                           # Verbose mode
]

export alias "kw b" = kw build


# Deploy the kernel
export extern "kw deploy" [
  --remote: string,                                  # deploy to a machine in the network
  --local                                            # deploy to the host machine
  --reboot(-r)                                       # reboot machine after deploy
  --no-reboot                                        # do not reboot machine after deploy
  --setup                                            # run basic setup in the target machine
  --modules(-m)                                      # only install/update modules
  --list(-l)                                         # list available kernels in a single column
  --list-all(-a)                                     # list all available kernels
  --ls-line(-s)                                      # list available kernels separated by comma
  --uninstall(-u): string                            # remove a single or multiple kernels
  --force(-f)                                        # remove kernels not installed by kw
  --create-package(-p)                               # create a kw package without deploying
  --from-package(-F)                                 # deploy a custom kernel from kw package
  --alert: string@"nu-complete kw deploy alert"      # set alert behaviour upon command completion
]


export alias "kw d" = kw deploy

# Useful wrapper to the diff command to compare files or directories
export extern "kw diff" [
    ...files: string
    --no-interactive                                # Displays all diff in two columns at once
    --verbose                                       # Verbose mode
]

export alias "kw df" = kw diff

# Ssh access into any network accessible machine
export extern "kw ssh" [
    --command(-c): string                               # Bash command to run on the remote machine
    --script(-s): string                                # Bash script to run on the remote machine
    --remote(-r): string                                # <user>@<host>:<port> parameters to ssh into the target machine
    --send: string                                      # Sends a local file to the remote. Needs to use --to after it
    --get: string                                       # Gets a remote file to the local. Needs to use --to after it
    --to: string                                        # The destination path. On the remote if --send. On the local if --get
    --verbose                                           # Verbose mode
]

export alias "kw s" = kw ssh