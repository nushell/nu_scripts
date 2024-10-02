use ../conversions/into.nu *
use ./select-ranges.nu *

export def main [ ...ranges ] {
  columns
  | select ranges $ranges 
  | get item
}