# Compute the factorial of a number
# This version just returns either the value or a thunk.
# Meant to be used in a trampoline
# But still uses APS
def fact [n: int, acc=1]: nothing -> int {
  if $n <= 1 { return $acc } else {
    {|| fact ($n - 1) ($n * $acc) } # The thunk being returned to the trampoline
  }
}
