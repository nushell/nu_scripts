# Nushell Command Reference

## Filters
| Command | Purpose | Example |
|---------|---------|---------|
| `where` | Filter rows | `ls \| where size > 1mb` |
| `select` | Choose columns (returns table) | `ls \| select name size` |
| `get` | Extract value (returns raw value) | `ls \| get name` |
| `reject` | Remove columns | `ls \| reject mode` |
| `first` / `last` | Take from ends | `ls \| first 5` |
| `skip` / `take` | Skip/take rows | `ls \| skip 2` |
| `sort-by` | Sort by column | `ls \| sort-by size --reverse` |
| `reverse` | Reverse order | `[3 1 2] \| reverse` |
| `uniq` | Deduplicate | `[1 1 2] \| uniq` |
| `uniq-by` | Deduplicate by column | `$t \| uniq-by name` |
| `group-by` | Group rows | `$t \| group-by col --to-table` |
| `flatten` | Unnest lists/tables | `[[1 2] [3]] \| flatten` |
| `merge` | Merge tables horizontally | `$a \| merge $b` |
| `transpose` | Pivot record/table | `{a: 1} \| transpose k v` |
| `enumerate` | Add index | `[a b] \| enumerate` |
| `zip` | Pair elements | `[1 2] \| zip [a b]` |
| `window` | Sliding window | `[1 2 3 4] \| window 2` |
| `each` | Transform items | `[1 2] \| each {\|x\| $x * 2}` |
| `par-each` | Parallel transform | `[1 2] \| par-each {\|x\| $x * 2}` |
| `reduce` | Fold to value | `[1 2 3] \| reduce {\|it, acc\| $acc + $it}` |
| `any` | Test any match | `[1 2] \| any {\|x\| $x > 1}` |
| `all` | Test all match | `[1 2] \| all {\|x\| $x > 0}` |
| `length` | Count items | `[1 2 3] \| length` |
| `is-empty` | Check empty | `[] \| is-empty` |
| `columns` | Get column names | `{a: 1} \| columns` |
| `values` | Get values | `{a: 1} \| values` |
| `items` | Iterate key-value | `{a: 1} \| items {\|k,v\| ...}` |
| `insert` | Add column/index | `{a: 1} \| insert b 2` |
| `update` | Modify existing | `{a: 1} \| update a 10` |
| `upsert` | Insert or update | `{a: 1} \| upsert b 2` |
| `rename` | Rename columns | `$t \| rename col1 col2` |
| `move` | Reorder columns | `$t \| move col --after other` |
| `wrap` | Wrap as table column | `[1 2] \| wrap val` |
| `default` | Default for null | `null \| default 0` |
| `compact` | Remove nulls | `[1 null 3] \| compact` |
| `find` | Search text/data | `ls \| find ".rs"` |
| `tee` | Split pipeline | `ls \| tee { save log } \| length` |

### `where` Clause Edge Cases

**Piping inside `where` REQUIRES parentheses:**
```nu
# WRONG - parsed as (where col) | (cmd), silently returns wrong results
$table | where name | str ends-with ".csv"

# CORRECT - parens make the expression evaluate per-row
$table | where ($in.name | str ends-with ".csv")
```

**`not` breaks `$in` binding:**
```nu
# WRONG - $in not found inside not (...)
$table | where not ($in.name | str ends-with ".csv")

# CORRECT - negate after the expression
$table | where ($in.name | str ends-with ".csv") == false
```

**Multiple `$in` expressions with `and`/`or` — second `$in` rebinds to the bool result:**
```nu
# WRONG - second $in refers to the bool from first paren, not the row
$table | where ($in.size > 1kb) and ($in.name =~ ".csv")

# CORRECT - use bare column names (preferred for simple comparisons)
$table | where size > 1kb and name =~ ".csv"
# CORRECT - use closure style for complex conditions
$table | where {|row| $row.size > 1kb and $row.name =~ ".csv"}
```

### Filter Gotchas

- **`find` injects ANSI highlight codes** into matched strings — pipe through `ansi strip` to clean
- **`tee` takes a block, not a parameterized closure** — use `tee { $in | length }`, not `tee {|x| ...}`
- **`$in` semantics differ**: in `update` closures, `$in` = cell value; in `insert` closures, `$in` = entire row
- **`length`** only works on lists/tables — not records (`| columns | length`) or strings (`| str length`)
- **`columns`/`items`** only work on records (and `columns` also on tables) — not plain lists
- **`[] | first` / `[] | last`** return `[]` silently instead of erroring
- **`sort-by {} --natural`** fails — `{}` is a record, not a closure. Use `sort --natural` for lists
- **`group-by col --to-table`** produces columns named after the grouper and `items` (not `group`)
- **`select a.b`** on nested records creates a flat column literally named `"a.b"`

