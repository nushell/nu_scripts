def bright_cyan [] {
  each { |it| $"(ansi -e '96m')($it)(ansi reset)" }
}

def bright_green [] {
  each { |it| $"(ansi -e '92m')($it)(ansi reset)" }
}

def bright_red [] {
  each { |it| $"(ansi -e '91m')($it)(ansi reset)" }
}

def bright_yellow [] {
  each { |it| $"(ansi -e '93m')($it)(ansi reset)" }
}

def green [] {
  each { |it| $"(ansi green)($it)(ansi reset)" }
}

def red [] {
  each { |it| $"(ansi red)($it)(ansi reset)" }
}

# Get the current directory with home abbreviated
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

# Get repository status as structured data
export def "git_status" [] {
  mut status = {
    in_git_repo                     : false
    tracking_upstream_branch        : false
    on_named_branch                 : false
    commits_ahead                   : 0
    commits_behind                  : 0
    upstream_exists_on_remote       : false
    has_staging_or_worktree_changes : false
    has_untracked_files             : false
    has_unresolved_merge_conflicts  : false
    staging_added_count             : 0
    staging_modified_count          : 0
    staging_deleted_count           : 0
    untracked_count                 : 0
    worktree_modified_count         : 0
    worktree_deleted_count          : 0
    merge_conflict_count            : 0
  }

  let in_git_repo = (not (do --ignore-errors { git rev-parse --abbrev-ref HEAD } | is-empty))

  if not $in_git_repo {
    return $status
  }

  $status.in_git_repo = true

  let raw_status = (git --no-optional-locks status --porcelain=2 --branch | lines)

  for s in $raw_status {
    let r = ($s | split row ' ')
    match $r.0 {
      '#' => {
        match $r.1 {
          'branch.oid' => {
            $status.commit_hash = ($r.2 | str substring 0..8)
          }
          'branch.head' => {
            $status.branch_name = $r.2
            # not contains '(detached)'
            if ($r | length) == 3 {
              $status.on_named_branch = true
            }
          }
          'branch.upstream' => {
            $status.tracking_upstream_branch = true
          }
          'branch.ab' => {
            $status.upstream_exists_on_remote = true
            $status.commits_ahead = ($r.2 | into int)
            $status.commits_behind = ($r.3 | into int | math abs)
          }
        }
      }
      '1'|'2' => {
        $status.has_staging_or_worktree_changes = true
        match ($r.1 | str substring 0..1) {
          'A' => {
            $status.staging_added_count += 1
          }
          'M'|'R' => {
            $status.staging_modified_count += 1
          }
          'D' => {
            $status.staging_deleted_count += 1
          }
        }
        match ($r.1 | str substring 1..2) {
          'M'|'R' => {
            $status.worktree_modified_count += 1
          }
          'D' => {
            $status.worktree_deleted_count += 1
          }
        }
      }
      '?' => {
        $status.has_untracked_files = true
        $status.untracked_count += 1
      }
      'u' => {
        $status.has_unresolved_merge_conflicts = true
        $status.merge_conflict_count += 1
      }
    }
  }

  return $status
}

