# Converts a .env file into a record
# may be used like this: open .env | load-env
# works with quoted and unquoted .env files
def "from env" []: string -> record {
  lines 
    | split column '#' # remove comments
    | get column1 
    | filter {($in | str length) > 0} 
    | parse "{key}={value}"
    | update value {str trim -c '"'} # unquote values
    | transpose -r -d
}