## String Commands
| Command | Purpose | Example |
|---------|---------|---------|
| `str trim` | Trim whitespace | `" hi " \| str trim` |
| `str upcase` | Uppercase | `"hi" \| str upcase` |
| `str downcase` | Lowercase | `"HI" \| str downcase` |
| `str replace` | Replace text | `"hi" \| str replace "hi" "hello"` |
| `str contains` | Check substring | `"hello" \| str contains "ell"` |
| `str starts-with` | Check prefix | `"hello" \| str starts-with "he"` |
| `str ends-with` | Check suffix | `"hello" \| str ends-with "lo"` |
| `str substring` | Extract range | `"hello" \| str substring 1..3` |
| `str length` | String length | `"hello" \| str length` |
| `str reverse` | Reverse | `"hello" \| str reverse` |
| `str join` | Join list | `["a" "b"] \| str join ","` |
| `str index-of` | Find position | `"hello" \| str index-of "ll"` |
| `split row` | Split string | `"a,b" \| split row ","` |
| `split column` | Split to table | `"a:b" \| split column ":"` |
| `split chars` | To char list | `"abc" \| split chars` |
| `lines` | Split by newline | `"a\nb" \| lines` |
| `parse` | Extract patterns | `"v1.2" \| parse "v{major}.{minor}"` |
| `fill` | Pad string | `"42" \| fill -a right -c '0' -w 5` |
| `ansi strip` | Remove ANSI codes | `$colored \| ansi strip` |

## Conversion Commands
| Command | Purpose | Example |
|---------|---------|---------|
| `into int` | Convert to int | `"42" \| into int` |
| `into float` | Convert to float | `"3.14" \| into float` |
| `into string` | Convert to string | `42 \| into string` |
| `into bool` | Convert to bool | `1 \| into bool` |
| `into datetime` | Parse date | `"2025-01-15" \| into datetime` |
| `into duration` | Parse duration | `"5sec" \| into duration` |
| `into filesize` | Parse size | `"1gb" \| into filesize` |
| `into binary` | Convert to binary | `"hello" \| into binary` |
| `into record` | Convert to record | `[[k v]; [a 1]] \| into record` |
| `to json` | Serialize JSON | `{a: 1} \| to json` |
| `to csv` | Serialize CSV | `$table \| to csv` |
| `to toml` | Serialize TOML | `{a: 1} \| to toml` |
| `to yaml` | Serialize YAML | `{a: 1} \| to yaml` |
| `to nuon` | Serialize NUON | `{a: 1} \| to nuon` |
| `to text` | Plain text | `$data \| to text` |
| `from json` | Parse JSON | `'{"a":1}' \| from json` |
| `from csv` | Parse CSV | `"a,b\n1,2" \| from csv` |
| `from toml` | Parse TOML | `$toml_str \| from toml` |
| `from yaml` | Parse YAML | `$yaml_str \| from yaml` |
| `from nuon` | Parse NUON | `$nuon_str \| from nuon` |
| `from tsv` | Parse TSV | `$tsv_str \| from tsv` |
| `from xml` | Parse XML | `$xml_str \| from xml` |
| `from ssv` | Parse space-separated | `$ssv_str \| from ssv` |

## Filesystem Commands
| Command | Purpose | Example |
|---------|---------|---------|
| `ls` | List directory | `ls`, `ls **/*.rs` |
| `cd` | Change directory | `cd ~/projects` |
| `open` | Open file (auto-parse) | `open data.json` |
| `open --raw` | Open as raw text | `open --raw file.txt` |
| `save` | Save to file | `$data \| save file.json` |
| `save --append` | Append to file | `"text" \| save --append log.txt` |
| `save -f` | Force overwrite | `$data \| save -f file.json` |
| `cp` | Copy | `cp src dst` |
| `mv` | Move/rename | `mv old new` |
| `rm` | Remove | `rm file`, `rm -r dir` |
| `mkdir` | Create directory | `mkdir path/to/dir` |
| `touch` | Create file | `touch file.txt` |
| `glob` | Find files by pattern | `glob **/*.rs --depth 3` |
| `watch` | Watch for changes | `watch . --glob=**/*.rs {\|\| cargo test}` |

## Path Commands
| Command | Purpose | Example |
|---------|---------|---------|
| `path join` | Join paths | `"/home" \| path join "user"` |
| `path parse` | Parse components | `"/a/b.txt" \| path parse` |
| `path exists` | Check existence | `"/tmp" \| path exists` |
| `path expand` | Resolve path | `"~" \| path expand` |
| `path basename` | File name | `"/a/b.txt" \| path basename` |
| `path dirname` | Directory | `"/a/b.txt" \| path dirname` |

## System Commands
| Command | Purpose |
|---------|---------|
| `sys host` | Host info |
| `sys cpu` | CPU info |
| `sys mem` | Memory info |
| `sys disks` | Disk info |
| `ps` | Process list |
| `which cmd` | Find command |
| `sleep 1sec` | Sleep |

## Math Commands
`math sum` `math avg` `math min` `math max` `math round` `math floor`
`math ceil` `math abs` `math sqrt` `math log`

## Date Commands
```nu
date now                                 # current datetime
date now | date to-timezone "UTC"        # convert timezone
date now | format date "%Y-%m-%d"        # format string
date now | into record                   # {year, month, day, ...}
```

## Random
```nu
random int                               # random integer
random int 1..100                        # in range
random float                             # 0.0..1.0
random bool                              # true or false
random chars --length 16                 # random string
random uuid                             # UUID v4
```

## Debug/Inspect
```nu
42 | describe                            # "int"
$val | describe --detailed               # full type info
debug $val                               # debug representation
metadata $val                            # source info
```
