# Mutually recursive versions of even and odd commands


# even returns true if passed in 0. odd returns returns true if passed in 1
# Else, they subtract 2 and call the other fn: even calls odd ($n - 2)
#


# These functions are meant to be used with the tramp module which implements
# a trampoline  wrapper closure. Thus, for each even, odd command, the
#  normal recursive case will actually return a thunk..

# Return true if number is even. Calls mutually recursive odd function
# if number is greater than 1.
def even [n: int, acc=true] -> any {
  if $n == 0 { return $acc } else if $n == 1 {
    return (not $acc) } else {
    {|| odd ($n - 2) (not $acc) }
  }
}


# Returns true if number is odd. Will cooperate with even in a mutually recursive fashion.
# Warning: do not pass any numbers less than 0
def odd [n: int, acc=true] -> bool {
  if $n == 0 { return (not $acc) } else if $n == 1 { 
    return $acc } else {
    {|| even ($n - 2) (not $acc) }
  }
}
