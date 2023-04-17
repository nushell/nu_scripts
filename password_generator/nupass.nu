# Script to generate a password from a dictionary file
# Author: @rickcogley
# Thanks: @amtoine, @fdncred, @jelle
# Updates: 20230415 - initial version
#          20230416 - added @amtoine's slick probabilistic "random decimal" char capitalization
#          20230417 - added script duration output in debug block

#======= NUPASS PASSWORD GENERATOR =======
# Generate password of 3 dictionary file words, numbers and symbols
export def main [
  word_length: int = 4    # Max length of 3 words in password
  --debug (-d)    # Include debug info
] {
  ##### Main function #####
  # Get dictionary file:
  # http get https://raw.githubusercontent.com/RickCogley/jpassgen/master/genpass-dict-jp.txt | save genpass-dict-jp
  # Set the path:
  let dictfile = $"/usr/local/bin/genpass-dict-jp"
  let starttime = (date now)
  
  # Find number of lines with strings less than or equal to the supplied length
  let num_lines = (open ($dictfile) | lines | wrap word | upsert len {|it| $it.word | split chars | length} | where len <= ($word_length) | length)

  # Get random words from dictionary file
  let randword1 = ($dictfile | get-random-word $word_length $num_lines | random-format-word)
  let randword2 = ($dictfile | get-random-word $word_length $num_lines | random-format-word)
  let randword3 = ($dictfile | get-random-word $word_length $num_lines | random-format-word)

  # Get some symbols to sprinkle like salt bae
  let symbol_chars = "!@#$%^&*()_-+[]"
  let symb1 = (get-random-symbol $symbol_chars)
  let symb2 = (get-random-symbol $symbol_chars)
  let symb3 = (get-random-symbol $symbol_chars)
  let symb4 = (get-random-symbol $symbol_chars)

  # Print some vars if debug flag is set
  if $debug { 
    print $"(ansi bg_red) ====== DEBUG INFO ====== (ansi reset)"
    print $"(ansi bg_blue) 🔔 Number of lines in dict with words under ($word_length) chars: (ansi reset)"
    print $num_lines
    print $"(ansi bg_blue) 🔔 Words from randomly selected lines: (ansi reset)"
    print $randword1 $randword2 $randword3
    print $"(ansi bg_blue) 🔔 Randomly selected symbols: (ansi reset)"
    print $symb1 $symb2 $symb3 $symb4
    let endtime = (date now)
    print $"(ansi bg_green) 🔔 Generated password in ($endtime - $starttime): (ansi reset)"
  }

  # Return password
  return $"($symb1)(random integer 1..99)($randword1)($symb2)($randword2)($symb3)(random integer 1..99)($randword3)($symb4)"
  
}

##### Utility functions #####
# Function to get random word from a dictionary file
def get-random-word [
    wordlength: int
    numlines: int
] {
    open
    | lines
    | wrap word
    | upsert len {|it| $it.word | str length}
    | where len <= ($wordlength)
    | get (random integer 1..($numlines))
    | get word
}

# Function to format a word randomly
def random-format-word [] {
    each {|it| 
        let rint = (random integer 1..4)
        if $rint == 1 {
            ($it | str capitalize)
        } else if $rint == 2 {
            ($it | str upcase)
        } else if $rint == 3 {
            ($it | split chars | each {|c| if (random decimal) < 0.2 { $c | str upcase } else { $c }} | str join "")
        } else {
            ($it | str downcase)
        }
    }
}

# Function to get random symbol from list of symbols
def get-random-symbol [
    symbolchars: string
] {
    $symbolchars
    | split chars
    | get (random integer 0..14)
}
