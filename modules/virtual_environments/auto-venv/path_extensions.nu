
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
    path: any
] {
    let list = ($path | path expand | path split);

    $list | enumerate | each { |$part| (
        $list | first ($part.index + 1) | path join;
    )}

}

# Returns true if 'subfolder' is found along the path of 'folder', with a given type
export def "path check-sub" [
    folder:    any, 
    subfolder: string,
    --type:    list
] {

    (ls -a $folder
        | where ( 
            ($type == $nothing or $it.type in $type)
            and ($it.name | path basename) == $subfolder
        )
        | length 
    ) > 0;
}

# Walks the path along 'folder', and returns the path of the first subfolder found, or nothing if the subfolder was not found.
# 
# path find-sub '/home/user/projects/code' '.venv';
# > /home/user/projects/.venv
export def "path find-sub" [
    folder:    any,
    subfolder: string,
    --type:    list
] {
    let paths = (path walk $folder);

    let paths = ( $paths 
        | where (
            path check-sub $it $subfolder --type $type
        )
    );

    if ($paths != $nothing) and ($paths | length) > 0 {
        [ ($paths | first), $subfolder ] | path join
    } else {[]}
}
