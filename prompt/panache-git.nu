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
    let current-dir = ($env.PWD)

    let current-dir-relative-to-home = (
      do --ignore-errors { $current-dir | path relative-to $nu.home-path } | str collect
    )

    let in-sub-dir-of-home = ($current-dir-relative-to-home | empty? | nope)

    let current-dir-abbreviated = (if $in-sub-dir-of-home {
      $'~(char separator)($current-dir-relative-to-home)'
    } else {
      $current-dir
    })

    $'(ansi reset)($current-dir-abbreviated)'
  }

  # Get repository status as structured data
  export def "panache-git structured" [] {
    let in-git-repo = (do --ignore-errors { git rev-parse --abbrev-ref HEAD } | empty? | nope)

    let status = (if $in-git-repo {
      git --no-optional-locks status --porcelain=2 --branch | lines
    } else {
      []
    })

    let on-named-branch = (if $in-git-repo {
      $status
      | where ($it | str starts-with '# branch.head')
      | first
      | str contains '(detached)'
      | nope
    } else {
      false
    })

    let branch-name = (if $on-named-branch {
      $status
      | where ($it | str starts-with '# branch.head')
      | split column ' ' col1 col2 branch
      | get branch
      | first
    } else {
      ''
    })

    let commit-hash = (if $in-git-repo {
      $status
      | where ($it | str starts-with '# branch.oid')
      | split column ' ' col1 col2 full_hash
      | get full_hash
      | first
      | str substring [0 7]
    } else {
      ''
    })

    let tracking-upstream-branch = (if $in-git-repo {
      $status
      | where ($it | str starts-with '# branch.upstream')
      | str collect
      | empty?
      | nope
    } else {
      false
    })

    let upstream-exists-on-remote = (if $in-git-repo {
      $status
      | where ($it | str starts-with '# branch.ab')
      | str collect
      | empty?
      | nope
    } else {
      false
    })

    let ahead-behind-table = (if $upstream-exists-on-remote {
      $status
      | where ($it | str starts-with '# branch.ab')
      | split column ' ' col1 col2 ahead behind
    } else {
      [[]]
    })

    let commits-ahead = (if $upstream-exists-on-remote {
      $ahead-behind-table
      | get ahead
      | first
      | into int
    } else {
      0
    })

    let commits-behind = (if $upstream-exists-on-remote {
      $ahead-behind-table
      | get behind
      | first
      | into int
      | math abs
    } else {
      0
    })

    let has-staging-or-worktree-changes = (if $in-git-repo {
      $status
      | where ($it | str starts-with '1') || ($it | str starts-with '2')
      | str collect
      | empty?
      | nope
    } else {
      false
    })

    let has-untracked-files = (if $in-git-repo {
      $status
      | where ($it | str starts-with '?')
      | str collect
      | empty?
      | nope
    } else {
      false
    })

    let has-unresolved-merge-conflicts = (if $in-git-repo {
      $status
      | where ($it | str starts-with 'u')
      | str collect
      | empty?
      | nope
    } else {
      false
    })

    let staging-worktree-table = (if $has-staging-or-worktree-changes {
      $status
      | where ($it | str starts-with '1') || ($it | str starts-with '2')
      | split column ' '
      | get column2
      | split column '' staging worktree --collapse-empty
    } else {
      [[]]
    })

    let staging-added-count = (if $has-staging-or-worktree-changes {
      $staging-worktree-table
      | where staging == 'A'
      | length
    } else {
      0
    })

    let staging-modified-count = (if $has-staging-or-worktree-changes {
      $staging-worktree-table
      | where staging in ['M', 'R']
      | length
    } else {
      0
    })

    let staging-deleted-count = (if $has-staging-or-worktree-changes {
      $staging-worktree-table
      | where staging == 'D'
      | length
    } else {
      0
    })

    let untracked-count = (if $has-untracked-files {
      $status
      | where ($it | str starts-with '?')
      | length
    } else {
      0
    })

    let worktree-modified-count = (if $has-staging-or-worktree-changes {
      $staging-worktree-table
      | where worktree in ['M', 'R']
      | length
    } else {
      0
    })

    let worktree-deleted-count = (if $has-staging-or-worktree-changes {
      $staging-worktree-table
      | where worktree == 'D'
      | length
    } else {
      0
    })

    let merge-conflict-count = (if $has-unresolved-merge-conflicts {
      $status
      | where ($it | str starts-with 'u')
      | length
    } else {
      0
    })

    {
      in_git_repo: $in-git-repo,
      on_named_branch: $on-named-branch,
      branch_name: $branch-name,
      commit_hash: $commit-hash,
      tracking_upstream_branch: $tracking-upstream-branch,
      upstream_exists_on_remote: $upstream-exists-on-remote,
      commits_ahead: $commits-ahead,
      commits_behind: $commits-behind,
      staging_added_count: $staging-added-count,
      staging_modified_count: $staging-modified-count,
      staging_deleted_count: $staging-deleted-count,
      untracked_count: $untracked-count,
      worktree_modified_count: $worktree-modified-count,
      worktree_deleted_count: $worktree-deleted-count,
      merge_conflict_count: $merge-conflict-count
    }
  }

  # Get repository status as a styled string
  export def "panache-git styled" [] {
    let status = (panache-git structured)

    let is-local-only = ($status.tracking_upstream_branch != true)

    let upstream-deleted = (
      $status.tracking_upstream_branch &&
      $status.upstream_exists_on_remote != true
    )

    let is-up-to-date = (
      $status.upstream_exists_on_remote &&
      $status.commits_ahead == 0 &&
      $status.commits_behind == 0
    )

    let is-ahead = (
      $status.upstream_exists_on_remote &&
      $status.commits_ahead > 0 &&
      $status.commits_behind == 0
    )

    let is-behind = (
      $status.upstream_exists_on_remote &&
      $status.commits_ahead == 0 &&
      $status.commits_behind > 0
    )

    let is-ahead-and-behind = (
      $status.upstream_exists_on_remote &&
      $status.commits_ahead > 0 &&
      $status.commits_behind > 0
    )

    let branch-name = (if $status.in_git_repo {
      (if $status.on_named_branch {
        $status.branch_name
      } else {
        ['(' $status.commit_hash '...)'] | str collect
      })
    } else {
      ''
    })

    let branch-styled = (if $status.in_git_repo {
      (if $is-local-only {
        (branch-local-only $branch-name)
      } else if $is-up-to-date {
        (branch-up-to-date $branch-name)
      } else if $is-ahead {
        (branch-ahead $branch-name $status.commits_ahead)
      } else if $is-behind {
        (branch-behind $branch-name $status.commits_behind)
      } else if $is-ahead-and-behind {
        (branch-ahead-and-behind $branch-name $status.commits_ahead $status.commits_behind)
      } else if $upstream-deleted {
        (branch-upstream-deleted $branch-name)
      } else {
        $branch-name
      })
    } else {
      ''
    })

    let has-staging-changes = (
      $status.staging_added_count > 0 ||
      $status.staging_modified_count > 0 ||
      $status.staging_deleted_count > 0
    )

    let has-worktree-changes = (
      $status.untracked_count > 0 ||
      $status.worktree_modified_count > 0 ||
      $status.worktree_deleted_count > 0 ||
      $status.merge_conflict_count > 0
    )

    let has-merge-conflicts = $status.merge_conflict_count > 0

    let staging-summary = (if $has-staging-changes {
      (staging-changes $status.staging_added_count $status.staging_modified_count $status.staging_deleted_count)
    } else {
      ''
    })

    let worktree-summary = (if $has-worktree-changes {
      (worktree-changes $status.untracked_count $status.worktree_modified_count $status.worktree_deleted_count)
    } else {
      ''
    })

    let merge-conflict-summary = (if $has-merge-conflicts {
      (unresolved-conflicts $status.merge_conflict_count)
    } else {
      ''
    })

    let delimiter = (if ($has-staging-changes && $has-worktree-changes) {
      ('|' | bright-yellow)
    } else {
      ''
    })

    let local-summary = (
      $'($staging-summary) ($delimiter) ($worktree-summary) ($merge-conflict-summary)' | str trim
    )

    let local-indicator = (if $status.in_git_repo {
      (if $has-worktree-changes {
        ('!' | red)
      } else if $has-staging-changes {
        ('~' | bright-cyan)
      } else {
        ''
      })
    } else {
      ''
    })

    let repo-summary = (
      $'($branch-styled) ($local-summary) ($local-indicator)' | str trim
    )

    let left-bracket = ('[' | bright-yellow)
    let right-bracket = (']' | bright-yellow)

    (if $status.in_git_repo {
      $'($left-bracket)($repo-summary)($right-bracket)'
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
  let prompt = ($'(panache-git dir) (panache-git styled)' | str trim)
  $'($prompt)> '
}
