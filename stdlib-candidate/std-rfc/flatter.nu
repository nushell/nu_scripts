# A command to flatten many levels by using recursion
# by @jturner 2/10/21
# Example: sys | flatter 3
def flatter [levels:int] {
  let input = $in
  if $levels > 0 {
      $input | columns | reduce -f $input {|it acc| $acc | flatten $it } | flatter ($levels - 1)
  } else {
      $input
  }
}
