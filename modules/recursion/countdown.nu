
# Simple countdown counter from some number n to 0. Returns 0 at end
# Designed to be used with the tramp module to avoid stack overflows via the
# use of the Trampoline method.
def countdown [n: int]: nothing -> int {
  if $n == 0 {
    0
  } else {
    {|| countdown ($n - 1) }
  }
}
