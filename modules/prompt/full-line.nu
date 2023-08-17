# Build a full-line prompt with widgets for: 
#   current working directory; git status; and current position in remembered working directories (`std dirs`, a.k.a. `shells`)
# 
# to use:
# 1. copy this file to `($nu.default-config-dir | path add 'scripts')` (Or someplace on your $env.NU_LIB_DIRS path, defined in env.nu)
# 2. cut `$env.PROMPT_COMMAND` and `PROMPT_OMMAND_RIGHT' from your env.nu.  
#    These will depend on `use full-line`, which can not be done in env.nu.
#    You can leave the `PROMPT-*INDICATOR*` statements in env.nu or 
#    consolidate all prompt stuff in config.nu.
# 3. Add new prompt setup stuff somewhere in config.nu:
#   ```
#   use prompt-builder.nu
#   $env.PROMPT_COMMAND = {|| prompt-builder }
#   $env.PROMPT_COMMAND_RIGHT = ""
#   ```
#
# credit panache-git for the git status widget.  

use std dirs

# build the prompt from segments, looks like:
#
# ^------------- <workingDirectory> ------ <gitRepoStatus> --- <dirs>$
#
# or, if no git repo current directory
#
# ^-------------------------- <workingDirectory> ------------- <dirs>$
export def main [
    --pad_char (-p) = '_' # character to fill with
] {
    let left_segment = $" (dir_string) "
    let left_segment_length = ($left_segment | ansi strip | str length -g)
    
    let dirs_segment = $"|(dirs show | each {|it| if $it.active {'V'} else {'.'}} | str join '')|"
    mut git_segment = $" (repo-styled) "
    if ($git_segment | str length -g) <= 2 {$git_segment = ''}
    let right_segment = $"($git_segment)($pad_char * 3) ($dirs_segment)"
    let right_segment_length = ($right_segment | ansi strip | str length -g)

    let term_width = ((term size) | get columns)
    mut left_half_length = (($term_width + $left_segment_length) / 2 | into int)
    if (($left_half_length + $right_segment_length) > $term_width) {
      $left_half_length = $left_segment_length # adapt to narrow console
    } 
    let right_half_length = ($term_width - $left_half_length) # guarantee sum === term_width
    
    [(ansi reset),
        ($left_segment | fill --character $pad_char --width $left_half_length --alignment right),
        ($right_segment | fill --character $pad_char --width $right_half_length --alignment right),
        "\n"
    ] | str join ''
}

# build current working directory segment
def dir_string [] {

    mut home = ""
    try {
        if $nu.os-info.name == "windows" {
            $home = $env.USERPROFILE
        } else {
            $home = $env.HOME
        }
    }

    let dir = ([
        ($env.PWD | str substring 0..($home | str length) | str replace $home "~"),
        ($env.PWD | str substring ($home | str length)..)
    ] | str join)

    let path_color = (if (is-admin) { ansi red_bold } else { ansi green_bold })
    let separator_color = (if (is-admin) { ansi light_red_bold } else { ansi light_green_bold })
    $"($path_color)($dir)(ansi reset)" | str replace --all (char path_sep) $"($separator_color)/($path_color)"
}

# Following code cheerfully ~~stolen~~ adapted from: 
# https://github.com/nushell/nu_scripts/blob/ab0d3aaad015ca8ac2c2004d728cc8bac32cda1b/modules/prompt/panache-git.nu

