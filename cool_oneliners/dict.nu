#As the name suggests, the function returns you the definition and example of the sought English word 
#(or breaks if it can't find the word because the API uses different columns for successful and invalid searches)

#usage: dict word
#usage: dict "word with space"

def dict [word: string] {
  let link = (build-string 'https://api.dictionaryapi.dev/api/v2/entries/en/' ($word|str find-replace ' ' '%20'))
  let output = (fetch $link |
  rename word)
  let w = ($output.word | first)  

  if $w == "No Definitions Found" {echo $output.word} {echo $output | 
  get meanings.definitions |
  select definition example
  }
}
