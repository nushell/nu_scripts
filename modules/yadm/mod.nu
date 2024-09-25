# Scripts for yadm


# Needed because yadm is a bash shell
# The bash_yadm name is to prevent conflicts.
alias bash_yadm = bash yadm

export def main [
  --yadm-dir # Override the yadm directory. Yadm stores its configurations relative to this directory

  --yadm-data # Override the yadm data directory Yadm stores its data relative to this directory

  --yadm-repo # Override the location of the yadm repository

  --yadm-config # Override the location of the yadm configuration file

  --yadm-encrypt # Override the location of the yadm encryption configuration

  --yadm-archive # Override the location of the yadm encrypted files archive

  --yadm-bootstrap # Override the location of the yadm bootstrap program

] {

 let viable_bash_string_flags = generate_viable_bash_string_flags {
    yadm-dir: $yadm_dir
    yadm-data: $yadm_data
    yadm-repo: $yadm_repo
    yadm-config: $yadm_config
    yadm-encrypt: $yadm_encrypt
    yadm-archive: $yadm_archive
    yadm-bootstrap: $yadm_bootstrap
  }

  bash_yadm ...$viable_bash_string_flags

}


def generate_viable_bash_string_flags [
  flag_record:record # A object filled all known flags and their values.  
] -> list<string> {

  const acceptable_bash_types = [string int float duration filesize binary, bool]

  let not_all_flag_record_values_are_acceptable_bash_types = $flag_record 
  | values 
  | all { |value| ($value | describe) not-in $acceptable_bash_types }
  

# Since bash can only accept strings and string-like values the user must type them.
  if $not_all_flag_record_values_are_acceptable_bash_types {

    let joined_acceptable_bash_types = $acceptable_bash_types | str join " , "

    error make {
      msg: "Wrong values",
      label: $"The values for these flags aren't good please use.
      These ($joined_acceptable_bash_types) types.
      Bash can't use any of these types at all. 
      "
      span: (metadata $flag_record).span
      help: $"Please use one of these ($joined_acceptable_bash_types) for each flag"
      }

  }

  $flag_record 
  | items {  |key, value| 
  
  let value_type = ( $value | describe )
  
  let viable_types = [string int float duration filesize binary]
  
    # If flag value is a non-bool primitive create --key=value flag.  
        if $value_type in $viable_types { 

          return $"--($key)=($value)"
        } 
  
    # If flag value is a nothing return null 

      if $value_type == nothing or $value == false { return null }
  
    # If flag value is a bool primitive create --key flag. 

        $"--($key)"
        
    
    }
  | filter { |value| ( $value | describe ) != nothing } 
        

}



def "nu-complete yadm available upstream" [] {
  bash_yadm branch --no-color -a | lines | each { |line| $line | str replace '* ' "" | str trim }
}

def "nu-complete yadm remotes" [] {
  bash_yadm remote | lines | each { |line| $line | str trim }
}

def "nu-complete yadm log" [] {
  bash_yadm log --pretty=%h | lines | each { |line| $line | str trim }
}

# Yield all existing commits in descending chronological order.
def "nu-complete yadm commits all" [] {
  bash_yadm rev-list --all --remotes --pretty=oneline | lines | parse "{value} {description}"
}
# yadm rebase`.

#Yield commits of current branch only. This is useful for e.g. cut points in
def "nu-complete yadm commits current branch" [] {
  bash_yadm log --pretty="%h %s" | lines | parse "{value} {description}"
}

# Yield local branches like `bash_yadm`, `feature/typo_fix`
def "nu-complete yadm local branches" [] {
  bash_yadm branch --no-color | lines | each { |line| $line | str replace '* ' "" | str trim }
}

# Yield remote branches like `origin/bash_yadm`, `upstream/feature-a`
def "nu-complete yadm remote branches with prefix" [] {
  bash_yadm branch --no-color -r | lines | parse -r '^\*?(\s*|\s*\S* -> )(?P<branch>\S*$)' | get branch | uniq
}

# with yadm checkout` or`yadm switch`.
# Yield remote branches *without* prefix which do not have a local counterpart.
# E.g. `upstream/feature-a` as `feature-a` to checkout and track in one command
def "nu-complete yadm remote branches nonlocal without prefix" [] {
  # Get regex to strip remotes prefixes. It will look like `(origin|upstream)`
  # for the two remotes `origin` and `upstream`.
  let remotes_regex = (["(", ((nu-complete yadm remotes | each {|r| [$r, '/'] | str join}) | str join "|"), ")"] | str join)
  let local_branches = (nu-complete yadm local branches)
  bash_yadm branch --no-color -r | lines | parse -r (['^[\* ]+', $remotes_regex, '?(?P<branch>\S+)'] | flatten | str join) | get branch | uniq | where {|branch| $branch != "HEAD"} | where {|branch| $branch not-in $local_branches }
}

def "nu-complete yadm switch" [] {
  (nu-complete yadm local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete yadm remote branches nonlocal without prefix
            | parse "{value}"
            | insert description "remote branch")
}

def "nu-complete yadm checkout" [] {
  (nu-complete yadm local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete yadm remote branches nonlocal without prefix
            | parse "{value}"
            | insert description "remote branch")
  | append (nu-complete yadm remote branches with prefix
            | parse "{value}"
            | insert description "remote branch")
  | append (nu-complete yadm commits all)
  | append (nu-complete yadm files | where description != "Untracked" | select value)
  # Arguments to yadm rebase --onto<arg1> <arg2>`
}

def "nu-complete yadm rebase" [] {
  (nu-complete yadm local branches)
  | parse "{value}"
  | insert description "local branch"
  | append (nu-complete yadm remote branches with prefix
            | parse "{value}"
            | insert description "remote branch")
  | append (nu-complete yadm commits all)
}

def "nu-complete yadm stash-list" [] {
  bash_yadm stash list | lines | parse "{value}: {description}"
}

def "nu-complete yadm tags" [] {
  bash_yadm tag --no-color | lines
}

# See `man yadm-status` under "Short Format"
# This is incomplete, but should cover the most common cases.
const short_status_descriptions = {
  ".D": "Deleted"
  ".M": "Modified"
  "!" : "Ignored"
  "?" : "Untracked"
  "AU": "Staged, not merged"
  "MD": "Some modifications staged, file deleted in work tree"
  "MM": "Some modifications staged, some modifications untracked"
  "R.": "Renamed"
  "UU": "Both modified (in merge conflict)"
}

def "nu-complete yadm files" [] {
  let relevant_statuses = ["?",".M", "MM", "MD", ".D", "UU"]
  bash_yadm status --u --porcelain=2
  | lines
  | each { |$it|
    if $it starts-with "1 " {
      $it | parse --regex "1 (?P<short_status>\\S+) (?:\\S+\\s?){6} (?P<value>\\S+)"
    } else if $it starts-with "2 " {
      $it | parse --regex "2 (?P<short_status>\\S+) (?:\\S+\\s?){6} (?P<value>\\S+)"
    } else if $it starts-with "u " {
      $it | parse --regex "u (?P<short_status>\\S+) (?:\\S+\\s?){8} (?P<value>\\S+)"
    } else if $it starts-with "? " {
      $it | parse --regex "(?P<short_status>.{1}) (?P<value>.+)"
    } else {
      { short_status: 'unknown', value: $it }
    }
  }
  | flatten
  | where $it.short_status in $relevant_statuses
  | insert "description" { |e| $short_status_descriptions | get $e.short_status}
}

