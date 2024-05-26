# Displays a prompt
export def git-status-prompt [] {
  let not_windows = ($nu.os-info.name !~ "windows")
  $"(ansi reset)(ansi green)(if $not_windows {
      $env.USER
  } else {
      $env.USERNAME
  }
  )(ansi reset)@(hostname | str trim):(ansi green_dimmed)(prompt-pwd)(ansi reset)(git-branch-icon)(ansi reset)(char newline)(char prompt) "
}

# Returns a shortened pwd for use in prompt
def prompt-pwd [] {
  let not_windows = ($nu.os-info.name !~ "windows")
  let path = (pwd | if $not_windows { split row "/" } else { split row '\' })
  let home = (if $not_windows {
      ($env.HOME | split row "/")
  } else {
      (echo [$env.HOMEDRIVE $env.HOMEPATH] | path join | split row '\')
  }
  )

  if ($path | length) > 1 {
      if ($home | all {|it| $it in $path }) {
          let path_without_home = ($path | skip ($home | length))
          if ($path_without_home | wrap path | compact | length) > 0 {
            let parent = ($path | skip ($home | length) | drop)
            if ($parent | wrap parent | compact | length) > 0 {
                let short_part = ($parent | each { |part|
                                  if ($part | str starts-with ".") {
                                      $"($part | str substring [0 2])/"
                                  } else {
                                      $"($part | str substring [0 1])/"
                                  }
                })
                $"~/( | str join)($path | last)"
            } else {
                $"~/($path | last)"
            }
        } else {
            "~"
          }
      } else {
          let parent = (echo $path | drop | str substring [0 1] | each {|it| echo $it "/" })
          $"/($parent)($path | last)"
      }
  } else {
      pwd
  }
  }

# Map of git status codes to ANSI colour codes
def git-prompt-map [] {
  echo a m r c d "??" u |
  rotate --ccw |
  reject column0 | append (
    echo (ansi green) (ansi yellow_bold) (ansi cyan) (ansi blue) (ansi red) (ansi red_dimmed) (ansi red) |
    rotate --ccw |
    reject column0
  ) | headers
}

# Gets an icon and a colour for a given git status code
def git-prompt-icons [k] {
  let icns = ["✚ " "* " "➜ " "⇒ " "✖ " "? " "! "];

  git-prompt-map |
  transpose status colour | enumerate | each { |icon|
        let idx = $icon.index;
        if $icon.item.status == $k {
            $"($icon.item.colour)($icns | get $idx)"
        }
  } | compact
}

# Checks git status of current working directory and displays an icon
def git-branch-icon [] {
  do -i {
    let branch = (do -i { git rev-parse --abbrev-ref HEAD } | str trim)

    if ($branch | str length) > 0 {
        let modified = (do -i { git status --porcelain } | split row "\n" | str trim | split column " " status file);
        if ($modified | get 0 | first | is-empty) {
            $"|(ansi green)($branch)(ansi reset):(ansi green)✓(ansi reset)"
        } else {
            let modified2 = (do -i { git status --porcelain } | split row "\n" | str substring [0 1])
            let branch_colour = (if (echo $modified2 | each {|it| $it in [A M R C D] } | reduce {|it acc| $it or $acc }) {
                    "yellow"
                } else {
                    "red"
                }
            )
            $"|(ansi $branch_colour)($branch)(ansi reset):($modified | get status | uniq | str downcase | each {|it| git-prompt-icons $it })" | str join
        }
    }
  }
}
