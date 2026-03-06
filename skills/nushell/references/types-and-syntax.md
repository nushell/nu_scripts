# Nushell Types and Syntax Reference

## Data Types

| Type | Literal | Example |
|------|---------|---------|
| int | decimal, hex, octal, binary | `42`, `0xff`, `0o77`, `0b1010`, `100_000` |
| float | decimal point, scientific | `3.14`, `-2.5e10`, `Infinity`, `NaN` |
| string | quotes | `'single'`, `"double\n"`, `` `backtick` ``, `r#'raw'#` |
| bool | literal | `true`, `false` |
| duration | number + unit | `5sec`, `3min`, `2hr`, `1day`, `500ms`, `100ns`, `2wk` |
| filesize | number + unit | `64mb`, `1.5gb`, `10kib`, `2gib` |
| date | ISO format | `2025-01-15`, `2025-01-15T10:30:00-05:00` |
| range | `..` syntax | `1..5`, `0..<10`, `5..1`, `0..2..10` (step) |
| list | `[]` | `[1 2 3]`, `["a", "b"]`, `["mixed" 42 true]` |
| record | `{}` | `{name: "nu", ver: 1}`, `{"spaced key": true}` |
| table | list of records | `[{a: 1}, {a: 2}]`, `[[a b]; [1 2] [3 4]]` |
| nothing | `null` | `null` |
| binary | `0x[]` | `0x[FF EE]`, `0o[377]`, `0b[11111111]` |
| closure | `{\|\| }` | `{\|x\| $x + 1}`, `{\|x, y\| $x + $y}` |
| cell-path | dot notation | `$.name`, `$.0`, `$.users.0.name`, `$.field?` |
| glob | backtick | `` `**/*.rs` `` |

## String Types in Detail

**Single-quoted** - no escape processing:
```nu
'C:\path\to\file'          # backslashes are literal
'no\nescape'               # literal \n, not newline
```

**Double-quoted** - C-style escapes:
```nu
"line1\nline2"             # newline
"tab\there"                # tab
"quote: \""                # escaped quote
"\u{1F600}"                # unicode codepoint
```
Escapes: `\"` `\'` `\\` `\/` `\b` `\f` `\r` `\n` `\t` `\u{X...}`

**Raw strings** - literal, can contain any quotes:
```nu
r#'Contains "double" and 'single' quotes'#
r##'Even r#'nested raw'# strings'##
```