def "nu-complete yadm built-in-refs" [] {
  [HEAD FETCH_HEAD ORIG_HEAD]
}

def "nu-complete yadm refs" [] {
  nu-complete yadm switchable branches
  | parse "{value}"
  | insert description Branch
  | append (nu-complete yadm tags | parse "{value}" | insert description Tag)
  | append (nu-complete yadm built-in-refs)
}

def "nu-complete yadm files-or-refs" [] {
  nu-complete yadm switchable branches
  | parse "{value}"
  | insert description Branch
  | append (nu-complete yadm files | where description == "Modified" | select value)
  | append (nu-complete yadm tags | parse "{value}" | insert description Tag)
  | append (nu-complete yadm built-in-refs)
}

def "nu-complete yadm subcommands" [] {
  bash_yadm help -a | lines | where $it starts-with "   " | parse -r '\s*(?P<value>[^ ]+) \s*(?P<description>\w.*)'
}

def "nu-complete yadm add" [] {
  nu-complete yadm files
}

def "nu-complete yadm pull rebase" [] {
  ["false","true","merges","interactive"]
}


# Check out yadm branches and files
export def checkout [
  ...targets: string@"nu-complete yadm checkout"   # name of the branch or files to checkout
  --conflict: string                              # conflict style (merge or diff3)
  --detach(-d)                             # detach HEAD at named commit
  --force(-f)                            # force checkout (throw away local modifications)
  --guess                              # second guess 'yadm checkout <no-such-branch>' (default)
  --ignore-other-worktrees         # do not check if another worktree is holding the given ref
  --ignore-skip-worktree-bits                  # do not limit pathspecs to sparse entries only
  --merge(-m)                                  # perform a 3-way merge with the new branch
  --orphan: string                             # new unparented branch
  --ours(-2)                                   # checkout our version for unmerged files
  --overlay                                    # use overlay mode (default)
  --overwrite-ignore                           # update ignored files (default)
  --patch(-p)                                  # select hunks interactively
  --pathspec-from-file: string                 # read pathspec from file
  --progress                                   # force progress reporting
  --quiet(-q)                                  # suppress progress reporting
  --recurse-submodules                         # control recursive updating of submodules
  --theirs(-3)                                 # checkout their version for unmerged files
  --track(-t)                                  # set upstream info for new branch
  -b                                           # create and checkout a new branch
  -B: string                                   # create/reset and checkout a branch
  -l                                           # create reflog for new branch
] {
  
  bash_yadm checkout ...(
      generate_viable_bash_string_flags {
          conflict: $conflict,
          detach: $detach,
          force: $force
          guess: $guess,
          ignore-other-worktrees: $ignore_other_worktrees,
          ignore-skip-worktree-bits: $ignore_skip_worktree_bits
          merge:$merge
          orphan: $orphan
          ours: $ours
          overlay: $overlay,
          overwrite-ignore: $overwrite_ignore
          patch: $patch
          pathspec-from-file: $patch
          progress: $progress
          quiet: $quiet
          recurse-submodules: $recurse_submodules
          theirs: $theirs
          track: $track
          b: $b
          B: $B
          l: $l
        }
    )  
}

# Download objects and refs from another repository
export def fetch [
  repository?: string@"nu-complete yadm remotes" # name of the branch to fetch
  --all                                         # Fetch all remotes
  --append(-a)                                  # Append ref names and object names to .yadm/FETCH_HEAD
  --atomic                                      # Use an atomic transaction to update local refs.
  --depth: int                                  # Limit fetching to n commits from the tip
  --deepen: int                                 # Limit fetching to n commits from the current shallow boundary
  --shallow-since: string                       # Deepen or shorten the history by date
  --shallow-exclude: string                     # Deepen or shorten the history by branch/tag
  --unshallow                                   # Fetch all available history
  --update-shallow                              # Update .yadm/shallow to accept new refs
  --negotiation-tip: string                     # Specify which commit/glob to report while fetching
  --negotiate-only                              # Do not fetch, only print common ancestors
  --dry-run                                     # Show what would be done
  --write-fetch-head                            # Write fetched refs in FETCH_HEAD (default)
  --no-write-fetch-head                         # Do not write FETCH_HEAD
  --force(-f)                                   # Always update the local branch
  --keep(-k)                                    # Keep downloaded pack
  --multiple                                    # Allow several arguments to be specified
  --auto-bash_yadmtenance                            # Run 'yadm bash_yadmtenance run --auto' at the end (default)
  --no-auto-bash_yadmtenance                         # Don't run 'yadm bash_yadmtenance' at the end
  --auto-gc                                     # Run 'yadm bash_yadmtenance run --auto' at the end (default)
  --no-auto-gc                                  # Don't run 'yadm bash_yadmtenance' at the end
  --write-commit-graph                          # Write a commit-graph after fetching
  --no-write-commit-graph                       # Don't write a commit-graph after fetching
  --prefetch                                    # Place all refs into the refs/prefetch/ namespace
  --prune(-p)                                   # Remove obsolete remote-tracking references
  --prune-tags(-P)                              # Remove any local tags that do not exist on the remote
  --no-tags(-n)                                 # Disable automatic tag following
  --refmap: string                              # Use this refspec to map the refs to remote-tracking branches
  --tags(-t)                                    # Fetch all tags
  --recurse-submodules: string                  # Fetch new commits of populated submodules (yes/on-demand/no)
  --jobs(-j): int                               # Number of parallel children
  --no-recurse-submodules                       # Disable recursive fetching of submodules
  --set-upstream                                # Add upstream (tracking) reference
  --submodule-prefix: string                    # Prepend to paths printed in informative messages
  --upload-pack: string                         # Non-default path for remote command
  --quiet(-q)                                   # Silence internally used yadm commands
  --verbose(-v)                                 # Be verbose
  --progress                                    # Report progress on stderr
  --server-option(-o): string                   # Pass options for the server to handle
  --show-forced-updates                         # Check if a branch is force-updated
  --no-show-forced-updates                      # Don't check if a branch is force-updated
  -4                                            # Use IPv4 addresses, ignore IPv6 addresses
  -6                                            # Use IPv6 addresses, ignore IPv4 addresses
  ] {
    
  bash_yadm fetch ...(
      generate_viable_bash_string_flags {
          all: $all,
          append: $append,
          atomic: $atomic,
          depth: $depth,
          deepen: $deepen,
          shallow-since: $shallow_since,
          shallow-exclude: $shallow_exclude,
          unshallow: $unshallow,
          update-shallow: $update_shallow,
          negotiation-tip: $negotiation_tip,
          negotiate-only: $negotiate_only,
          dry-run: $dry_run,
          write-fetch-head: $write_fetch_head,
          no-write-fetch-head: $no_write_fetch_head,
          force: $force,
          keep: $keep,
          multiple: $multiple,
          auto-bash_yadmtenance: $auto_bash_yadmtenance,
          no-auto-bash_yadmtenance: $no_auto_bash_yadmtenance,
          auto-gc: $auto_gc,
          no-auto-gc: $no_auto_gc, 
          write-commit-graph: $write_commit_graph,
          no-write-commit-graph: $no_write_commit_graph,
          prefetch: $prefetch,
          prune:$prune,
          prune-tags: $prune_tags,
          no-tags: $no_tags,
          refmap: $refmap,
          tags: $tags,
          recurse-submodules: $recurse_submodules,
          jobs: $jobs,
          no-recurse-submodules: $no_recurse_submodules,
          set-upstream: $set_upstream,
          submodule-prefix: $submodule_prefix,
          upload-pack: $upload_pack,
          quiet: $quiet,
          verbose:$verbose, 
          progress:$progress,
          server-option: $server_option,
          show-forced-updates: $show_forced_updates,
          no-show-forced-updates: $no_show_forced_updates,
          4:$4,
          6:$6
        }
     ) 
}

