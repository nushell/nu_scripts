#!/usr/bin/nu

#   I actually use it as a part of my startup, so I am not really sure how to pack it, yet I wouldd like to contribute
#-------------------------------------------------------------------------------------------------------------------------------
#
#   How to use?
#-------------------------------------------------
#1)     Add desired paths to the cdpath variable
#2)     Use in your shell: $c [directory]
#2.5)   You *have to* use an argument. If you wish to simply $cd, use $cd command.
#3)     If the path exists, you will cd into the first match found (the command is iterating over the list in the correct order,
#   i.e. first element is being iterated overin the first place)
#3.5)   But if path does not exist, you will receive a proper echo.
#-----------------------------------------------------------------------------------------------------------------------------------
#
#Written by skelly37
#------------------------

# startup = [
# 	"let cdpath = [. /place/your ~/cdpath/here ]", 
# 	"def c [dir] { let wd = (pwd); for element in $cdpath {if (pwd) == $wd {cd $element; for directory in (ls -a | select name type | each { if $it.type == Dir {echo $it.name} {} }  ) {if $dir == $directory {cd $dir} {}}; if (pwd) == $element {cd $wd} {}} {}}; if (pwd) == $wd {cd $wd; echo \"No such path!\"} {}}",
# ]
#

export def --env c [dir] {
    let CD_PATH = [. ($env.NU_PLUGIN_DIRS | get 0) $nu.default-config-dir ]
    let wd = (pwd);
    for element in $CD_PATH {
        let element = ($element | path expand)
        if (pwd) == $wd {
            cd $element;
            for directory in (ls -a | where type == dir | get name) {
                if $dir == $directory {
                    cd $dir
                    break
                }
            };
            if (pwd) == $element {
                cd $wd
            }
        }
    };
    if (pwd) == $wd {
        cd $wd
        print "No such path!"
    }
}