**Backtick strings** - for paths/globs with spaces:
```nu
ls `./my directory`
ls `**/*.{rs,toml}`
```

**String interpolation** - `$"..."` or `$'...'`:
```nu
let name = "world"
$"Hello, ($name)!"                      # variable
$"2 + 2 = (2 + 2)"                      # expression
$"files: (ls | length)"                  # command
$"escaped parens: \(not code\)"          # literal parens
$'single-quote interp: ($name)'         # no escape processing
```

## Duration and Filesize Units

**Duration**: `ns` `us` `ms` `sec` `min` `hr` `day` `wk` - supports arithmetic: `5sec + 2min`

**Filesize (base-10)**: `b` `kb` `mb` `gb` `tb` `pb` `eb`
**Filesize (base-2)**: `kib` `mib` `gib` `tib` `pib` `eib` - supports arithmetic: `1gb + 500mb`

## Ranges

```nu
1..5                   # inclusive: [1, 2, 3, 4, 5]
0..<5                  # exclusive end: [0, 1, 2, 3, 4]
5..1                   # reverse: [5, 4, 3, 2, 1]
0..2..10               # step by 2: [0, 2, 4, 6, 8, 10]
```

## Variables

```nu
let x = 42           # immutable (preferred)
mut y = 0             # mutable (cannot be captured by closures)
const FILE = "a.nu"   # parse-time constant (use with source/use)
```

**Closures cannot capture `mut` variables.** Use `reduce`, `generate`, or `each` instead.

## Operators

### Arithmetic
`+` `-` `*` `/` `//` (floor div) `mod` `**` (power)

### Comparison
`==` `!=` `<` `<=` `>` `>=`

### String/Pattern
`=~` or `like` (regex match), `!~` or `not-like` (regex non-match)
`starts-with` `ends-with` `in` `not-in` `has` `not-has`

### Logical
`not` `and` `or` `xor` (all short-circuit except xor)

### Bitwise
`bit-and` `bit-or` `bit-xor` `bit-shl` `bit-shr`

### Assignment
`=` `+=` `-=` `*=` `/=` `++=` (append)

### Concatenation
`++` (append lists or strings)

### Precedence (high to low)
1. Parentheses
2. `**`
3. `*` `/` `//` `mod`
4. `+` `-`
5. `bit-shl` `bit-shr`
6. Comparison, membership, regex
7. `bit-and` -> `bit-xor` -> `bit-or`
8. `and` -> `xor` -> `or`
9. Assignment
10. `not`

## Control Flow

```nu
# if/else (returns value)
let size = if $x > 100 { "big" } else if $x > 10 { "medium" } else { "small" }

# match (pattern matching)
match $val {
    1..10 => "small"
    "hello" => "greeting"
    {name: $n} => $"found ($n)"     # record destructuring
    $x if $x > 100 => "big"        # guard clause
    _ => "other"                    # default
}

# loops (prefer each/par-each for functional style)
for item in $list { ... }
while $cond { ... }
loop { if $done { break }; ... }
```

## Accessing Structured Data

```nu
$record.field                  # record field
$list.2                        # list index
$table | get column            # column values as list
$table | select col1 col2      # subtable with columns
$data.users.0.name             # nested access
$data.field?                   # optional (returns null if missing)
$data.field? | default "fallback"  # with default
```

**`get` vs `select`**: `get name` returns a flat list of values. `select name` returns a table preserving column structure.

## Records

```nu
{a: 1, b: 2} | insert c 3     # add field
{a: 1, b: 2} | update a 10    # modify field
{a: 1, b: 2} | merge {c: 3}   # combine records
{...$rec1, ...$rec2, d: 4}    # spread syntax
{a: 1, b: 2} | transpose k v  # to table
{a: 1, b: 2} | items {|k,v| $"($k)=($v)"}  # iterate
{a: 1, b: 2} | columns        # ["a", "b"]
{a: 1, b: 2} | values         # [1, 2]
```

## Lists

```nu
[1 2 3] | append 4            # add to end
[1 2 3] | prepend 0           # add to start
[1 2 3] ++ [4 5]              # concatenate
[1 2 3] | insert 1 99         # insert at index
[1 2 3] | each {|x| $x * 2}  # transform
[1 2 3] | par-each {|x| $x * 2}  # parallel transform
[1 2 3] | where $it > 1       # filter
[1 2 3] | reduce {|it, acc| $acc + $it}  # fold
[1 2 3] | any {|x| $x > 2}   # test any
[1 2 3] | all {|x| $x > 0}   # test all
[1 [2 3] [4]] | flatten       # unnest
```

## Tables

```nu
$table | sort-by column_name
$table | group-by column --to-table
$table | rename new_col1 new_col2
$table | reject unwanted_col
$table | move col --after other_col
$table | enumerate | flatten   # add index column
```

## Special Variables

| Variable | Purpose |
|----------|---------|
| `$in` | Pipeline input to current expression |
| `$it` | Current item in `where` row conditions |
| `$env` | Environment variables and config |
| `$nu` | System info, paths, runtime (`$nu.home-dir`, `$nu.default-config-dir`, `$nu.os-info`, `$nu.pid`) |
| `$env.config` | Nushell configuration record |
| `$env.LAST_EXIT_CODE` | Last external command exit code |
| `$env.CMD_DURATION_MS` | Last command duration in ms |
| `$env.CURRENT_FILE` | Current script/module file path |
| `$env.PATH` / `$env.Path` | Executable search path (macOS-Linux / Windows); list with `ENV_CONVERSIONS`, string otherwise |