# Push changes
export def push [
  remote?: string@"nu-complete yadm remotes"         # the name of the remote
  ...refs: string@"nu-complete yadm local branches"   # the branch / refspec
  --all                                              # push all refs
  --atomic                                           # request atomic transaction on remote side
  --delete(-d)                                       # delete refs
  --dry-run(-n)                                      # dry run
  --exec: string                                     # receive pack program
  --follow-tags                                      # push missing but relevant tags
  --force-with-lease                                 # require old value of ref to be at this value
  --force(-f)                                        # force updates
  --ipv4(-4)                                         # use IPv4 addresses only
  --ipv6(-6)                                         # use IPv6 addresses only
  --mirror                                           # mirror all refs
  --no-verify                                        # bypass pre-push hook
  --porcelain                                        # machine-readable output
  --progress                                         # force progress reporting
  --prune                                            # prune locally removed refs
  --push-option(-o): string                          # option to transmit
  --quiet(-q)                                        # be more quiet
  --receive-pack: string                             # receive pack program
  --recurse-submodules: string                       # control recursive pushing of submodules
  --repo: string                                     # repository
  --set-upstream(-u)                                 # set upstream for yadm pull/status
  --signed: string                                   # GPG sign the push
  --tags                                             # push tags (can't be used with --all or --mirror)
  --thin                                             # use thin pack
  --verbose(-v)                                      # be more verbose
] {


 if ($remote| describe) == nothing {

     return (
        bash_yadm push ...$refs ...(
              generate_viable_bash_string_flags {
                  all:$all,
                  atomic:$atomic,
                  delete:$delete,
                  dry-run:$dry_run
                  exec:$exec,
                  follow-tags:$follow_tags
                  force-with-lease:$force_with_lease
                  force:$force,
                  ipv4:ipv4,
                  ipv6:$ipv6,
                  mirror:$mirror,
                  no-verify:$no_verify
                  porcelain:$porcelain,
                  progress:$progress,
                  prune:$prune,
                  push-option:push_option
                  quiet:$quiet,
                  receive-pack:$receive_pack
                  recurse-submodules:$recurse_submodules
                  repo:$repo,
                  set-upstream:$set_upstream
                  signed:$signed,
                  tags:$tags,
                  thin:$thin,
                  verbose:$verbose,      
                }
             )
          )
 
 }

 bash_yadm push $remote ...$refs ...(
    generate_viable_bash_string_flags {
        all:$all,
        atomic:$atomic,
        delete:$delete,
        dry-run:$dry_run
        exec:$exec,
        follow-tags:$follow_tags
        force-with-lease:$force_with_lease
        force:$force,
        ipv4:ipv4,
        ipv6:$ipv6,
        mirror:$mirror,
        no-verify:$no_verify
        porcelain:$porcelain,
        progress:$progress,
        prune:$prune,
        push-option:push_option
        quiet:$quiet,
        receive-pack:$receive_pack
        recurse-submodules:$recurse_submodules
        repo:$repo,
        set-upstream:$set_upstream
        signed:$signed,
        tags:$tags,
        thin:$thin,
        verbose:$verbose,      
      }
  )
 
 
}



