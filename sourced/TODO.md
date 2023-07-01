# todo

These two commands can be used to make simple todo-lists that
are printed to the screen at terminal startup. They are currently
only implemented for [alacritty], for other terminals consult
your terminal documentation or find a work around

## SETUP: 
- Create a file called `todo.nu` and place the `printer` command,
  calling it at the end.
- In your `alacritty.yml`, add this
  ```yml
  shell:
    program: /bin/nu  # path to your `nu` executable
    args:
       - -e "nu /path/to/todo.nu"
  ```
- Create an empty file called `todo.txt`
- *Recommended*
  In your `env.nu`, add an environment variable pointing to the `todo.txt`. Example:
  ```nu
  $env.TODO = ($nu.config-path | path dirname | path join 'scripts/todo.txt')
  ```
- Source the `todo` command in your `config.nu`. Example
  ```nu
  source './scripts/todo.nu'
  ```
## USAGE:
- On terminal startup, the printer command is run by `nu` and the
  list is printed to the screen. If the list is empty, a message
  indicating so is printed.

- To add items, 
  ```nu
  todo -a "finish writing docs"
  ```

- To remove an item
  ```nu 
  # this prints the list(numbered)
  todo
  # the index of the item you want to remove 
  # (starts at 1 but can be changed to start at 0)
  todo -r 4
  ```

- To clear the whole list
  ```nu
  todo -c
  ```

- To manually edit the list
  ```
  # this opens an editor with the file opened
  todo -e
  ```


[alacritty]: github.com/alacritty/alacritty
