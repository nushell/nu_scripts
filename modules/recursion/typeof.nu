# typeof command.  Requires Nushell version 0.88 or later

# Returns the typeof a value passed into input as a string
def typeof [--full (-f)] {
  describe -d | if not $full { get type } else { $in }
}


# Performs typeof on input but humanizes structured types into simple type record
# value lengths are given by ints so downstream consumers do not have to
# parse string contents like in the raw output of describe -d
# E.g. { list: 2 } # list with 2 elements
# { record: 3 } # record with 3 fields
def structured-type [] {
  let data = $in
  match ($data | typeof -f) {
  {type: list } => { {list: ($data | length) } },
    { type: record } =>  { {record: ($data | columns | length) } },
  _ => { $data | typeof }
  }
}
