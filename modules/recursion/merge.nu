# merge 2 sorted lists

# Merge 2 sorted lists
def merge-2 [l: list, r: list]: nothing -> list {
  mut ol = []
mut lprime = $l; mut rprime = $r
  let mx = ($l | length) + ($r | length)
  #print -e $"l: ($l), r: ($r)"
  while ($ol | length) < $mx {
  if ($lprime | is-empty) or ($rprime | is-empty) { break }
    if $lprime.0 <= $rprime.0 {

      $ol = ($ol | append $lprime.0)
      $lprime = ($lprime | skip)
    } else {
      $ol = ($ol | append $rprime.0)
    $rprime = ($rprime | skip)
    }
  }
  $ol | append $lprime | append $rprime
}


# Merge sort a list
# This version is non tail call optimized and might blow the stack for
# large lists.
def sort-nontail [x: list]: nothing -> list {
  let $n = ($x | length)
 let n_2: int = $n // 2

  if $n <= 1 {
    $x
  } else {
    merge-2 (sort-nontail ($x | first $n_2)) (sort-nontail ($x | skip $n_2))
  }
}
