use ../conversions/into-list.nu *
use ./select-ranges.nu *

export def main [ ...ranges ] {
  let indices = (
    $ranges
    | reduce -f [] {|range,indices|
      $indices ++ ($range | into list)
    }
  )

  $in | columns
  | select ranges $indices 
  | get item
}
