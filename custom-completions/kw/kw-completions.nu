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