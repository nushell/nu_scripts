# Max Brown
# a very basic git prompt
# sort of like panache-git, but fewer than 60 lines of code.

# use as below without the comments and in your
# env.nu file


#  use path/to/basic-git.nu basic-git-left-prompt

#  $env.PROMPT_COMMAND = {||
#		 let left = create_left_prompt
#		 basic-git-left-prompt $left
# }

def in_git_repo [] {
  (do --ignore-errors { git rev-parse --abbrev-ref HEAD } | is-empty) == false
}

export def basic-git-left-prompt [in_left_prompt] {

  # if we're in a repo, let's go!
  let currently_in_git_repo = in_git_repo

  if $currently_in_git_repo {
    # get the branch info first
    let branch_info = git branch -l
      | lines
      | filter {|e| $e | str contains "*" }
      | each {|e| $e | str replace "* " "="}
      | get 0
    let git_status = git status -s

    # get the status in short
    let git_status = $git_status
      | lines
      | str replace -r '(.* ).*' '$1'
      | sort
      | uniq -c
      | insert type {
        |e| if ($e.value | str contains "M") {
            "blue_bold"
          } else if ($e.value | str contains "??") {
            "yellow_bold"
          } else if ($e.value | str contains "D") {
            "red_bold"
          } else if ($e.value | str contains "A") {
            "cyan_bold"
          } else ""
        }
      | each {
          |e| $"(ansi $e.type)($e.count)($e.value | str trim)(ansi reset)"
        }
      | reduce --fold '' {|str all| $"($all),($str)" }
      | str substring 1..

    let final_git_status = if $git_status == "" {
      ""
    } else {
      $" ($git_status)"
    }

    # construct the prompt
    $"($in_left_prompt)(ansi reset) [($branch_info)($final_git_status)]"

  } else {
    # otherwise just return the normal prompt
    $in_left_prompt
  }
}