# Get repository status as structured data
def repo-structured [] {
  let in_git_repo = (do --ignore-errors { git rev-parse --abbrev-ref HEAD } | is-empty | nope)

  let status = (if $in_git_repo {
    git --no-optional-locks status --porcelain=2 --branch | lines
  } else {
    []
  })

  let on_named_branch = (if $in_git_repo {
    $status
    | where ($it | str starts-with '# branch.head')
    | first
    | str contains '(detached)'
    | nope
  } else {
    false
  })

  let branch_name = (if $on_named_branch {
    $status
    | where ($it | str starts-with '# branch.head')
    | split column ' ' col1 col2 branch
    | get branch
    | first
  } else {
    ''
  })

  let commit_hash = (if $in_git_repo {
    $status
    | where ($it | str starts-with '# branch.oid')
    | split column ' ' col1 col2 full_hash
    | get full_hash
    | first
    | str substring 0..7
  } else {
    ''
  })

  let tracking_upstream_branch = (if $in_git_repo {
    $status
    | where ($it | str starts-with '# branch.upstream')
    | str join
    | is-empty
    | nope
  } else {
    false
  })

  let upstream_exists_on_remote = (if $in_git_repo {
    $status
    | where ($it | str starts-with '# branch.ab')
    | str join
    | is-empty
    | nope
  } else {
    false
  })

  let ahead_behind_table = (if $upstream_exists_on_remote {
    $status
    | where ($it | str starts-with '# branch.ab')
    | split column ' ' col1 col2 ahead behind
  } else {
    [[]]
  })

  let commits_ahead = (if $upstream_exists_on_remote {
    $ahead_behind_table
    | get ahead
    | first
    | into int
  } else {
    0
  })

  let commits_behind = (if $upstream_exists_on_remote {
    $ahead_behind_table
    | get behind
    | first
    | into int
    | math abs
  } else {
    0
  })

  let has_staging_or_worktree_changes = (if $in_git_repo {
    $status
    | where ($it | str starts-with '1') or ($it | str starts-with '2')
    | str join
    | is-empty
    | nope
  } else {
    false
  })

  let has_untracked_files = (if $in_git_repo {
    $status
    | where ($it | str starts-with '?')
    | str join
    | is-empty
    | nope
  } else {
    false
  })

  let has_unresolved_merge_conflicts = (if $in_git_repo {
    $status
    | where ($it | str starts-with 'u')
    | str join
    | is-empty
    | nope
  } else {
    false
  })

  let staging_worktree_table = (if $has_staging_or_worktree_changes {
    $status
    | where ($it | str starts-with '1') or ($it | str starts-with '2')
    | split column ' '
    | get column2
    | split column '' staging worktree --collapse-empty
  } else {
    [[]]
  })

  let staging_added_count = (if $has_staging_or_worktree_changes {
    $staging_worktree_table
    | where staging == 'A'
    | length
  } else {
    0
  })

  let staging_modified_count = (if $has_staging_or_worktree_changes {
    $staging_worktree_table
    | where staging in ['M', 'R']
    | length
  } else {
    0
  })

  let staging_deleted_count = (if $has_staging_or_worktree_changes {
    $staging_worktree_table
    | where staging == 'D'
    | length
  } else {
    0
  })

  let untracked_count = (if $has_untracked_files {
    $status
    | where ($it | str starts-with '?')
    | length
  } else {
    0
  })

  let worktree_modified_count = (if $has_staging_or_worktree_changes {
    $staging_worktree_table
    | where worktree in ['M', 'R']
    | length
  } else {
    0
  })

  let worktree_deleted_count = (if $has_staging_or_worktree_changes {
    $staging_worktree_table
    | where worktree == 'D'
    | length
  } else {
    0
  })

  let merge_conflict_count = (if $has_unresolved_merge_conflicts {
    $status
    | where ($it | str starts-with 'u')
    | length
  } else {
    0
  })

  {
    in_git_repo: $in_git_repo,
    on_named_branch: $on_named_branch,
    branch_name: $branch_name,
    commit_hash: $commit_hash,
    tracking_upstream_branch: $tracking_upstream_branch,
    upstream_exists_on_remote: $upstream_exists_on_remote,
    commits_ahead: $commits_ahead,
    commits_behind: $commits_behind,
    staging_added_count: $staging_added_count,
    staging_modified_count: $staging_modified_count,
    staging_deleted_count: $staging_deleted_count,
    untracked_count: $untracked_count,
    worktree_modified_count: $worktree_modified_count,
    worktree_deleted_count: $worktree_deleted_count,
    merge_conflict_count: $merge_conflict_count
  }
}