# Pull changes
export def pull [
  remote?: string@"nu-complete yadm remotes" = '',         # the name of the remote
  ...refs: string@"nu-complete yadm local branches",  # the branch / refspec
  --rebase(-r): string@"nu-complete yadm pull rebase",    # rebase current branch on top of upstream after fetching
  --quiet(-q)                                        # suppress output during transfer and merge
  --verbose(-v)                                      # be more verbose
  --commit                                           # perform the merge and commit the result
  --no-commit                                        # perform the merge but do not commit the result
  --edit(-e)                                         # edit the merge commit message
  --no-edit                                          # use the auto-generated merge commit message
  --cleanup: string                                  # specify how to clean up the merge commit message
  --ff                                               # fast-forward if possible
  --no-ff                                            # create a merge commit in all cases
  --gpg-sign(-S)                                     # GPG-sign the resulting merge commit
  --no-gpg-sign                                      # do not GPG-sign the resulting merge commit
  --log: int                                         # include log messages from merged commits
  --no-log                                           # do not include log messages from merged commits
  --signoff                                          # add Signed-off-by trailer
  --no-signoff                                       # do not add Signed-off-by trailer
  --stat(-n)                                         # show a diffstat at the end of the merge
  --no-stat                                          # do not show a diffstat at the end of the merge
  --squash                                           # produce working tree and index state as if a merge happened
  --no-squash                                        # perform the merge and commit the result
  --verify                                           # run pre-merge and commit-msg hooks
  --no-verify                                        # do not run pre-merge and commit-msg hooks
  --strategy(-s): string                             # use the given merge strategy
  --strategy-option(-X): string                      # pass merge strategy-specific option
  --verify-signatures                                # verify the tip commit of the side branch being merged
  --no-verify-signatures                             # do not verify the tip commit of the side branch being merged
  --summary                                          # show a summary of the merge
  --no-summary                                       # do not show a summary of the merge
  --autostash                                        # create a temporary stash entry before the operation
  --no-autostash                                     # do not create a temporary stash entry before the operation
  --allow-unrelated-histories                        # allow merging histories without a common ancestor
  --no-rebase                                        # do not rebase the current branch on top of the upstream branch
  --all                                              # fetch all remotes
  --append(-a)                                       # append fetched refs to existing contents of FETCH_HEAD
  --atomic                                           # use an atomic transaction to update local refs
  --depth: int                                       # limit fetching to the specified number of commits
  --deepen: int                                      # deepen the history by the specified number of commits
  --shallow-since: string                            # deepen or shorten the history since a specified date
  --shallow-exclude: string                          # exclude commits reachable from a specified branch or tag
  --unshallow                                        # convert a shallow repository to a complete one
  --update-shallow                                   # update .yadm/shallow with new refs
  --tags(-t)                                         # fetch all tags from the remote
  --jobs(-j): int                                    # number of parallel children for fetching
  --set-upstream                                     # add upstream (tracking) reference
  --upload-pack: string                              # specify non-default path for upload-pack on the remote
  --progress                                         # force progress status even if stderr is not a terminal
  --server-option(-o): string                        # transmit the given string to the server
] {


if ($remote | describe) == nothing {

  bash_yadm pull ...(
      generate_viable_bash_string_flags {
          rebase: $rebase
          quiet: $quiet
          verbose: $verbose
          commit: $commit
          no-commit: $no_commit
          edit: $edit
          no-edit: $no_edit
          cleanup: $cleanup
          ff: $ff
          no-ff: $no_ff
          gpg-sign: $gpg_sign
          no-gpg-sign: $no_gpg_sign
          log: $log
          no-log: $no_log
          signoff: $signoff
          no-signoff: $no_signoff
          stat: $stat
          no-stat: $no_stat
          squash: $squash
          no-squash: $no_squash
          verify: $verify
          no-verify: $no_verify
          strategy: $strategy
          strategy-option: $strategy_option
          verify-signatures: $verify_signatures
          no-verify-signatures: $no_verify_signatures
          summary: $summary
          no-summary: $no_summary
          autostash: $autostash
          no-autostash: $no_autostash
          allow-unrelated-histories: $allow_unrelated_histories
          no-rebase: $no_rebase
          all: $all
          append: $append
          atomic: $atomic
          depth: $depth
          deepen: $deepen
          shallow-since: $shallow_since
          shallow-exclude: $shallow_exclude
          unshallow: $unshallow
          update-shallow: $update_shallow
          tags: $tags
          jobs: $jobs
          set-upstream: $set_upstream
          upload-pack: $upload_pack
          progress: $progress
          server-option: $server_option
        }
      )
  
}


  bash_yadm pull $remote ...$refs ...(
        generate_viable_bash_string_flags {
          rebase: $rebase
          quiet: $quiet
          verbose: $verbose
          commit: $commit
          no-commit: $no_commit
          edit: $edit
          no-edit: $no_edit
          cleanup: $cleanup
          ff: $ff
          no-ff: $no_ff
          gpg-sign: $gpg_sign
          no-gpg-sign: $no_gpg_sign
          log: $log
          no-log: $no_log
          signoff: $signoff
          no-signoff: $no_signoff
          stat: $stat
          no-stat: $no_stat
          squash: $squash
          no-squash: $no_squash
          verify: $verify
          no-verify: $no_verify
          strategy: $strategy
          strategy-option: $strategy_option
          verify-signatures: $verify_signatures
          no-verify-signatures: $no_verify_signatures
          summary: $summary
          no-summary: $no_summary
          autostash: $autostash
          no-autostash: $no_autostash
          allow-unrelated-histories: $allow_unrelated_histories
          no-rebase: $no_rebase
          all: $all
          append: $append
          atomic: $atomic
          depth: $depth
          deepen: $deepen
          shallow-since: $shallow_since
          shallow-exclude: $shallow_exclude
          unshallow: $unshallow
          update-shallow: $update_shallow
          tags: $tags
          jobs: $jobs
          set-upstream: $set_upstream
          upload-pack: $upload_pack
          progress: $progress
          server-option: $server_option
        }
      )
 
 
}

# Switch between branches and commits
export def switch [
  switch?: string@"nu-complete yadm switch"     # name of branch to switch to
  --create(-c)                                    # create a new branch
  --detach(-d): string@"nu-complete yadm log"      # switch to a commit in a detached state
  --force-create(-C): string                      # forces creation of new branch, if it exists then the existing branch will be reset to starting point
  --force(-f)                                     # alias for --discard-changes
  --guess                                         # if there is no local branch which matches then name but there is a remote one then this is checked out
  --ignore-other-worktrees                        # switch even if the ref is held by another worktree
  --merge(-m)                                     # attempts to merge changes when switching branches if there are local changes
  --no-guess                                      # do not attempt to match remote branch names
  --no-progress                                   # do not report progress
  --no-recurse-submodules                         # do not update the contents of sub-modules
  --no-track                                      # do not set "upstream" configuration
  --orphan: string                                # create a new orphaned branch
  --progress                                      # report progress status
  --quiet(-q)                                     # suppress feedback messages
  --recurse-submodules                            # update the contents of sub-modules
  --track(-t)                                     # set "upstream" configuration
  ] {


  bash_yadm switch $switch ...(
        generate_viable_bash_string_flags {       
            create:$create,
            detach:$detach,
            force-create: $force_create,
            force:$force,
            guess:$guess,
            ignore-other-worktrees: $ignore_other_worktrees,
            merge:$merge,
            no-guess: $no_guess,
            no-progress: $no_progress,
            no-recurse-submodules: $no_recurse_submodules,
            no-track: $no_track,
            orphan: $orphan,
            progress: $progress,
            quiet:$quiet,
            recurse-submodules: $recurse_submodules
            track:$track
        }
     )

}

# Apply the change introduced by an existing commit
export def cherry-pick [
  commit?: string@"nu-complete yadm commits all" # The commit ID to be cherry-picked
  --edit(-e)                                    # Edit the commit message prior to committing
  --no-commit(-n)                               # Apply changes without making any commit
  --signoff(-s)                                 # Add Signed-off-by line to the commit message
  --ff                                          # Fast-forward if possible
  --continue                                    # Continue the operation in progress
  --abort                                       # Cancel the operation
  --skip                                        # Skip the current commit and continue with the rest of the sequence
  ] {
    
  bash_yadm cherry-pick $commit ...(
         generate_viable_bash_string_flags {
            edit: $edit
            no-commit: $no_commit
            signoff: $signoff
            ff: $ff
            continue: $continue
            abort: $abort
            skip: $skip
        }
      )


}

# Rebase the current branch
export def rebase [
  branch?: string@"nu-complete yadm rebase"    # name of the branch to rebase onto
  upstream?: string@"nu-complete yadm rebase" # upstream branch to compare against
  --continue                                  # restart rebasing process after editing/resolving a conflict
  --abort                                     # abort rebase and reset HEAD to original branch
  --quit                                      # abort rebase but do not reset HEAD
  --interactive(-i)                           # rebase interactively with list of commits in editor
  --onto: string@"nu-complete yadm rebase"    # starting point at which to create the new commits
  --root                                      # start rebase from root commit
] {
  
  bash_yadm rebase $branch $upstream ...(
        generate_viable_bash_string_flags {
          continue: $continue,
          abort:$abort,
          quit:$quit
          interactive:$interactive,
          onto: $onto,
          root: $root
        }
      )


}

