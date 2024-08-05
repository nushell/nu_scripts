# Evaluates the top 5 most used commands
open $nu.history-path | lines | uniq --count | sort-by --reverse count | first 5 | rename command amount
