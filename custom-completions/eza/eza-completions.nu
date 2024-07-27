def "nu-complete eza when" [] {
    [[value]; ["always"] ["auto"] ["never"]]
}

def "nu-complete eza sort-field" [] {
    # name, Name, size, extension, Extension, modified, changed, accessed, created, inode, type, none
    [[value]; ["name"] ["Name"] ["extension"] ["Extension"] ["size"] ["type"] ["modified"] ["accessed"] ["created"] ["inode"] ["none"] ["date"] ["time"] ["old"] ["new"]]
}

def "nu-complete eza time-field" [] {
    # modified, accessed, created, changed
    [[value]; ["modified"] ["accessed"] ["created"] ["changed"]]
}

def "nu-complete eza time-style" [] {
    [[value]; ["default"] ["iso"] ["long-iso"] ["full-iso"] ["relative"] ["+<FORMAT>"]]
}

def "nu-complete eza color-scale" [] {
    [[value]; ["all"] ["age"] ["size"]]
}

def "nu-complete eza color-scale-mode" [] {
    [[value]; ["fixed"] ["gradient"]]
}

# A modern, maintained replacement for ls
export extern "eza" [
    path?: path                                              # folder to list
    --help                                                  # show list of command-line options
    --version(-v)                                           # show version of eza
    --oneline(-1)                                           # display one entry per line
    --long(-l)                                              # display extended file metadata as a table
    --grid(-G)                                              # display entries as a grid (default)
    --across(-x)                                            # sort the grid across, rather than downwards
    --recurse(-R)                                           # recurse into directories
    --tree(-T)                                              # recurse into directories as a tree
    --dereference(-X)                                       # dereference symbolic links when displaying information
    --classify(-F): string@"nu-complete eza when"="auto"    # display type indicator by file names
    --colour: string@"nu-complete eza when"="auto"          # when to use terminal colours
    --color: string@"nu-complete eza when"="auto"           # when to use terminal colors
    --colour-scale: string@"nu-complete eza color-scale"="all"                                          # highlight levels of 'field' distinctly
    --color-scale: string@"nu-complete eza color-scale"="all"                                           # highlight levels of 'field' distinctly
    --colour-scale-mode: string@"nu-complete eza color-scale-mode"                                      # use gradient or fixed colors in --color-scale
    --color-scale-mode: string@"nu-complete eza color-scale-mode"                                      # use gradient or fixed colors in --color-scale
    --icons: string@"nu-complete eza when"="auto"           # when to display icons
    --no-quotes                                             # don't quote file names with spaces
    --hyperlink                                             # display entries as hyperlinks
    --absolute                                              # display entries with their absolute path (on, follow, off)
    --width(-w): int                                        # set screen width in columns
    --all(-a)                                               # show hidden and 'dot' files. Use this twice to also show the '.' and '..' directories
    --almost-all(-A)                                        # equivalent to --all; included for compatibility with `ls -A`
    --list-dirs(-d)                                         # list directories as files; don't list their contents
    --level(-L): int                                        # limit the depth of recursion
    --reverse(-r)                                           # reverse the sort order
    --sort(-s): string@"nu-complete eza sort-field"         # which field to sort by
    --group-directories-first                               # list directories before other files
    --only-dirs(-D)                                         # list only directories
    --only-files(-f)                                        # list only files
    --ignore-glob(-I): string                               # glob patterns (pipe-separated) of files to ignore
    --git-ignore                                            # ignore files mentioned in '.gitignore'
    --binary(-b)                                            # list file sizes with binary prefixes
    --bytes(-B)                                             # list file sizes in bytes, without any prefixes
    --group(-g)                                             # list each file's group
    --smart-group                                           # only show group if it has a different name from owner
    --header(-h)                                            # add a header row to each column
    --links(-H)                                             # list each file's number of hard links
    --inode(-i)                                             # list each file's inode number
    --modified(-m)                                          # use the modified timestamp field
    --mounts(-M)                                            # show mount details (Linux and Mac only)
    --numeric(-n)                                           # list numeric user and group IDs
    --flags(-O)                                             # list file flags (Mac, BSD, and Windows only)
    --blocksize(-S)                                         # show size of allocated file system blocks
    --time(-t): string@"nu-complete eza time-field"         # which timestamp field to list
    --accessed(-u)                                          # use the accessed timestamp field
    --created(-U)                                           # use the created timestamp field
    --changed                                               # use the changed timestamp field
    --time-style: string@"nu-complete eza time-style"       # how to format timestamps (also a custom style '+<FORMAT>' like '+%Y-%m-%d %H:%M')
    --total-size                                            # show the size of a directory as the size of all files and directories inside (unix only)
    --no-permissions                                        # suppress the permissions field
    --octal-permissions(-o)                                 # list each file's permission in octal format
    --no-filesize                                           # suppress the filesize field
    --no-user                                               # suppress the user field
    --no-time                                               # suppress the time field
    --stdin                                                 # read file names from stdin
    --git                                                   # list each file's Git status, if tracked or ignored
    --no-git                                                # suppress Git status
    --git-repos                                             # list root of git-tree status
    --extended(-@)                                          # list each file's extended attributes and sizes
    --context(-Z)                                           # list each file's security context
]