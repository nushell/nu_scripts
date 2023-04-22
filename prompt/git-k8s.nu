def _sep [
    direction?: string
    color?: string = 'light_yellow'
    fg?: string
] {
    let s = $in
    if ($env.NU_POWERLINE? | is-empty) {
        return $"($s)(ansi light_yellow)|"
    }
    let fg = if ($fg | is-empty) { $color } else { $fg }
    match $direction {
        '>' => { $'(ansi $"bg_($fg)")($s)(ansi $fg)(ansi $'bg_($color)')(char nf_left_segment)' }
        '>>' => { $'(ansi $"bg_($fg)")($s)(ansi reset)(ansi $fg)(char nf_left_segment)' }
        '<' => { $'($s)(ansi $color)(char nf_right_segment)(ansi $"bg_($color)")' }
        _ => { '|' }
    }
}

### pwd
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

export def "pwd_abbr" [sep: string = '>'] {
  let pwd = ($env.PWD)

  let to_home = (related $pwd $nu.home-path)

  let cwd = if $to_home.related == '=' {
      "~"
  } else if $to_home.related == '>' {
      $pwd
  } else {
      $'~(char separator)($to_home.path)'
  }

  mut dir_comp = ($cwd | split row (char separator))

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
    $'(ansi xterm_gold3b)'
  } else {
    $'(ansi light_green_bold)'
  }
  $"($style)($dir_comp | str join (char separator) | _sep $sep $env.NU_POWERLINE_THEME.git $env.NU_POWERLINE_THEME.path)"
}

### git
export def git_status [] {
  let status = (do -i { gstat })
  if not ($status | is-empty) {
      return $status
  }

  let raw_status = (do -i { git --no-optional-locks status --porcelain=2 --branch | lines })

  mut status = {
    idx_added_staged    : 0
    idx_modified_staged : 0
    idx_deleted_staged  : 0
    idx_renamed         : 0
    idx_type_changed    : 0
    wt_untracked        : 0
    wt_modified         : 0
    wt_deleted          : 0
    wt_type_changed     : 0
    wt_renamed          : 0
    ignored             : 0
    conflicts           : 0
    ahead               : 0
    behind              : 0
    stashes             : 0
    repo_name           : no_repository
    tag                 : no_tag
    branch              : no_branch
    remote              : ''
  }

  if ($raw_status | is-empty) { return $status }

  for s in $raw_status {
    let r = ($s | split row ' ')
    match $r.0 {
      '#' => {
        match ($r.1 | str substring 7..) {
          'oid' => {
            $status.commit_hash = ($r.2 | str substring 0..8)
          }
          'head' => {
            $status.branch = $r.2
          }
          'upstream' => {
            $status.remote = $r.2
          }
          'ab' => {
            $status.ahead = ($r.2 | into int)
            $status.behind = ($r.3 | into int | math abs)
          }
        }
      }
      '1'|'2' => {
        match ($r.1 | str substring 0..1) {
          'A' => {
            $status.idx_added_staged += 1
          }
          'M' => {
            $status.idx_modified_staged += 1
          }
          'R' => {
            $status.idx_renamed += 1
          }
          'D' => {
            $status.idx_deleted_staged += 1
          }
          'T' => {
            $status.idx_type_changed += 1
          }
        }
        match ($r.1 | str substring 1..2) {
          'M' => {
            $status.wt_modified += 1
          }
          'R' => {
            $status.wt_renamed += 1
          }
          'D' => {
            $status.wt_deleted += 1
          }
          'T' => {
            $status.wt_type_changed += 1
          }
        }
      }
      '?' => {
        $status.wt_untracked += 1
      }
      'u' => {
        $status.conflicts += 1
      }
    }
  }
  return $status
}

export def "git_status styled" [] {
  let status = (git_status)

  if $status.branch == 'no_branch' { return '' }

  let branch = if ($status.remote | is-empty) {
    $'(ansi red)($status.branch)'
  } else {
    $'(ansi blue)($status.branch)'
  }

  let summary = ($env.NU_PROMPT_GIT_FORMATTER
    | filter {|x| ($status | get $x.0) > 0 }
    | each {|x| $"(ansi $'light_($x.2)_dimmed')($x.1)($status | get $x.0)" }
    | str join
    )

  $'($branch)($summary)' | _sep '>>' $env.NU_POWERLINE_THEME.git
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
        let c = if $ctx.AUTHINFO == $ctx.CLUSTER {
                    $ctx.CLUSTER
                } else {
                    $"($ctx.AUTHINFO)@($ctx.CLUSTER)"
                }
        let p = $"(ansi red)($c)(ansi yellow)/(ansi cyan_bold)($ctx.NAMESPACE)"
        $"($p)" | str trim | _sep '<' $env.NU_POWERLINE_THEME.kube
    }
}

### proxy
export def "proxy prompt" [] {
    if not (($env.https_proxy? | is-empty) and ($env.http_proxy? | is-empty)) {
        '' | _sep '<' $env.NU_POWERLINE_THEME.proxy
    } else {
        ""
    }
}

### host
def host_abbr [] {
    let n = (hostname | str trim)
    let ucl = if (is-admin) {
            (ansi yellow)
        } else {
            (ansi dark_gray)
        }
    $"($ucl)($n | _sep '<' $env.NU_POWERLINE_THEME.host)"
}


### prompt
def right_prompt [] {
    { ||
        let time_segment = (date now | date format '%y-%m-%d/%H:%M:%S')
        $"(proxy prompt)(host_abbr)(kube prompt)(ansi purple_bold)($time_segment)"
    }
}

def left_prompt [] {
    { ||
        let gs = (git_status styled)
        if ($gs | is-empty) {
            $"(pwd_abbr '>>')"
        } else {
            $"(pwd_abbr)($gs)"
        }
    }
}

def up_prompt [] {
    { ||
        let time_segment = (date now | date format '%y-%m-%d/%H:%M:%S')
        let gs = (git_status styled)
        let left = if ($gs | is-empty) {
            $"(host_abbr)(pwd_abbr '>>')"
        } else {
            $"(host_abbr)(pwd_abbr)($gs)"
        }
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
    let-env NU_PROMPT_GIT_FORMATTER = [
      [behind              (char branch_behind) yellow]
      [ahead               (char branch_ahead) yellow]
      [stashes             = blue]
      [conflicts           ! red]
      [ignored             _ purple]
      [idx_added_staged    + green]
      [idx_modified_staged ~ green]
      [idx_deleted_staged  - green]
      [idx_renamed         % green]
      [idx_type_changed    * green]
      [wt_untracked        + red]
      [wt_modified         ~ red]
      [wt_deleted          - red]
      [wt_renamed          % red]
      [wt_type_changed     * red]
    ]

    let-env NU_POWERLINE_THEME = {
        path  : 'dark_gray'
        git   : 'white'
        host  : 'dark_gray'
        kube  : 'yellow'
        time  : 'dark_gray'
        proxy : 'blue'
    }

    let-env PROMPT_COMMAND = (left_prompt)
    let-env PROMPT_COMMAND_RIGHT = (right_prompt)
    let-env PROMPT_INDICATOR = {|| if ($env.NU_POWERLINE? | is-empty) { $"> " } else { $'' } }
    let-env PROMPT_INDICATOR_VI_INSERT = {|| ": " }
    let-env PROMPT_INDICATOR_VI_NORMAL = {|| "> " }
    let-env PROMPT_MULTILINE_INDICATOR = {|| "::: " }
}