# Get repository status as a styled string
export def "git_status styled" [] {
  let status = (git_status)

  if not $status.in_git_repo { return '' }

  let is_local_only = ($status.tracking_upstream_branch != true)

  let upstream_deleted = (
    $status.tracking_upstream_branch and
    $status.upstream_exists_on_remote != true
  )

  let is_up_to_date = (
    $status.upstream_exists_on_remote and
    $status.commits_ahead == 0 and
    $status.commits_behind == 0
  )

  let is_ahead = (
    $status.upstream_exists_on_remote and
    $status.commits_ahead > 0 and
    $status.commits_behind == 0
  )

  let is_behind = (
    $status.upstream_exists_on_remote and
    $status.commits_ahead == 0 and
    $status.commits_behind > 0
  )

  let is_ahead_and_behind = (
    $status.upstream_exists_on_remote and
    $status.commits_ahead > 0 and
    $status.commits_behind > 0
  )

  let branch_name = (if $status.on_named_branch {
      $status.branch_name
    } else {
      ['(' $status.commit_hash '...)'] | str join
    })

  let branch_styled = (if $is_local_only {
      (branch_local_only $branch_name)
    } else if $is_up_to_date {
      (branch_up_to_date $branch_name)
    } else if $is_ahead {
      (branch_ahead $branch_name $status.commits_ahead)
    } else if $is_behind {
      (branch_behind $branch_name $status.commits_behind)
    } else if $is_ahead_and_behind {
      (branch_ahead_and_behind $branch_name $status.commits_ahead $status.commits_behind)
    } else if $upstream_deleted {
      (branch_upstream_deleted $branch_name)
    } else {
      $branch_name
    })

  let has_staging_changes = (
    $status.staging_added_count > 0 or
    $status.staging_modified_count > 0 or
    $status.staging_deleted_count > 0
  )

  let has_worktree_changes = (
    $status.untracked_count > 0 or
    $status.worktree_modified_count > 0 or
    $status.worktree_deleted_count > 0 or
    $status.merge_conflict_count > 0
  )

  let has_merge_conflicts = $status.merge_conflict_count > 0

  let staging_summary = (if $has_staging_changes {
    (staging_changes $status.staging_added_count $status.staging_modified_count $status.staging_deleted_count)
  } else {
    ''
  })

  let worktree_summary = (if $has_worktree_changes {
    (worktree_changes $status.untracked_count $status.worktree_modified_count $status.worktree_deleted_count)
  } else {
    ''
  })

  let merge_conflict_summary = (if $has_merge_conflicts {
    (unresolved_conflicts $status.merge_conflict_count)
  } else {
    ''
  })

  let delimiter = (if ($has_staging_changes and $has_worktree_changes) {
    ('|' | bright_yellow)
  } else {
    ''
  })

  let local_summary = (
    $'($staging_summary) ($delimiter) ($worktree_summary) ($merge_conflict_summary)' | str trim
  )

  let local_indicator = (if $has_worktree_changes {
      ('!' | red)
    } else if $has_staging_changes {
      ('~' | bright_cyan)
    } else {
      ''
    })

  let repo_summary = (
    $'($branch_styled) ($local_summary) ($local_indicator)' | str trim
  )

  let left_bracket = ('|' | bright_yellow)
  let right_bracket = ('' | bright_yellow)

  $'($left_bracket)($repo_summary)($right_bracket)'
}

# Helper commands to encapsulate style and make everything else more readable

def nope [] {
  each { |it| $it == false }
}


def branch_local_only [
  branch: string
] {
  $branch | bright_cyan
}

def branch_upstream_deleted [
  branch: string
] {
  $'($branch)(char failed)' | bright_cyan
}

def branch_up_to_date [
  branch: string
] {
  $'($branch)(char identical_to)' | bright_cyan
}

def branch_ahead [
  branch: string
  ahead: int
] {
  $'($branch)(char branch_ahead)($ahead)' | bright_green
}

def branch_behind [
  branch: string
  behind: int
] {
  $'($branch)(char branch_behind)($behind)' | bright_red
}

def branch_ahead_and_behind [
  branch: string
  ahead: int
  behind: int
] {
  $'($branch)(char branch_behind)($behind)(char branch_ahead)($ahead)' | bright_yellow
}

def staging_changes [
  added: int
  modified: int
  deleted: int
] {
  $'+($added)~($modified)-($deleted)' | green
}

def worktree_changes [
  added: int
  modified: int
  deleted: int
] {
  $'+($added)~($modified)-($deleted)' | red
}

def unresolved_conflicts [
  conflicts: int
] {
  $'!($conflicts)' | red
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
        let left_bracket = ('' | bright_yellow)
        let right_bracket = ('|' | bright_yellow)
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
    $"($ucl)($n)(ansi reset)('|' | bright_yellow)"
}


def right_prompt [] {
    { ||
        let time_segment = (date now | date format '%y-%m-%d %H:%M:%S')
        $"(proxy prompt)(kube prompt)(host_abbr)(ansi purple_bold)($time_segment)"
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
        let time_segment = (date now | date format '%m/%d/%Y %r')
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