# List or change branches
export def branch [
  branch?: string@"nu-complete yadm local branches"   # name of branch to operate on
  --abbrev                                                       # use short commit hash prefixes
  --edit-description                                             # open editor to edit branch description
  --merged                                                      # list reachable branches
  --no-merged                                                    # list unreachable branches
  --set-upstream-to: string@"nu-complete yadm available upstream" # set upstream for branch
  --unset-upstream                                               # remote upstream for branch
  --all                                                          # list both remote and local branches
  --copy                                                         # copy branch together with config and reflog
  --format                                                       # specify format for listing branches
  --move                                                         # rename branch
  --points-at                                                    # list branches that point at an object
  --show-current                                                 # print the name of the current branch
  --verbose                                                      # show commit and upstream for each branch
  --color                                                        # use color in output
  --quiet                                                        # suppress messages except errors
  --delete(-d)                                                   # delete branch
  --list                                                         # list branches
  --contains: string@"nu-complete yadm commits all"               # show only branches that contain the specified commit
  --no-contains                                                  # show only branches that don't contain specified commit
  --track(-t)                                                    # when creating a branch, set upstream
] {



  if ($branch | describe) != nothing and ($all == true or $list == true) {


    error make {
      msg: "The --all or --list flag and a value isn't supposed to passed at the same time",
      label:{
        text: "Remove this"
        span: (metadata $branch).span
      } 
    }

  }
  
  let viable_bash_string_flags = generate_viable_bash_string_flags {
          abbrev:$abbrev,
          edit-description: $edit_description, 
          merged: $merged, 
          no-merged: $no_merged,
          set-upstream-to: $set_upstream_to,
          unset-upstream: $unset_upstream,
          all: $all,
          copy: $copy,
          format: $format,
          move:$move,
          points-at: $points_at,
          show-current: $show_current, 
          verbose:$verbose
          color:$color
          quiet:$quiet
          delete:$delete
          list:$list,
          contains: $contains,
          no-contains: $no_contains,
          track: $track
     }


     if ($all == true or $list == true) {

      return (bash_yadm branch ...$viable_bash_string_flags)
    }
     

     bash_yadm branch $branch ...$viable_bash_string_flags
}

export module remote { 

# List or change tracked repositories
export def main [
  --verbose(-v)                            # Show URL for remotes
] {
  bash_yadm remote ...(generate_viable_bash_string_flags, {verbose:$verbose})
}

# Add a new tracked repository
export def add [remote:string] {
  bash_yadm remote add $remote
}

# Rename a tracked repository
export def rename [
  remote: string@"nu-complete yadm remotes"             # remote to rename
  new_name: string                                     # new name for remote
] {
  bash_yadm remote rename $remote $new_name
}

# Remove a tracked repository
export def remove [
  remote: string@"nu-complete yadm remotes"             # remote to remove
] {
  bash_yadm remove $remote
}

# Get the URL for a tracked repository
export def get-url [
  remote: string@"nu-complete yadm remotes"             # remote to get URL for
] {
  bash_yadm remote get-url $remote 
}

# Set the URL for a tracked repository
export def set-url [
  remote: string@"nu-complete yadm remotes"             # remote to set URL for
  url: string                                          # new URL for remote
] {
  bash_yadm remote set-url $remote $url
}



}

# Show changes between commits, working tree etc
export def diff [
  rev1_or_file?: string@"nu-complete yadm files-or-refs"
  rev2?: string@"nu-complete yadm refs" 
  --cached                                             # show staged changes
  --name-only                                          # only show names of changed files
  --name-status                                        # show changed files and kind of change
  --no-color                                           # disable color output
] {

    
    if (($rev1_or_file | describe) == nothing and ($rev2 | describe) == nothing)  {

      bash_yadm diff ...(
            generate_viable_bash_string_flags {
              cached: $cached,
              name-only: $name_only,
              name-status: $name_status,
              no-color: $no_color,
          }
      )

    }

    if (($rev1_or_file | describe) != nothing and ($rev2 | describe) == nothing) {
      
      return (
        bash_yadm diff $rev1_or_file ...(
            generate_viable_bash_string_flags {
            cached: $cached,
            name-only: $name_only,
            name-status: $name_status,
            no-color: $no_color,
        }
      )
     )

    }

     bash_yadm diff $rev1_or_file $rev2 ...(
          generate_viable_bash_string_flags {
            cached: $cached,
            name-only: $name_only,
            name-status: $name_status,
            no-color: $no_color,
        }
     )
}

# Commit changes
export def commit [
  --all(-a)                                           # automatically stage all modified and deleted files
  --amend                                             # amend the previous commit rather than adding a new one
  --message(-m): string                               # specify the commit message rather than opening an editor
  --no-edit                                           # don't edit the commit message (useful with --amend)
  --reuse-message(-C): string                         # reuse the message from a previous commit
  --reedit-message(-c): string                        # reuse and edit message from a commit
  --fixup: string                                     # create a fixup/amend commit
  --squash: string                                    # squash commit for autosquash rebase
  --reset-author                                      # reset author information
  --short                                              # short-format output for dry-run
  --branch                                            # show branch info in short-format
  --porcelain                                         # porcelain-ready format for dry-run
  --long                                              # long-format output for dry-run
  --null(-z)                                          # use NUL instead of LF in output
  --file(-F): string                                  # read commit message from file
  --author: string                                    # override commit author
  --date: string                                      # override author date
  --template(-t): string                              # use commit message template file
  --signoff(-s)                                       # add Signed-off-by trailer
  --no-signoff                                        # do not add Signed-off-by trailer
  --trailer: string                                   # add trailer to commit message
  --no-verify(-n)                                     # bypass pre-commit and commit-msg hooks
  --verify                                            # do not bypass pre-commit and commit-msg hooks
  --allow-empty                                       # allow commit with no changes
  --allow-empty-message                               # allow commit with empty message
  --cleanup: string                                   # cleanup commit message
  --edit(-e)                                          # edit commit message
  --no-edit                                           # do not edit commit message
  --include(-i)                                       # include given paths in commit
  --only(-o)                                          # commit only specified paths
  --pathspec-from-file: string                        # read pathspec from file
  --pathspec-file-nul                                 # use NUL character for pathspec file
  --untracked-files(-u): string                       # show untracked files
  --verbose(-v)                                       # show diff in commit message template
  --quiet(-q)                                         # suppress commit summary
  --dry-run                                           # show paths to be committed without committing
  --status                                            # include yadm-status output in commit message
  --no-status                                         # do not include yadm-status output
  --gpg-sign(-S):string                               # GPG-sign commit
  --no-gpg-sign                                       # do not GPG-sign commit
  ...pathspec: string                                 # commit files matching pathspec
] {

    bash_yadm commit ...$pathspec ...(
          generate_viable_bash_string_flags {
              all: $all
              amend: $amend
              message: $message
              no-edit: $no_edit
              reuse-message: $reuse_message
              reedit-message: $reedit_message
              fixup: $fixup
              squash: $squash
              reset-author: $reset_author
              short: $short
              branch: $branch
              porcelain: $porcelain
              long: $long
              null: $null
              file: $file
              author: $author
              date: $date
              template: $template
              signoff: $signoff
              no-signoff: $no_signoff
              trailer: $trailer
              no-verify: $no_verify
              verify: $verify
              allow-empty: $allow_empty
              allow-empty-message: $allow_empty_message
              cleanup: $cleanup
              edit: $edit
              no-edit: $no_edit
              include: $include
              only: $only
              pathspec-from-file: $pathspec_from_file
              pathspec-file-nul: $pathspec_file_nul
              untracked-files: $untracked_files
              verbose: $verbose
              quiet: $quiet
              dry-run: $dry_run
              status: $status
              no-status: $no_status
              gpg-sign: $gpg_sign
              no-gpg-sign: $no_gpg_sign   
          }
       ) 
 
 
}

