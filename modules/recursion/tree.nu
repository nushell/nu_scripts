# tree.nu: module for working with trees
source typeof.nu #  Requires Nushell version 0.88 or later

# A tree is a recursive data structure. In Nu, we take the view that any single atomic value
# is a leaf. E.g. int, float, string, bool, etc.
# Any structured data is some kind of a tree. E.g. list, record or table.







# Applies closure to atomic data.
def visit-scalar [act: closure] {
  let data = $in
  do $act $data
}


# Visit every element of list and apply  closure
def visit-list [act: closure] {
  let l = $in
  $l |each {|x| $x | visit $act }
}


# Apply closure to every  column and value of record in input. Does a visit on
# each key and then on each value.
def visit-record [cl: closure] {
items {|k, v| $k | visit $cl; $v | visit $cl }
}




# Applies closure to every row in table passed to input. Defers to visit-record
# for each row.
def visit-table [act: closure] {
  each {|r| $r | visit-record $act }
}


# Applies closure to every node in tree passed to input recursively.
def visit [act: closure] {
    let stream = $in

  match ($stream | typeof) {
    'list' => { do $act 'list'; $stream | visit-list $act },
    'record' => { do $act 'record'; $stream | visit-record $act },
    'table' => { do $act 'table';  $stream | visit-table $act },
    _ => { $stream | visit-scalar $act }
  }
}
