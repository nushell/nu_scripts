# Function querying free online English dictionary API for definition of given word(s)
def dict [...word #word(s) to query the dictionary API but they have to make sense together like "martial law", not "cats dogs"
] {
	let query = ($word | str join %20)
  let link = ('https://api.dictionaryapi.dev/api/v2/entries/en/' + ($query|str replace ' ' '%20'))
  let output = (http get $link | rename word)
  let w = ($output.word | first)

  if $w == "No Definitions Found" {
  	echo $output.word
  } else {
  	echo $output
    | get meanings
    | flatten
    | select partOfSpeech definitions
    | flatten
    | flatten
    | reject "synonyms"
    | reject "antonyms"
  }
}
