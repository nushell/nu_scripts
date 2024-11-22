# A Terminal Wordle game.
# The code is based on https://gist.github.com/huytd/6a1a6a7b34a0d0abcac00b47e3d01513 ,but slightly personalized.

# a simple terminal Wordle game!
export def main [
  --unlimited(-u) # Play the game in unlimited mode.
  --max_count(-M) : int = 6 # Give yourself more chances than default
  --alternative_source(-a) : string = "https://raw.githubusercontent.com/charlesreid1/five-letter-words/master/sgb-words.txt" # Alternative link to provide as a word source
] {
  let words = (if ($alternative_source | str substring 0..4 | str contains "http") {http get $alternative_source} else {open $alternative_source} | from ssv -n)
  let word = ($words | get (random int 0..($words | length)) | get column1)
  if ((($words | each {|it| ($it.column1 | str length)}) | where $it != 5 | length) != 0 ) {
    echo $"(ansi rb)Warning:(ansi reset) The words list contains words that are not length 5"
  }
  mut end = false
  mut guess_count = 0
  mut avail = "abcdefghijklmnopqrstuvyxwz"
  while (not ($end)) {
    $guess_count += 1
    if ($guess_count <= $max_count or $unlimited) {
      echo $"(ansi xterm_aquamarine1a)Enter your guess (ansi reset)\((ansi green)($guess_count)(ansi reset)/(ansi yellow)(if ($unlimited) {inf} else {$max_count})(ansi reset)\)"
      mut guess = (input | str downcase )
      if (((($words | where column1 =~ $guess) | length) >= 1) and ($guess | str length) == 5) {
        mut out = ""
        mut checked = $word
        for i in ($guess | split chars | enumerate) {
          if ($i.item == ($word | str substring ($i.index)..($i.index + 1)) ) {
            $out += $"(ansi green_reverse)($i.item)(ansi reset)"
            $avail = ($avail | str replace $i.item $"(ansi green_reverse)($i.item)(ansi white_reverse)")
            $checked = ($checked | str replace $i.item "")
          } else if ( $i.item in $checked) {
            $out += $"(ansi yellow_reverse)($i.item)(ansi reset)"
            $avail = ($avail | str replace $i.item $"(ansi yellow_reverse)($i.item)(ansi white_reverse)")
            $checked = ($checked | str replace $i.item "")
          } else {
            $out += $"(ansi white_reverse)($i.item)(ansi reset)"
            $avail = ($avail | str replace $i.item "")
          }
        }
        $avail = $"(ansi white_reverse)($avail)(ansi reset)"
        echo $"($out)        possible -> ($avail)"
        if ($guess == $word) {
          $end = true
          echo $"(ansi xterm_green1 )You guessed right!(ansi reset)"
        }
      } else {
      echo "please enter a valid [5 letter] word!"
      $guess_count -= 1
      }
    } else {
      echo $"(ansi yellow )You loose, the word was: (ansi red)($word)(ansi reset)"
      $end = true
    }
  }
}
