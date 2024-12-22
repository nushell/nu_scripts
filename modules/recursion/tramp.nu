# Trampoline module to allow for recursion functions that won't stack overflow.


# The tramp create command is to be used to return a closure that will perform
# the trampoline  iteration. This closure can then be passed to  some other
# command that will execute it  for its own purposes.
# The tramp test command is one such command that will create the closure
# and then directly run it. It can be used to test your recursive functions
# that return thunks or terminating values.

# Returns a closure that when called will iterate over the returned thunks
# from the function being trampolined. Must initially call the function
# which must return either a thunk or a terminating value.
export def create [thunk: any] {
  return {||
  mut $inner_thunk = $thunk
  while ($inner_thunk | describe) == closure {
    $inner_thunk = (do $inner_thunk)
  }
    $inner_thunk
  }
}


# Will run the trampoline closure  whichis created # by performing a call to 'tramp create' withthe value of val.
# The parameter val must be either a terminating value or closure, which will get run until
# the terminating value is returned from the current closure which
# is returned from this function.
export def test [val: any]: nothing -> any {
  let cl = (create $val)
  do $cl
}



# For those cases where you do not want to first create a trampoline closure
# but just want to run the recursive command directly.
# Example usage
# use tramp.nu
# source even-odd.nu
# tramp recurse (odd 9876543)
# true

# Explicitly bounces the trampoline over a recursive function without first
# creating a closure .
export def recurse [val: any]: nothing -> any {
  mut maybe_thunk = $val
  while ($maybe_thunk | describe) == closure {
    $maybe_thunk = (do $maybe_thunk)
  }
  $maybe_thunk
}

