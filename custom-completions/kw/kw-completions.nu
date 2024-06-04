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
    --verbose                                           # Verbose mode
]

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