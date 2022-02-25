# Function querying free online English dictionary API for definition of given word(s)
def dict [...word #word(s) to query the dictionary API but they have to make sense together like "martial law", not "cats dogs"
] {
	let query = ($word | str collect %20)
  let link = (build-string 'https://api.dictionaryapi.dev/api/v2/entries/en/' ($query|str find-replace ' ' '%20'))
  let output = (fetch $link |
  rename word)
  let w = ($output.word | first)

  if $w == "No Definitions Found" {echo $output.word} {echo $output |
  get meanings.definitions |
  select definition example
  }
}
