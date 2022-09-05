

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
def "path walk" [
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
    )};

}

# Returns true if 'subfolder' is a folder along the path of 'folder' 
def "path check-sub" [
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
def "path find-sub" [
    folder:    string, 
    subfolder: string
] {
    let paths = path walk $folder;

    let paths = ( $paths 
        | where (
            $it | path check-sub $it $subfolder
        )
    );

    if ($paths | length) > 0 {
        [ ($paths | first), $subfolder ] | path join;
    }
}

def has-sub [
    folder:    string, 
    subfolder: string
] {
    not (path find-sub $folder $subfolder | empty?);
}

def is-active [] {
    'VIRTUAL_ENV' in $env
}

def path-sep [] {
    if $nu.os-info.name == "windows" {
        '\'
    } else {
        '/'
    }
}

let venv = '.venv'

def-env _activate_venv [] {

    let virtual_env    = (path find-sub $env.PWD $venv)
    let bin            = ([$virtual_env, 'bin'] | path join)
    let path_sep       = path-sep
    let virtual_prompt = $venv
    
    activate-virtualenv $virtual_env $bin $path_sep $virtual_prompt
}



let-env config = ($env.config | upsert hooks.env_change.PWD {
    [
        # activate on entry
        {
            condition: {|before, after| (has-sub $after $venv) and (not (is-active)) }
            code: '
                overlay add ~/.nushell/autovox/python-venv.nu

                let virtual_env    = (path find-sub $env.PWD ".venv")
                let bin            = ([$virtual_env, "bin"] | path join)
                let path_sep       = path-sep
                let virtual_prompt = ""
                
                activate-virtualenv $virtual_env $bin $path_sep $virtual_prompt

                hide virtual_env
                hide bin
                hide path_sep
                hide virtual_prompt

            '
        }


        # deactivate on exit
        {
            condition: { |before, after| (is-active) and (not (has-sub $after $venv)) }
            code: 'overlay remove python-venv'
        }
    ]
})
