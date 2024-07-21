
# A bash like quick string manipulation script
# the script works by creating a list from brace contents, separated by a brace.

# Expand the given string into a list on braces like bashes brace expansion 
export def main [ 
  input: string   # the string to expand.
  ] {
  listify $input
}

def listify [lst] {
  try {
    ($lst 
      | parse -r '(?P<left>.*)(?<!\\){(?P<list>.*)(?<!\\)}(?P<right>.*)'
      | get 0
      | upsert list { |l|
        $l.list
        | split row ","
        | str trim
      }
      | each { |it| 
        $it.list 
        | each { |l|
          listify $"($it.left)($l)($it.right)"
        }})
    | flatten
  } catch {
    $lst
  }
}

export def help [] {
  print -n ( main -h )

  print (
  [
    $"(ansi green)Examples(ansi reset):"
    $"  > (ansi light_green)expand (ansi green)a/{b,c}/d(ansi reset)"
    $"╭───┬───────╮\n│ 0 │ a/b/d │\n│ 1 │ a/c/d │\n╰───┴───────╯"
    $"  > (ansi light_green)expand (ansi green)\"my {beautiful,ugly} duckling\"(ansi reset)"
    $"╭───┬────────────────────────╮\n│ 0 │ my beautiful duckling │\n│ 1 │ my ugly duckling       │\n╰───┴────────────────────────╯"
    $"  > (ansi light_green)expand (ansi green).config/nushell/config.nu{,on}(ansi reset)"
    $"╭───┬─────────────────────────────╮\n│ 0 │ .config/nushell/config.nu   │\n│ 1 │ .config/nushell/config.nuon │\n╰───┴─────────────────────────────╯"
    $"  > (ansi light_green)expand (ansi green)a/{b,c}/{d,e,f,g}  (ansi reset)(ansi purple)|(ansi reset)(ansi light_green) each(ansi reset) (ansi light_green){ |d| (ansi reset)(ansi light_green) mkdir(ansi reset) (ansi purple)$d (ansi reset)(ansi light_green)}(ansi reset);(ansi light_green)tree(ansi reset)"
    $".
`-- a
    |-- b
    |   |-- d
    |   |-- e
    |   |-- f
    |   `-- g
    `-- c
        |-- d
        |-- e
        |-- f
        `-- g

12 directories, 0 files"
  ] |
  str join "\n" |
  nu-highlight
  )
}