# List commits
export def log [
   -U                        # show diffs
  --follow                  # show history beyond renames (single file only)
  --grep: string            # show log entries matching supplied regular expression
] {

  bash_yadm log ...(generate_viable_bash_string_flags {
        U:$U
        follow:$follow
        grep:$grep
      })
}

# Show or change the reflog
export def reflog [] {
     bash_yadm reflog
}

# Stage files
export def add [
  ...file: string@"nu-complete yadm add"               # file to add
  --all(-A)                                           # add all files
  --dry-run(-n)                                       # don't actually add the file(s), just show if they exist and/or will be ignored
  --edit(-e)                                          # open the diff vs. the index in an editor and let the user edit it
  --force(-f)                                         # allow adding otherwise ignored files
  --interactive(-i)                                   # add modified contents in the working tree interactively to the index
  --patch(-p)                                         # interactively choose hunks to stage
  --verbose(-v)                                       # be verbose
] {

  bash_yadm add ...$file ...(
        generate_viable_bash_string_flags {
          all:$all 
          dry-run:$dry_run
          edit:$edit
          force:$force
          interactive:$interactive
          patch:$patch
          verbose:$verbose
        }
      )


}

# Delete file from the working tree and the index
export def rm [
  ...file: string@"nu-complete yadm add"               # file to add
  -r                                                   # recursive
  --force(-f)                                          # override the up-to-date check
  --dry-run(-n)                                        # Don't actually remove any file(s)
  --cached                                             # unstage and remove paths only from the index
] {

  bash_yadm rm ...$file ...(
      generate_viable_bash_string_flags {
        r:$r, 
        force:$force,
        dry-run: $dry_run, 
        cached:$cached 
      }
    )

}

# Show the working tree status
export def status [
  --verbose(-v)                                       # be verbose
  --short(-s)                                         # show status concisely
  --branch(-b)                                        # show branch information
  --show-stash                                        # show stash information
] {
 
 bash_yadm status ...(
      generate_viable_bash_string_flags {
        verbose:$verbose,
        short:$short,
        branch:$branch,
        show-stash:$show_stash
      }
    )

}

# Stash changes for later
export module stash {

export def push [
  --patch(-p)                                         # interactively choose hunks to stash
] {
     bash_yadm stash push ...({patch: $patch})
}

# Unstash previously stashed changes
export def pop [
  stash?: string@"nu-complete yadm stash-list"          # stash to pop
  --index(-i)                                          # try to reinstate not only the working tree's changes, but also the index's ones
]  {
     bash_yadm stash pop ...({index: $index})
}

# List stashed changes
export def list []  {
  bash_yadm stash list
}

# Show a stashed change
export def show [
  stash?: string@"nu-complete yadm stash-list"
  -U  # show diff
] {
     bash_yadm stash show $stash
}

# Drop a stashed change
export def drop [
  stash?: string@"nu-complete yadm stash-list"
] {
     bash_yadm stash drop $stash
}
  
}


# Create a new yadm repository
export def init [
  --initial-branch(-b)                                # initial branch name
] {
     bash_yadm init ...(generate_viable_bash_string_flags {initial-branch: $initial_branch})
}


# List or manipulate tags
export def tag [
    tag?:string,
  --annotate(-a):string  # Creates an annotated tag with a message.
  --message(-m):string # Sets the tag message.
  --list(-l) # Lists tags that match the given pattern.
  --force(-f)  # Forces the creation of a tag, even if a tag with the same name already exists.
  --delete(-d): string@"nu-complete yadm tags"   # delete a tag
] {


    if (describe | $tag) == nothing and $list == false {

      error make {
        msg: "Invalid Argument",
        label:{
          text: "The tag is empty but"
          span: (metadata $tag).span 
        }
        help: "If you want to use yadm tag without passing in a value please pass in the list flag"
      }

    }

     bash_yadm tag $tag ...(
          generate_viable_bash_string_flags { 
            annotate:$annotate 
            message: $message
            list: $list
            force: $force
            delete: $delete
          }
        )
}

# Prune all unreachable objects
export def prune [
  --dry-run(-n)                                       # dry run
  --expire: string                                    # expire objects older than
  --progress                                          # show progress
  --verbose(-v)                                       # report all removed objects
  ]  {
    
    bash_yadm prune ...(
          generate_viable_bash_string_flags {
            dry-run: $dry_run
            expire: $expire
            progress: $progress
            verbose: $verbose
          }
        )

}

# Start a binary search to find the commit that introduced a bug

export module bisect {

export def start [] {
     bash_yadm bisect start 
}

# Mark the current (or specified) revision as bad
export def bad [
  bad_commit?: string               # a commit that has the bug
] {
     bash_yadm bisect bad $bad_commit
}

# Mark the current (or specified) revision as good
export def good [
  good_commit?: string                # a commit that doesn't have the bug

] {
     bash_yadm bisect good $good_commit
}

# Skip the current (or specified) revision
export def skip [
  commit:string
] {
     bash_yadm bisect skip $commit
}

# End bisection
export def reset [] {
    bash_yadm bisect reset
}


}

# Show help for a yadm subcommand
export def help [
  command: string@"nu-complete yadm subcommands"       # subcommand to show help for
] {
     bash_yadm help $command
}

# TODO: Work on the worktree commands

