# Recursive Fibonacci programs in Nu

# Returns the Fibonacci number of its input n.
# This version is non-tail call optimized and might consume large values
# of stack space even for small values of n. It is also not memoized so run time
# performance for even quite small values of N is very poor.
def fib-nontail [n: int]: nothing -> int {
  if $n == 0 {
  0
  } else if $n == 1 {
    1
  } else {
    (fib-nontail ($n - 2)) + (fib-nontail ($n - 1))
  }
}






# Returns the Fibonacci number for the index n. Uses the double APS method to
# ensure the recursive call is in thetail position.
def fib-aps [n: int, acc: int=1, accp: int=1]: nothing -> int {
  if ($n == 0) or ($n == 1) {
    $n
  } else if $n == 2 {
    $acc
  } else {
    fib-aps ($n - 1) ($acc + $accp) $acc
  }
}



# Return the Fibonacci number for given index n
# This version relies on the trampoline helper
def fib [n: int, acc: int=1, accp: int=1]: nothing -> int {
  if ($n == 0) or ($n == 1) {
    $n
  } else if $n == 2 {
    $acc
  } else {
    {|| fib ($n - 1) ($acc + $accp) $acc }
  }
}


