export def main [...rest] {
  let stdin = $in
  if ($rest | length ) > 0 {
    ^wc $rest | lines | parse -r '^\s*(?<lines>\d+)\s*(?<words>\d+)\s*(?<bytes>\d+)\s*(?<file>.*)$' 
  } else {
    $stdin | ^wc | lines | parse -r '^\s*(?<lines>\d+)\s*(?<words>\d+)\s*(?<bytes>\d+)\s*$' 
    
  }
}
