# Fuzzy all the things

### Purpose

This contains a few scripts that add fuzzy search interfaces to built-in nu functionalities. Often you
want to search commands/your history interactively, which is where [fzf](https://github.com/junegunn/fzf) excels at.


### How to use

`./fuzzy_history_search.nu` searches your command history and, after pressing `enter`, copies the selected command into the clipboard
`./fuzzy_command_search.nu` searches both commands and subcommands for both a) names and b) their description, and, after pressing `enter`, copies the selected command into the clipboard

To use them in your day-to-day workflow, add 

```
source <absolute-path-to-nu_scripts>/fuzzy/fuzzy_history_search.nu
source <absolute-path-to-nu_scripts>/fuzzy/fuzzy_command_search.nu
```

to your `config.nu` 

It's likely a good idea to  also add some short and sweet aliases, e.g.

```
alias hi = fuzzy-history-search
alias hf = fuzzy-command-search
```
