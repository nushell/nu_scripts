def "date local" [now] {
  insert time {|value|
    let converted = ($now | date to-timezone $value.tz);

    $converted | date format '%c'
  }
}
