# simple bookmark module

# List all bookmarked paths
export def list [] {
  let bm_path = (get_path)

  if (not ($bm_path | path exists))  {
    [{name: "prev", path: ("~/" | path expand) }] | save $bm_path
  }
    open ($bm_path)
}

def get_path [] {
  $env.XDG_DATA_HOME | 
  path join "bookmarks.nuon"
}

# Reset the bookmarks
export def reset [] {
  list |
  where name == "prev" |
  save -f (get_path)
}

# Add a new bookmark with an optional name
export def add [
  pth: path       # Path to bookmark to.
  name?: string   # Optional name to give to it
                    ] {
  if (($pth | path type) == "dir") and ($pth | path exists) {
    list | 
    append {name: $name, path: $pth} |
    save -f (get_path)
  }
}

# remove one or more bookmarks
export def remove [] {
  let rm_these = (
    list | 
    where name != "prev" |
    input list -m
  )

  list | where {|it|
    not $it in $rm_these
  } |
  print
  
}

def marks [] {
  list | each {|it| 
    {
    value: $it.path,
    description: $it.name
    }
  }
}

# Goto your bookmark
export def-env goto [
  pth: path@marks # Path to "go to"
  ] {
  let prev = $env.PWD
  cd $pth
}

# Experimental use of `input` instead of completion
export def-env goto_alternative [] {
  let prev = $env.PWD
  list | input list -f | cd $in.path
  change_prev $prev
}

def change_prev [new_path: path] {
  if ((list | length) == 1) {
    list | 
    update path $new_path | 
    save -f (get_path)
  } else {
    ( list | 
      where name != "prev" 
    ) |
    append (list | where name == "prev" | update path $new_path ) |
    save -f get_path
  }
}
