
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