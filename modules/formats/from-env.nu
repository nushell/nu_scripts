# Converts a .env file into a record
# may be used like this: open .env | load-env
# works with quoted and unquoted .env files
def "from env" []: string -> record {
  lines
    | split column '#' # remove comments
    | get column1
    | parse "{key}={value}"
    | update value {
        str trim -c '"' | # unquote values
        str replace -a "\\n" "\n" # replace `\n` with newline char
        str replace -a "\\r" "\r" # replace `\r` with carriage return
        str replace -a "\\t" "\t" # replace `\t` with tab
    }
    | transpose -r -d
}
