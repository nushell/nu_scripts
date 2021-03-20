# Displays a prompt
def git-status-prompt [] {
  build-string $(ansi reset) $(ansi green) $(whoami | str trim) $(ansi reset) @ $(hostname -s | str trim) : $(ansi green_dimmed) $(prompt-pwd) $(ansi reset) $(git-branch-icon) $(ansi reset) $(char newline) '➤ '
}

# Returns a shortened pwd for use in prompt
def prompt-pwd [] {
  let path = $(pwd | split row "/")
  let home = $(echo $nu.env.HOME | split row "/")

  if $(echo $path | count) > 1 {
    if $(echo $home | reduce { = $it in $path }) {
      let path-without-home = $(echo $path | skip $(echo $home | count))

      if $(echo $path-without-home | wrap | compact | count) > 0 {
        let parent = $(echo $path | skip $(echo $home | count) | drop)

        if $(echo $parent | wrap | compact | count) > 0 {
          let short-part = $(echo $parent | each {
            if $(echo $it | str starts-with ".") {
              echo $(echo $it | str substring [0 2]) "/"
            } {
              echo $(echo $it | str substring [0 1]) "/"
            }
          })
          echo "~/" $short-part $(echo $path | last) | str collect
        } {
          echo "~/" $(echo $path | last) | str collect
        }
      } {
        echo "~"
      }
    } {
      let parent = $(echo $path | drop | str substring [0 1] | each { echo $it "/" })
      echo "/" $parent $(echo $path | last) | str collect
    }
  } {
    pwd
  }
}

# Map of git status codes to ANSI colour codes
def git-prompt-map [] {
  echo a m r c d "??" u |
  rotate counter-clockwise |
  reject Column0 | append $(
    echo $(ansi green) $(ansi yellow_bold) $(ansi cyan) $(ansi blue) $(ansi red) $(ansi red_dimmed) $(ansi red) |
    rotate counter-clockwise |
    reject Column0
  ) | headers
}

# Gets an icon and a colour for a given git status code
def git-prompt-icons [k] {
  let icns = ["✚ " "* " "➜ " "⇒ " "✖ " "? " "! "];

  git-prompt-map |
  pivot status colour | each --numbered {
    let idx = $it.index;

    if $it.item.status == $k {
      build-string $it.item.colour $(echo $icns | nth $idx)
    } {
      = $nothing
    }
  } | compact
}

# Checks git status of current working directory and displays an icon
def git-branch-icon [] {
  do -i {
    let branch = $(do -i { git rev-parse --abbrev-ref HEAD } | str trim)
    
    if $(echo $branch | str length) > 0 {
      let modified = $(do -i { git status --porcelain } | split row "\n" | str trim | split column " " status file);

      if $(echo $modified | get | first | empty?) {
        build-string "|" $(ansi green) $branch $(ansi reset) ":" $(ansi green) '✓' $(ansi reset)
      } {
        let modified2 = $(do -i { git status --porcelain } | split row "\n" | str substring [0 1])
        let branch-colour = $(if $(echo $modified2 | each { = $it in [A M R C D] } | reduce { = $it || $acc }) {
          echo yellow
        } {
          echo red
        })
        build-string "|" $(ansi $branch-colour) $branch $(ansi reset) ":" $(echo $modified | get status | uniq | str downcase | each {
          git-prompt-icons $it
        } | str collect)
      }
    } {
      echo ""
    }
  }
}
