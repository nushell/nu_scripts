export def fuzzy-history-search [] { cat $nu.history-path | fzf | clip }
