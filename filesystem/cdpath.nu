def-env c [dir = ""] {
    let default = if $nu.os_info.name == "windows" {
        $env.USERPROFILE
    } else {
        $env.HOME
    }

    let complete_dir = if $dir == "" {
        $default
    } else {
        $env.CDPATH
        | reduce -f "" { |$it, $acc| if $acc == "" {
            let new_path = ([$it $dir] | path join)
            if ($new_path | path exists) {
                $new_path
            } else {
                ""
            }
        } else { $acc }}
    }
    
    let complete_dir = if $complete_dir == "" { 
        error make {msg: "No such path"} 
    } else if (($complete_dir | path expand | path type) != "dir") {
        error make {msg: "Not a directory"}
    } else { 
        ($complete_dir | path expand)
    }

    let-env PWD = $complete_dir
}

# You need to have $env.CDPATH variable declared, my suggestion from config.nu:
# UNIX:
# let-env CDPATH = [".", $env.HOME, "/", ([$env.HOME, ".config"] | path join)]
# WINDOWS:
# let-env CDPATH = ["", $env.USERPROFILE, ([$env.USERPROFILE, "AppData\\Roaming\\"] | path join)]
