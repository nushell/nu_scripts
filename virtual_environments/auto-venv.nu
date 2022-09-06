
def log-debug [msg: string, val: any = $nothing] {

    let result = (if $val == $nothing {
        $msg
    }
    else {
        $msg + "\n> " + ($val | str collect)
    })

    ($result + "\n") | save --append D:\Personal\Projects\nushell\nu_scripts\virtual_environments\debug.log
}

module path_extensions {

    # Returns a list of full paths starting from root, to the path given
    # 
    # 
    # walk '/home/user/projects';
    # > [
    # >   '/home/',
    # >   '/home/user/',
    # >   '/home/user/projects/',
    # > ]
    # 
    export def "path walk" [
        path: string
    ] {
        let list = ($path | path expand | path split);
    
        # compensate for bug in `path split`
        let list = (
            if $nu.os-info.name == "windows" {
                let len = ($list | length);
    
                [
                    ($list | first 2 | str collect),
                    ($list | last ($len - 2))
                ] | flatten;
            } 
            else { $list }
        );
    
        let len = ($list | length);
    
        $list | each -n { |$part| (
            $list | first ($part.index + 1) | path join;
        )}
    
    }
    
    # Returns true if 'subfolder' is a folder along the path of 'folder' 
    export def "path check-sub" [
        folder:    string, 
        subfolder: string
    ] {

        (ls -a $folder
        | where ( 
                $it | $it.type == 'dir' and ($it.name | path basename) == $subfolder
            )
            | length 
        ) > 0;
    }
    
    # Walks the path along 'folder', and returns the path of the first subfolder found, or nothing if the subfolder was not found.
    # 
    # path find-sub '/home/user/projects/code' '.venv';
    # > /home/user/projects/.venv
    export def "path find-sub" [
        folder:    string, 
        subfolder: string
    ] {
        let paths = path walk $folder;
    
        let paths = ( $paths 
            | where (
                $it | path check-sub $it $subfolder
            )
        );

        if ($paths != $nothing) and ($paths | length) > 0 {
            [ ($paths | first), $subfolder ] | path join
        }
    }
}

module venv_helpers {

    use path_extensions *

    def has-sub [
        folder:    string, 
        subfolder: string
    ] {
        not (path find-sub $folder $subfolder | empty?);
    }

    def get-env [
        name:    string
        default: any
    ] {
        (if ($name in $env) {
            $env | get $name
        }
        else {
            $default
        })
    }
    
    export def venv-is-active [] {
        'python-venv' in (overlay list)
    }
    
    
    export def has-entered-venv [
        after: path
    ] {

        let target = path find-sub $after '.venv'
        
        (if ($target | empty?) {
            false
        }
        else {
            # if venv is already active, handle it in "venv swap" hook
            not (venv-is-active)
        })
    }

    export def has-swapped-venv [
        after: path
    ] {

    (if not (venv-is-active) {
            false
        }
        else {
            let target = path find-sub $after '.venv'
                
            (if ($target | empty?) {
                false
            }
            else {
                $env.VIRTUAL_ENV != $target
            })

        })
    }

    export def has-exited-venv [
        after: path
    ] {

        (if not (venv-is-active) {
            false
        } 
        else {
            not (has-sub $after '.venv')
        })
    }
}

# must be in 'global' scope when `condition` is called
use venv_helpers
use path_extensions

let on_enter = '
    let _env = $env

    let virtual_env    = (path_extensions path find-sub $_env.PWD ".venv")
    let bin            = ([$virtual_env, "bin"] | path join)
    let virtual_prompt = ""

    overlay add D:\Personal\Projects\nushell\nu_scripts\virtual_environments\python-venv.nu

    # hooks dont self-trigger
    cd ($_env.PWD)

    activate-virtualenv $_env $virtual_env $bin $virtual_prompt

    hide _env
    hide virtual_env
    hide bin
    hide virtual_prompt
'

let on_exit = '
    overlay remove python-venv --keep-env [PWD]
'

let-env config = ($env.config | upsert hooks.env_change.PWD {
    [
        # activate on entry
        {
            condition: {|before, after| venv_helpers has-entered-venv $after}
            code: $'($on_enter)'
        }

        # re-activate on swap
        {
            condition: {|before, after| venv_helpers has-swapped-venv $after}
            code: $'
                ($on_exit)
                ($on_enter)
            '

        }

        # deactivate on exit
        {
            condition: { |before, after| venv_helpers has-exited-venv $after }
            code: $'
                ($on_exit)
            '
        }
    ]
})
