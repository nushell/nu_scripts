# simple bookmark module

export-env {
  let-env bookmarks = {name: "prev", path: ("~/" | path expand) }
}

# Reset the bookmarks
export def-env reset [] {
  let-env bookmarks = {name: "prev", path: ("~/" | path expand) }
}

# Add a new bookmark with an optional name
export def-env add [pth: path name?: string] {
  if (($pth | path type) == "dir") and ($pth | path exists) {
    let-env bookmarks = ( $env.bookmarks | append {name: $name, path: $pth})
  }
}

def marks [] {
  $env.bookmarks | each {|it| 
    {
    value: $it.path,
    description: $it.name
    }
  }
}

# Goto your bookmark
export def-env goto [pth: path@marks] {
  let prev = $env.PWD
  cd $pth
}

# Go to that directory
export def-env goto_alternative [] {
  let prev = $env.PWD
  $env.bookmarks | input list -f | cd $in.path
  change_prev $prev
}

def-env change_prev [new_path: path] {
  if (($env.bookmarks | length) == 1) {
    let-env bookmarks = ($env.bookmarks | update path $new_path)
  } else {
    let-env bookmarks = ( ($env.bookmarks | where name != "prev" ) | append ($env.bookmarks | where name == "prev" | update path $new_path) )
  }
}