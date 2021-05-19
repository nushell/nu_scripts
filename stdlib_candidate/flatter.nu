# A command to flatten many levels by using recursion
# by @jturner 2/10/21
# Example: sys | flatter 3
def flatter [levels:int] {
  if $levels > 0 {
    flatten | flatter ($levels - 1)
  } {
    each { echo $it }
  }
}