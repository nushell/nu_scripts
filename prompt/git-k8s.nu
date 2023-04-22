def related [sub dir] {
    if $sub == $dir {
        return { related: '=', path: '' }
    }
    let suffix = (do --ignore-errors { $sub | path relative-to $dir })
    if ($suffix | is-empty) {
        return { related: '>', path: '' }
    } else {
        return { related: '<', path: $suffix}
    }
}

export def "pwd_abbr" [] {
  let pwd = ($env.PWD)

  let to_home = (related $pwd $nu.home-path)

  let cwd = if $to_home.related == '=' {
      "~"
  } else if $to_home.related == '>' {
      $pwd
  } else {
      $'~(char separator)($to_home.path)'
  }

  mut dir_comp = ($cwd
    | str replace $nu.home-path '~'
    | split row (char separator)
    )

  if ($dir_comp | length) > 5 {
    let first = ($dir_comp | first)
    let last = ($dir_comp | last)
    let body = (
      $dir_comp
      |range 1..-2
      |each {|x| $x | str substring ..2 }
      )
    $dir_comp = ([$first $body $last] | flatten)
  }

  let style = if $to_home.related == '>' {
    (ansi xterm_gold3b)
  } else {
    ''
  }
  $"($style)($dir_comp | str join (char separator))"
}

def light_yellow [] {
  each { |it| $"(ansi light_yellow)($it)(ansi reset)" }
}

export def "git_status styled" [] {
  let status = (gstat)

  if $status.repo_name == 'no_repository' { return '' }

  let branch = $'(ansi blue)($status.branch)(ansi reset)'
  let fmt = [
    [behind (char branch_behind) green]
    [ahead (char branch_ahead) green]
    [idx_added_staged + yellow]
    [idx_modified_staged ~ yellow]
    [idx_deleted_staged - yellow]
    [idx_renamed R yellow]
    [idx_type_changed T yellow]
    [wt_untracked + red]
    [wt_modified ~ red]
    [wt_deleted - red]
    [wt_renamed R red]
    [wt_type_changed T red]
    [ignored i grey]
    [conflicts ! red]
    [stashes = green]
  ]

  let summary = ($fmt
    | filter {|x| ($status | get $x.0) > 0 }
    | each {|x| $"(ansi $x.2)($x.1)($status | get $x.0)(ansi reset)" }
    | str join
    )

  $'(ansi yellow)|(ansi reset)($branch)($summary)'
}

### kubernetes
def "kube ctx" [] {
    do -i {
       kubectl config get-contexts
       | from ssv -a
       | where CURRENT == '*'
       | get 0
    }
}

export def "kube prompt" [] {
    let ctx = (kube ctx)
    if ($ctx | is-empty) {
        ""
    } else {
        let left_bracket = ('' | light_yellow)
        let right_bracket = ('|' | light_yellow)
        let c = if $ctx.AUTHINFO == $ctx.CLUSTER {
                    $ctx.CLUSTER
                } else {
                    $"($ctx.AUTHINFO)@($ctx.CLUSTER)"
                }
        let p = $"(ansi red)($c)(ansi yellow)/(ansi cyan_bold)($ctx.NAMESPACE)"
        $"($left_bracket)($p)($right_bracket)" | str trim
    }
}

### proxy
export def "proxy prompt" [] {
    if not ($env.https_proxy? | is-empty) {
        $"(ansi blue)|"
    } else {
        ""
    }
}

def host_abbr [] {
    let n = (hostname | str trim)
    let ucl = if (is-admin) {
            (ansi yellow)
        } else {
            (ansi dark_gray)
        }
    $"($ucl)($n)(ansi reset)('|' | light_yellow)"
}


def right_prompt [] {
    { ||
        let time_segment = (date now | date format '%y-%m-%d/%H:%M:%S')
        $"(proxy prompt)(host_abbr)(kube prompt)(ansi purple_bold)($time_segment)"
    }
}

# An opinionated Git prompt for Nushell, styled after posh-git
def left_prompt [] {
    { ||
        $"(pwd_abbr)(git_status styled)"
    }
}

def up_prompt [] {
    { ||
        let time_segment = (date now | date format '%y-%m-%d/%H:%M:%S')
        let left = $"(host_abbr)(pwd_abbr)(gsdfit_status styled)"
        let right = $"(proxy prompt)(kube prompt)(ansi purple_bold)($time_segment)"
        # TODO: length of unicode char is 3
        let fl = ((term size).columns
            - ($left  | ansi strip | str length)
            - ($right | ansi strip | str length)
            )
        $"($left)(ansi xterm_grey)('' | fill -c '-' -w $fl)(ansi reset)($right)"
    }
}

export-env {
    let-env PROMPT_COMMAND = (left_prompt)
    let-env PROMPT_COMMAND_RIGHT = (right_prompt)
    let-env PROMPT_INDICATOR = {|| $"> " }
    let-env PROMPT_INDICATOR_VI_INSERT = {|| ": " }
    let-env PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
    let-env PROMPT_MULTILINE_INDICATOR = {|| "::: " }
}
