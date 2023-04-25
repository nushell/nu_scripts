#!/usr/bin/env nu
# script to get anagrams with scrabble points from unscramble.me
# NOTE: this is just a small show case of piping query web stuff
def main [...words: string] {
  let base = "https://www.unscramble.me/"
  $words | par-each {
    |word|
      http get ($base + $word)
        |query web -q ".mBottom-6" -m                                                       # gets the anagram table part of the page
        |drop nth 0                                                                         # remove the description/definition of "words"
        |first                                                                              # we only care about the biggest/first anagrams (which is the length of the input word)
        |query web -q "table" -m                                                            # get the html table
        |to text                                                                            # we need it as raw html to parse it
        |query web --as-table  ["Word" "Scrabble points" "Words with friends points"]       # parse the html table as table
  }
}