# Get repository status as a styled string
def repo-styled [] {
  let status = (repo-structured)

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

  let branch_name = (if $status.in_git_repo {
    (if $status.on_named_branch {
      $status.branch_name
    } else {
      ['(' $status.commit_hash '...)'] | str join
    })
  } else {
    ''
  })

  let branch_styled = (if $status.in_git_repo {
    (if $is_local_only {
      (branch-local-only $branch_name)
    } else if $is_up_to_date {
      (branch-up-to-date $branch_name)
    } else if $is_ahead {
      (branch-ahead $branch_name $status.commits_ahead)
    } else if $is_behind {
      (branch-behind $branch_name $status.commits_behind)
    } else if $is_ahead_and_behind {
      (branch-ahead-and-behind $branch_name $status.commits_ahead $status.commits_behind)
    } else if $upstream_deleted {
      (branch-upstream-deleted $branch_name)
    } else {
      $branch_name
    })
  } else {
    ''
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
    (staging-changes $status.staging_added_count $status.staging_modified_count $status.staging_deleted_count)
  } else {
    ''
  })

  let worktree_summary = (if $has_worktree_changes {
    (worktree-changes $status.untracked_count $status.worktree_modified_count $status.worktree_deleted_count)
  } else {
    ''
  })

  let merge_conflict_summary = (if $has_merge_conflicts {
    (unresolved-conflicts $status.merge_conflict_count)
  } else {
    ''
  })

  let delimiter = (if ($has_staging_changes and $has_worktree_changes) {
    ('|' | bright-yellow)
  } else {
    ''
  })

  let local_summary = (
    $'($staging_summary) ($delimiter) ($worktree_summary) ($merge_conflict_summary)' | str trim
  )

  let local_indicator = (if $status.in_git_repo {
    (if $has_worktree_changes {
      ('!' | red)
    } else if $has_staging_changes {
      ('~' | bright-cyan)
    } else {
      ''
    })
  } else {
    ''
  })

  let repo_summary = (
    $'($branch_styled) ($local_summary) ($local_indicator)' | str trim
  )

  let left_bracket = ('[' | bright-yellow)
  let right_bracket = (']' | bright-yellow)

  (if $status.in_git_repo {
    $'($left_bracket)($repo_summary)($right_bracket)'
  } else {
    ''
  })
}

# Helper commands to encapsulate style and make everything else more readable

def nope [] {
  each { |it| $it == false }
}

def bright-cyan [] {
  each { |it| $"(ansi -e '96m')($it)(ansi reset)" }
}

def bright-green [] {
  each { |it| $"(ansi -e '92m')($it)(ansi reset)" }
}

def bright-red [] {
  each { |it| $"(ansi -e '91m')($it)(ansi reset)" }
}

def bright-yellow [] {
  each { |it| $"(ansi -e '93m')($it)(ansi reset)" }
}

def green [] {
  each { |it| $"(ansi green)($it)(ansi reset)" }
}

def red [] {
  each { |it| $"(ansi red)($it)(ansi reset)" }
}

def branch-local-only [
  branch: string
] {
  $branch | bright-cyan
}

def branch-upstream-deleted [
  branch: string
] {
  $'($branch) (char failed)' | bright-cyan
}

def branch-up-to-date [
  branch: string
] {
  $'($branch) (char identical_to)' | bright-cyan
}

def branch-ahead [
  branch: string
  ahead: int
] {
  $'($branch) (char branch_ahead)($ahead)' | bright-green
}

def branch-behind [
  branch: string
  behind: int
] {
  $'($branch) (char branch_behind)($behind)' | bright-red
}

def branch-ahead-and-behind [
  branch: string
  ahead: int
  behind: int
] {
  $'($branch) (char branch_behind)($behind) (char branch_ahead)($ahead)' | bright-yellow
}

def staging-changes [
  added: int
  modified: int
  deleted: int
] {
  $'+($added) ~($modified) -($deleted)' | green
}

def worktree-changes [
  added: int
  modified: int
  deleted: int
] {
  $'+($added) ~($modified) -($deleted)' | red
}

def unresolved-conflicts [
  conflicts: int
] {
  $'!($conflicts)' | red
}

