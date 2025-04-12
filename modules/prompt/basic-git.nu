# It's a very basic git prompt,
# sort of like panache-git, but less than 50 lines of code.

# Authors: Max Brown, @rukins

# Use as below without the comments and in your 'env.nu' file

#  use path/to/basic-git.nu basic-git-left-prompt
#  $env.PROMPT_COMMAND = {||
#		 let left = create_left_prompt
#		 basic-git-left-prompt $left
# }

def in_git_repo [] {
  (git branch --show-current | complete | get stderr | is-empty) == true
}

export def basic-git-left-prompt [in_left_prompt] {

  let currently_in_git_repo = in_git_repo

  if $currently_in_git_repo {
    let current_branch = $"(ansi purple_bold)(git branch --show-current)(ansi reset)"

    let current_status = git status -s
      | lines
      | str replace -r '^(.{2}).*' '$1'
      | uniq -c
      | each {
          |el| insert X { value: ($el.value | str substring ..0 | str trim) } | insert Y { value: ($el.value | str substring 1.. | str trim) }
        }
      | each {
          |el| if ([?, !] | any { |i| $el.X.value == $i and $el.Y.value == $i })  {
            insert X.color "red_bold" | insert Y.color "red_bold"
          } else {
            insert X.color "green_bold" | insert Y.color "red_bold"
          }
        }
      | each {
          |el| $"(ansi cyan_bold)($el.count)(ansi $el.X.color)($el.X.value)(ansi $el.Y.color)($el.Y.value)(ansi reset)"
        }
      | str join ","

    $"($in_left_prompt)(ansi reset) [($current_branch)($current_status | if ($in | is-not-empty) { $' ($in)' })]"
  } else {
    $in_left_prompt
  }
}
