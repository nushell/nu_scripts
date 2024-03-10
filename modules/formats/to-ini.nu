# converts records into .ini files
export def "to ini" [] {
  transpose key value
  | update value {|row|
    $row.value
    | transpose key value
    | format pattern "{key}={value}"
    | prepend $"[($row.key)]"
    | str join (char nl)
  }
  | get value
  | str join (char nl)
}
