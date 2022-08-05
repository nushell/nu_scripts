# panache-git
# An opinionated Git prompt for Nushell, styled after posh-git
#
# Quick Start:
# - Download this script (panache-git.nu)
# - In your Nushell config:
#   - Source this script
#   - Set panache-git as your prompt command
#   - Disable the separate prompt indicator by setting it to an empty string
# - For example, with this script in your home directory:
#     source ~/panache-git.nu
#     let-env PROMPT_COMMAND = { panache-git }
#     let-env PROMPT_INDICATOR = { "" }
# - Restart Nushell
#
# For more documentation or to file an issue, see https://github.com/ehdevries/panache-git


# Internal commands for building up the panache-git shell prompt
module panache-plumbing {

  # Get the current directory with home abbreviated
  export def "panache-git dir" [] {
    let current_dir = ($env.PWD)

    let current_dir_relative_to_home = (
      do --ignore-errors { $current_dir | path relative-to $nu.home-path } | str collect
    )

    let in_sub_dir_of_home = ($current_dir_relative_to_home | empty? | nope)

    let current_dir_abbreviated = (if $in_sub_dir_of_home {
      $'~(char separator)($current_dir_relative_to_home)'
    } else {
      $current_dir
    })

    $'(ansi reset)($current_dir_abbreviated)'
  }

  # Get repository status as structured data
  export def "panache-git structured" [] {
    let in_git_repo = (do --ignore-errors { git rev-parse --abbrev-ref HEAD } | empty? | nope)

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
      | str substring [0 7]
    } else {
      ''
    })

    let tracking_upstream_branch = (if $in_git_repo {
      $status
      | where ($it | str starts-with '# branch.upstream')
      | str collect
      | empty?
      | nope
    } else {
      false
    })

    let upstream_exists_on_remote = (if $in_git_repo {
      $status
      | where ($it | str starts-with '# branch.ab')
      | str collect
      | empty?
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
      | where ($it | str starts-with '1') || ($it | str starts-with '2')
      | str collect
      | empty?
      | nope
    } else {
      false
    })

    let has_untracked_files = (if $in_git_repo {
      $status
      | where ($it | str starts-with '?')
      | str collect
      | empty?
      | nope
    } else {
      false
    })

    let has_unresolved_merge_conflicts = (if $in_git_repo {
      $status
      | where ($it | str starts-with 'u')
      | str collect
      | empty?
      | nope
    } else {
      false
    })

    let staging_worktree_table = (if $has_staging_or_worktree_changes {
      $status
      | where ($it | str starts-with '1') || ($it | str starts-with '2')
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
  export def "panache-git styled" [] {
    let status = (panache-git structured)

    let is_local_only = ($status.tracking_upstream_branch != true)

    let upstream_deleted = (
      $status.tracking_upstream_branch &&
      $status.upstream_exists_on_remote != true
    )

    let is_up_to_date = (
      $status.upstream_exists_on_remote &&
      $status.commits_ahead == 0 &&
      $status.commits_behind == 0
    )

    let is_ahead = (
      $status.upstream_exists_on_remote &&
      $status.commits_ahead > 0 &&
      $status.commits_behind == 0
    )

    let is_behind = (
      $status.upstream_exists_on_remote &&
      $status.commits_ahead == 0 &&
      $status.commits_behind > 0
    )

    let is_ahead_and_behind = (
      $status.upstream_exists_on_remote &&
      $status.commits_ahead > 0 &&
      $status.commits_behind > 0
    )

    let branch_name = (if $status.in_git_repo {
      (if $status.on_named_branch {
        $status.branch_name
      } else {
        ['(' $status.commit_hash '...)'] | str collect
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
      $status.staging_added_count > 0 ||
      $status.staging_modified_count > 0 ||
      $status.staging_deleted_count > 0
    )

    let has_worktree_changes = (
      $status.untracked_count > 0 ||
      $status.worktree_modified_count > 0 ||
      $status.worktree_deleted_count > 0 ||
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

    let delimiter = (if ($has_staging_changes && $has_worktree_changes) {
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
}

# An opinionated Git prompt for Nushell, styled after posh-git
def panache-git [] {
  use panache-plumbing *
  let prompt = ($'(panache_git dir) (panache-git styled)' | str trim)
  $'($prompt)> '
}
