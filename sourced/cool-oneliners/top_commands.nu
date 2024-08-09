# Evaluates the top 5 most used commands present in `nushell/history.txt`.
if $nu.history-enabled { open $nu.history-path | lines | uniq --count | sort-by --reverse count | first 5 | rename command amount } else { print --stderr "History is disabled!" }
