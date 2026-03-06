# Bash to Nushell Translation

## File and Directory Operations

| Bash | Nushell |
|------|---------|
| `ls` | `ls` |
| `ls -la` | `ls --long --all` or `ls -la` |
| `ls -d */` | `ls \| where type == dir` |
| `find . -name "*.rs"` | `glob **/*.rs` or `ls **/*.rs` |
| `mkdir -p path` | `mkdir path` (creates parents automatically) |
| `touch file` | `touch file` |
| `cp src dst` | `cp src dst` |
| `cp -r src dst` | `cp -r src dst` |
| `mv old new` | `mv old new` |
| `rm file` | `rm file` |
| `rm -rf dir` | `rm -r dir` |
| `cat file` | `open --raw file` |
| `head -5 file` | `open --raw file \| lines \| first 5` |
| `tail -5 file` | `open --raw file \| lines \| last 5` |
| `wc -l file` | `open --raw file \| lines \| length` |

## Output Redirection

| Bash | Nushell |
|------|---------|
| `> file` | `o> file` or `\| save file` |
| `>> file` | `o>> file` or `\| save --append file` |
| `> /dev/null` | `\| ignore` |
| `> /dev/null 2>&1` | `o+e>\| ignore` |
| `2>&1` | `o+e>\| ...` |
| `cmd \| tee log \| cmd2` | `cmd \| tee { save log } \| cmd2` |

## Text Processing

| Bash | Nushell |
|------|---------|
| `grep pattern` | `where $it =~ pattern` or `find pattern` |
| `grep -r pattern .` | `open --raw file \| lines \| where $it =~ pattern` |
| `sed 's/old/new/'` | `str replace 'old' 'new'` |
| `sed 's/old/new/g'` | `str replace --all 'old' 'new'` |
| `awk '{print $1}'` | `split column ' ' \| get column0` |
| `sort` | `sort` |
| `sort -u` | `sort \| uniq` |
| `uniq` | `uniq` |
| `cut -d: -f1` | `split column ':' \| get column0` |
| `tr '[:upper:]' '[:lower:]'` | `str downcase` |

## Variables and Environment

| Bash | Nushell |
|------|---------|
| `VAR=value` | `let var = "value"` |
| `export VAR=value` | `$env.VAR = "value"` |
| `echo $VAR` | `$env.VAR` |
| `echo $HOME` | `$env.HOME` |
| `echo $PATH` | `$env.PATH` (list on macOS/Linux) |
| `echo $?` | `$env.LAST_EXIT_CODE` |
| `unset VAR` | `hide-env VAR` |
| `${VAR:-default}` | `$env.VAR? \| default "value"` |
| `export PATH=$PATH:/new` | `$env.PATH = ($env.PATH \| append "/new")` |
| `FOO=bar cmd` | `FOO=bar cmd` (same syntax) |

## Command Execution

| Bash | Nushell |
|------|---------|
| `cmd1 && cmd2` | `cmd1; cmd2` |
| `cmd1 \|\| cmd2` | `try { cmd1 } catch { cmd2 }` |
| `$(command)` | `(command)` |
| `` `command` `` | `(command)` |
| `command &` | `job spawn { command }` |
| `jobs` | `job list` |
| `kill %1` | `job kill $id` |
| `type cmd` | `which cmd` |
| `man cmd` | `help cmd` |
| `bash -c 'code'` | `nu -c 'code'` |
| `source script.sh` | `source script.nu` |

## Control Flow

| Bash | Nushell |
|------|---------|
| `if [ cond ]; then ... fi` | `if $cond { ... }` |
| `[ -f file ]` | `"file" \| path exists` |
| `[ -d dir ]` | `("dir" \| path exists) and ("dir" \| path type) == "dir"` |
| `for f in *.md; do echo $f; done` | `ls *.md \| each { $in.name }` |
| `for i in $(seq 1 10); do ...; done` | `for i in 1..10 { ... }` |
| `while read line; do ...; done < file` | `open file \| lines \| each {\|line\| ... }` |
| `case $x in ... esac` | `match $x { pattern => result, ... }` |

## Pipes and Subshells

| Bash | Nushell |
|------|---------|
| `cmd \| head -5` | `cmd \| first 5` |
| `cmd \| tail -5` | `cmd \| last 5` |
| `\` (line continuation) | `(` wrap in parens `)` |
| `read var` | `let var = (input)` |
| `read -s secret` | `let secret = (input -s)` |

## History

| Bash | Nushell |
|------|---------|
| `!!` | `!!` (inserts, doesn't execute) |
| `!$` | `!$` |
| `Ctrl+R` | `Ctrl+R` |

## Key Behavioral Differences

1. **Structured vs text**: Nushell pipelines pass tables/records, not text streams
2. **Immutable by default**: `let` is immutable; use `mut` when needed
3. **No word splitting**: Nushell doesn't split variables on whitespace
4. **No glob expansion in variables**: Globs only expand in command position
5. **Static parsing**: Code is parsed before execution; no `eval` equivalent
6. **Implicit return**: Last expression is the return value; no `echo` needed
7. **`>` is comparison**: Use `o>` or `save` for file redirection