export module worktree {

export def main [
  --help(-h)            # display the help message for this command
  ...args
] {
     bash_yadm worktree ...$args ...(
            generate_viable_bash_string_flags {
                help: $help
            }
         )
} 

# create a new working tree
export def add [
  path: path            # directory to clone the branch
  branch: string@"nu-complete yadm available upstream" # Branch to clone
  --help(-h)            # display the help message for this command
  --force(-f)           # checkout <branch> even if already checked out in other worktree
  -b                    # create a new branch
  -B                    # create or reset a branch
  --detach(-d)          # detach HEAD at named commit
  --checkout            # populate the new working tree
  --lock                # keep the new working tree locked
  --reason              # reason for locking
  --quiet(-q)           # suppress progress reporting
  --track               # set up tracking mode (see yadm-branch(1))
  --guess-remote        # try to match the new branch name with a remote-tracking branch
  ...args
] {

     bash_yadm worktree add  ...(
          generate_viable_bash_string_flags {
                help: $help
                force: $force
                b: $b
                B: $B
                detach: $detach
                checkout: $checkout
                lock: $lock
                reason: $reason
                quiet: $quiet
                track: $track
                guess-remote: $guess_remote
            }
         )

}

# list details of each worktree
export def list [
  --help(-h)            # display the help message for this command
  --porcelain           # machine-readable output
  --verbose(-v)         # show extended annotations and reasons, if available
  --expire              # add 'prunable' annotation to worktrees older than <time>
  -z                    # terminate records with a NUL character
  ...args
  ] {

    bash_yadm worktree list ...$args ...(
        generate_viable_bash_string_flags {
            help: $help
            porcelain: $porcelain
            verbose: $verbose
            expire: $expire
            z: $z
          }
        ) 
}

def "nu-complete worktree list" [] {
  bash_yadm worktree list | to text | parse --regex '(?P<value>\S+)\s+(?P<commit>\w+)\s+(?P<description>\S.*)'
}

# termoator


# prevent a working tree from being pruned
export def lock [
  worktree: string@"nu-complete worktree list"
  --reason: string      # reason because the tree is locked
  --help(-h)            # display the help message for this command
  --reason              # reason for locking
  ...args
  ] {
    
    bash_yadm worktree lock $worktree ...$args ...(
        generate_viable_bash_string_flags {
            reason: $reason
            help:$help
            reason: $reason
          }
        )

}

# move a working tree to a new location
export def move [
  --help(-h)            # display the help message for this command
  --force(-f)           # force move even if worktree is dirty or locked
  ...args
  ] {
    
    bash_yadm worktree move ...$args ...(
        generate_viable_bash_string_flags {
            help:$help,
            force:$force,
          }
        ) 
}

# prune working tree information
export def prune [
  --help(-h)            # display the help message for this command
  --dry-run(-n)         # do not remove, show only
  --verbose(-v)         # report pruned working trees
  --expire              # expire working trees older than <time>
  ...args
  ] {
    
   bash_yadm worktree prune ...$args  ...(
        generate_viable_bash_string_flags {
            help: $help
            dry-run: $dry_run
            verbose: $verbose
            expire: $expire
          }
       ) 

}

# remove a working tree
export def remove [
  worktree: string@"nu-complete worktree list"
  --help(-h)            # display the help message for this command
  --force(-f)           # force removal even if worktree is dirty or locked
  ] {

    bash_yadm worktree remove $worktree ...(
        generate_viable_bash_string_flags {
            help: $help
            force: $force
          }
        )
}

# allow working tree to be pruned, moved or deleted
export def unlock [
  worktree: string@"nu-complete worktree list"
  ...args
] { 
  bash_yadm worktree unlock $worktree ...$args
  }



}


# yadm worktree

# clones a repo
export def clone [
  --help(-h)                    # display the help message for this command
  --local(-l)                   # cloning from the local machine
  --no-local                    # use the yadm transport mechanism even if cloning from a local path
  --no-hardlinks                # force yadm to copy files when cloning from the local machine
  --shared(-s)                  # setup .yadm/objects/info/alternates to share objects with the source local repo
  --reference: string           # setup .yadm/objects/info/alternates to share objects with the =<reference> local repo
  --reference-if-able: string   # same as --reference, but skips empty folders
  --dissociate                  # borrow objects from the referenced repo (--reference)
  --quiet(-q)                   # suppress progress reporting
  --verbose(-v)                 # be verbose
  --progress                    # report progress unless --quiet
  --server-option: string       # transmit the =<option> to the server
  --no-checkout(-n)             # no checkout of HEAD
  --reject-shallow              # reject shallow repository as source
  --no-reject-shallow           # do not reject shallow repository as source
  --bare                        # make a bare yadm repo
  --sparse                      # initialize the sparse-checkout file
  --filter: string              # partial clone using the given =<filter-spec>
  --mirror                      # mirror the source repo
  --origin(-o): string          # use <name> as the name for the remote origin
  --branch(-b): string          # point HEAD to <name> branch
  --upload-pack(-u): string     # use <upload-pack> as the path in the other end when using ssh
  --template: string            # use <template-dir> as the templates directory
  --config(-c): string          # set a <key>=<value> config variable
  --depth: int                  # shallow clone <depth> commits 
  --shallow-since: string       # shallow clone commits newer than =<date>
  --shallow-exclude: string     # do not clone commits reachable from <revision> (branch or tag)
  --single-branch               # clone commit history from a single branch
  --no-single-branch            # do not clone only one branch
  --no-tags                     # do not clone any tags
  --recurse-submodules: string  # clone the submodules
  --shallow-submodules          # shallow clone submodules with depth 1
  --no-shallow-submodules       # do not shallow clone submodules
  --remote-submodules           # submodules are updating using their remote tracking branch
  --no-remote-submodules        # do not track submodules remote
  --separate-yadm-dir: string    # place the clone at =<yadm dir> and link it here
  --jobs(-j): int               # number of simultaneous submodules fetch
  ...args
  ] {

     bash_yadm clone ...$args ...(
          generate_viable_bash_string_flags {
            help: $help
            local: $local
            no-local: $no_local
            no-hardlinks: $no_hardlinks
            shared:$shared
            reference: $reference
            reference-if-able: $reference_if_able
            dissociate: $dissociate
            quiet: $quiet
            verbose: $verbose
            progress:$progress
            server-option: $server_option
            no-checkout: $no_checkout
            reject-shallow: $reject_shallow
            no-reject-shallow: $no_reject_shallow
            bare: $bare
            sparse: $sparse
            filter: $filter
            mirror: $mirror
            origin:$origin
            branch:$branch
            upload-pack:$upload_pack
            template: $template
            config: $config
            depth: $depth 
            shallow-since: $shallow_since
            shallow-exclude: $shallow_exclude
            single-branch: $single_branch
            no-single-branch: $no_single_branch
            no-tags:$no_tags
            recurse-submodules: $recurse_submodules
            shallow-submodules: $shallow_submodules
            no-shallow-submodules: $no_shallow_submodules
            remote-submodules: $remote_submodules
            no-remote-submodules: $no_remote_submodules
            separate-yadm-dir: $separate_yadm_dir
            jobs:$jobs
          }
        )

}

