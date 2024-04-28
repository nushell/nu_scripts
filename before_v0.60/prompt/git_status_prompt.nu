# Displays a prompt
def git-status-prompt [] {
  let not_windows = ($nu.path | first | into string | str contains '/')
  $"(ansi reset)(ansi green)(if $not_windows {$nu.env.USER} {$nu.env.USERNAME})(ansi reset)@(hostname | str trim):(ansi green_dimmed)(prompt-pwd)(ansi reset)(git-branch-icon)(ansi reset)(char newline)(char prompt) "
}

# Returns a shortened pwd for use in prompt
def prompt-pwd [] {
  let not_windows = ($nu.path | first | into string | str contains '/')
  let path = (pwd | if $not_windows { split row "/" } { split row "\" })
  let home = (if $not_windows { ($nu.env.HOME | split row "/") } { (echo [$nu.env.HOMEDRIVE $nu.env.HOMEPATH] | path join | split row "\") })

  if ($path | length) > 1 {
    if ($home | reduce { $it in $path }) {
      let path-without-home = ($path | skip ($home | length))

      if ($path-without-home | wrap | compact | length) > 0 {
        let parent = ($path | skip ($home | length) | drop)

        if ($parent | wrap | compact | length) > 0 {
          let short-part = ($parent | each { |part|
            if ($part | str starts-with ".") {
              $"($part | str substring [0 2])/"
            } {
              $"($part | str substring [0 1])/"
            }
          })
          $"~/($short-part | str collect)($path | last)"
        } {
          $"~/($path | last)"
        }
      } {
        "~"
      }
    } {
      let parent = (echo $path | drop | str substring [0 1] | each { echo $it "/" })
      $"/($parent)($path | last)"
    }
  } {
    pwd
  }
}

# Map of git status codes to ANSI colour codes
def git-prompt-map [] {
  echo a m r c d "??" u |
  rotate counter-clockwise |
  reject Column0 | append (
    echo (ansi green) (ansi yellow_bold) (ansi cyan) (ansi blue) (ansi red) (ansi red_dimmed) (ansi red) |
    rotate counter-clockwise |
    reject Column0
  ) | headers
}

# Gets an icon and a colour for a given git status code
def git-prompt-icons [k] {
  let icns = ["✚ " "* " "➜ " "⇒ " "✖ " "? " "! "];

  git-prompt-map |
  pivot status colour | each --numbered { |icon|
    let idx = $icon.index;

    if $icon.item.status == $k {
      $"($icon.item.colour)($icns | nth $idx)"
    } {
      = $nothing
    }
  } | compact
}

# Checks git status of current working directory and displays an icon
def git-branch-icon [] {
  do -i {
    let branch = (do -i { git rev-parse --abbrev-ref HEAD } | str trim)

    if ($branch | str length) > 0 {
      let modified = (do -i { git status --porcelain } | split row "\n" | str trim | split column " " status file);

      if ($modified | get | first | empty?) {
        $"|(ansi green)($branch)(ansi reset):(ansi green)✓(ansi reset)"
      } {
        let modified2 = (do -i { git status --porcelain } | split row "\n" | str substring [0 1])
        let branch-colour = (if (echo $modified2 | each { $it in [A M R C D] } | reduce { $it or $acc }) {
          "yellow"
        } {
          "red"
        })
        $"|(ansi $branch-colour)($branch)(ansi reset):($modified | get status | uniq | str downcase | each { git-prompt-icons $it })" | str collect
      }
    } {
      ""
    }
  }
}
