# Euclid's algorithm for determining greatest common divisor between 2 positive integers
# Based on this clear explanation from Rutgers: https://sites.math.rutgers.edu/~greenfie/gs2004/euclid.html

# Returns the GCD of its 2 arguments
def gcd [i1: int, i2: int] -> int {
  mut a = $i1; mut b = $i2
  if $a < $b { let tmp = $a; $a = $b; $b = $tmp }
  let q = $a // $b; let r = $a mod $b
  if $r == 0 { 
   $b
  } else {
  gcd $b $r
  }
}

