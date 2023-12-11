# Script to generate a password from a dictionary file
# Author: @rickcogley
# Thanks: @amtoine, @fdncred, @jelle, @sygmei, @kubouch
# Updates: 20230415 - initial version
#          20230416 - add @amtoine's slick probabilistic "random decimal" char capitalization
#          20230417 - add script duration output in debug block
#          20230421 - add length of symbol chars to get-random-symbol function
#          20230422 - add variant flag to generate different styles of passwords
#          20230501 - refactor to allow number of words to be specified, use list manipulation and reduce to string
#          20230502 - improve performance on list builders with par-each
#          20230503 - add threads flag for fine tuning par-each

#======= NUPASS PASSWORD GENERATOR =======
# Generate password of 3 dictionary file words, numbers and symbols
export def main [
  words: int = 3    # Number of words in password
  --word_length (-l): int = 5    # Max length of words in password
  --symbols (-s): string = "!@#$%^&()_-+[]{}" # Symbols to use in password
  --variant (-v): string = "regular" # Password style to generate in regular, mixnmatch, alphanum, alpha, diceware
  --delimiter (-m): string = "-" # Delimiter for diceware
  --threads (-t): int = 16  # Number of threads to use in par-each
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
  let random_words = (1..$words | par-each { |i| $dictfile | get-random-word $word_length $num_lines | random-format-word } --threads $threads)

  # Get some symbols to sprinkle like salt bae
  # Update default symbol chars in symbols flag
  let symbols_len = ($symbols | str length)
  let random_symbols = (1..$words | par-each { |i| $symbols | get-random-symbol $symbols $symbols_len } --threads $threads)

  # Get some random numbers 
  let random_numbers = (1..$words | par-each { |i| (random int 0..99) } --threads $threads)

  # Print some vars if debug flag is set
  if $debug { 
    print $"(ansi bg_red) ====== DEBUG INFO ====== (ansi reset)"
    print $"(ansi bg_blue) 🔔 Number of lines in dict with words under ($word_length) chars: (ansi reset)"
    print $num_lines
    print $"(ansi bg_blue) 🔔 Words from randomly selected lines: (ansi reset)"
    print $random_words
    print $"(ansi bg_blue) 🔔 Randomly selected symbols: (ansi reset)"
    print $random_symbols
    print $"(ansi bg_blue) 🔔 Randomly selected numbers: (ansi reset)"
    print $random_numbers
    let endtime = (date now)
    print $"(ansi bg_green) 🔔 Generated password in ($endtime - $starttime): (ansi reset)"
  }

  # Return password in selected variant
  if $variant == "regular" {
    # Default variant, with regular distribution
    # Generate new list w symbol, words, numbers, then reduce to string
    return (0..($words - 1) | each { |it| ($random_symbols | get $it) + ($random_words | get $it) + ($random_numbers | get $it | into string) } | reduce { |it, acc| $acc + $it })

  } else if $variant == "mixnmatch" {
    # Combine lists, shuffle randomly, reduce to string
    return (($random_words ++ $random_symbols ++ $random_numbers | shuffle) | reduce { |it, acc| ($acc | into string) + ($it | into string) })
  } else if $variant == "alphanum" {
    # Combined random int and random word, reduce to string
    return (0..($words - 1) | each { |it| (random int 0..99 | into string) + ($random_words | get $it) } | reduce { |it, acc| $acc + $it })
  } else if $variant == "alpha" {
    # Reduce random words only to string
    return ($random_words | reduce { |it, acc| $acc + $it })
  } else if $variant == "diceware" {
    # Reduce to string with hyphen between words
    return ($random_words | reduce { |it, acc| $acc + $"($delimiter)($it)" })
  }
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
    | get (random int 1..($numlines))
    | get word
}

# Function to format a word randomly
def random-format-word [] {
    par-each {|it| 
        let rint = (random int 1..4)
        if $rint == 1 {
            ($it | str capitalize)
        } else if $rint == 2 {
            ($it | str upcase)
        } else if $rint == 3 {
            ($it | split chars | each {|c| if (random float) < 0.2 { $c | str upcase } else { $c }} | str join "")
        } else {
            ($it | str downcase)
        }
    }
}

# Function to get random symbol from list of symbols
def get-random-symbol [
    symbolchars: string
    symbolcharslen: int
] {
    $symbolchars
    | split chars
    | get (random int 0..($symbolcharslen - 1))
}