# Restores files in working tree or index to previous versions
export def restore [
  --help(-h)                                    # Display the help message for this command
  --source(-s)                                  # Restore the working tree files with the content from the given tree
  --patch(-p)                                   # Interactively choose hunks to restore
  --worktree(-W)                                # Restore working tree (default if neither --worktree or --staged is used)
  --staged(-S)                                  # Restore index
  --quiet(-q)                                   # Quiet, suppress feedback messages
  --progress                                    # Force progress reporting
  --no-progress                                 # Suppress progress reporting
  --ours                                        # Restore from index using our version for unmerged files
  --theirs                                      # Restore from index using their version for unmerged files
  --merge(-m)                                   # Restore from index and recreate the conflicted merge in unmerged files
  --conflict: string                            # Like --merge but changes the conflict presentation with =<style>
  --ignore-unmerged                             # Restore from index and ignore unmerged entries (unmerged files are left as is)
  --ignore-skip-worktree-bits                   # Ignore sparse checkout patterns and unconditionally restores any files in <pathspec>
  --recurse-submodules                          # Restore the contents of sub-modules in working tree
  --no-recurse-submodules                       # Do not restore the contents of sub-modules in working tree (default)
  --overlay                                     # Do not remove files that don't exist when restoring from tree with --source
  --no-overlay                                  # Remove files that don't exist when restoring from tree with --source (default)
  --pathspec-from-file: string                  # Read pathspec from file
  --pathspec-file-nul                           # Separate pathspec elements with NUL character when reading from file
  ...pathspecs: string@"nu-complete yadm files"  # Target pathspecs to restore
  ] {
    
   bash_yadm restore ...$pathspecs ...(
         generate_viable_bash_string_flags {
              help: $help,
              source: $source,
              patch: $patch,
              worktree:$worktree,
              staged: $staged,
              quiet:$quiet,
              progress:$progress,
              no-progress: $no_progress,
              ours:$ours,
              theirs: $theirs,
              merge: $merge,
              conflict: $conflict,
              ignore-unmerged: $ignore_unmerged,
              ignore-skip-worktree-bits: $ignore_skip_worktree_bits,
              recurse-submodules: $recurse_submodules,
              no-recurse-submodules: $no_recurse_submodules,
              overlay: $overlay,
              no-overlay: $no_overlay,
              pathspec-from-file: $pathspec_from_file
              pathspec-file-nul: $pathspec_from_file
          }
       ) 
}

# Print lines matching a pattern
export def grep [
  --help(-h)                            # Display the help message for this command
  --cached                              # Search blobs registered in the index file instead of worktree
  --untracked                           # Include untracked files in search
  --no-index                            # Similar to `grep -r`, but with additional benefits, such as using pathspec patterns to limit paths; Cannot be used together with --cached or --untracked
  --no-exclude-standard                 # Include ignored files in search (only useful with --untracked)
  --exclude-standard                    # No not include ignored files in search (only useful with --no-index)
  --recurse-submodules                  # Recursively search in each submodule that is active and checked out
  --text(-a)                            # Process binary files as if they were text
  --textconv                            # Honor textconv filter settings
  --no-textconv                         # Do not honor textconv filter settings (default)
  --ignore-case(-i)                     # Ignore case differences between patterns and files
  -I                                    # Don’t match the pattern in binary files
  --max-depth: int                      # Max <depth> to descend down directories for each pathspec. A value of -1 means no limit.
  --recursive(-r)                       # Same as --max-depth=-1
  --no-recursive                        # Same as --max-depth=0
  --word-regexp(-w)                     # Match the pattern only at word boundary
  --invert-match(-v)                    # Select non-matching lines
  -H                                    # Suppress filename in output of matched lines
  --full-name                           # Force relative path to filename from top directory
  --extended-regexp(-E)                 # Use POSIX extended regexp for patterns
  --basic-regexp(-G)                    # Use POSIX basic regexp for patterns (default)
  --perl-regexp(-P)                     # Use Perl-compatible regular expressions for patterns
  --line-number(-n)                     # Prefix the line number to matching lines
  --column                              # Prefix the 1-indexed byte-offset of the first match from the start of the matching line
  --files-with-matches(-l)              # Print filenames of files that contains matches
  --name-only                           # Same as --files-with-matches
  --files-without-match(-L)             # Print filenames of files that do not contain matches
  --null(-z)                            # Use \0 as the delimiter for pathnames in the output, and print them verbatim
  --only-matching(-o)                   # Print only the matched (non-empty) parts of a matching line, with each such part on a separate output line
  --count(-c)                           # Instead of showing every matched line, show the number of lines that match
  --no-color                            # Same as --color=never
  --break                               # Print an empty line between matches from different files.
  --heading                             # Show the filename above the matches in that file instead of at the start of each shown line.
  --show-function(-p)                   # Show the preceding line that contains the function name of the match, unless the matching line is a function name itself.
  --context(-C): int                    # Show <num> leading and trailing lines, and place a line containing  # between contiguous groups of matches.
  --after-context(-A): int              # Show <num> trailing lines, and place a line containing  # between contiguous groups of matches.
  --before-context(-B): int             # Show <num> leading lines, and place a line containing  # between contiguous groups of matches.
  --function-context(-W)                # Show the surrounding text from the previous line containing a function name up to the one before the next function name
  --max-count(-m): int                  # Limit the amount of matches per file. When using the -v or --invert-match option, the search stops after the specified number of non-matches.
  --threads: int                        # Number of grep worker threads to use. Use --help for more information on grep threads.
  -f: string                            # Read patterns from <file>, one per line.
  -e: string                            # Next parameter is the pattern. Multiple patterns are combined by --or.
  --and                                 # Search for lines that match multiple patterns.
  --or                                  # Search for lines that match at least one of multiple patterns. --or is implied between patterns without --and or --not.
  --not                                 # Search for lines that does not match pattern.
  --all-match                           # When giving multiple pattern expressions combined with --or, this flag is specified to limit the match to files that have lines to match all of them.
  --quiet(-q)                           # Do not output matched lines; instead, exit with status 0 when there is a match and with non-zero status when there isn’t.
  ...pathspecs: string                  # Target pathspecs to limit the scope of the search.
  ]  {


  bash_yadm grep ...$pathspecs ...(
      generate_viable_bash_string_flags {
          help:$help,
          cached:$cached,
          untracked:$untracked,
          no-index: $no_index,
          no-exclude-standard: $no_exclude_standard,
          exclude-standard: $exclude_standard,
          recurse-submodules: $recurse_submodules,
          text: $text,
          textconv: $textconv,
          no-textconv: $no_textconv,
          ignore-case: $ignore_case,
          -I:$I,
          max-depth: $max_depth,
          recursive: $recursive,
          no-recursive: $no_recursive,
          word-regexp: $word_regexp,
          invert-match: $invert_match,
          -H:$H,
          full-name: $full_name
          extended-regexp: $extended_regexp
          basic-regexp: $basic_regexp
          perl-regexp: $perl_regexp
          line-number: $line_number
          column: $column
          files-with-matches: $files_with_matches
          name-only: $name_only
          files-without-match: $files_without_match
          null: $null
          only-matching: $only_matching
          count: $count
          no-color: $no_color
          break: $break
          heading: $heading
          show-function: $show_function
          context: $context
          after-context: $after_context
          before-context: $before_context
          function-context: $function_context
          max-count: $max_count
          threads: $threads
          f: $f
          e: $e
          and: $and
          or: $or
          not: $not
          all-match: $all_match
          quiet: $quiet
        }
      )

}
  
