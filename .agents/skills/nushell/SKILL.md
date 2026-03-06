---
name: nushell
description: Use when writing or running Nushell commands, scripts, or pipelines - via the Nushell MCP server (mcp__nushell__evaluate), via Bash (nu -c), or in .nu script files. Also use when working with structured data (JSON, YAML, TOML, CSV, Parquet, SQLite), doing ad-hoc data analysis or exploration, or when the user's shell is Nushell.
---

# Using Nushell

Nushell is a structured-data shell. Commands pass **tables, records, and lists** through pipelines - not text.

**Two execution paths:**
- **MCP server**: `mcp__nushell__evaluate` - persistent REPL (variables survive across calls)
- **Bash tool**: `nu -c '<code>'` - one-shot (use single quotes for outer wrapper)

## Critical Rules

**NEVER use bare `print` in MCP stdio mode.** Output will be lost (returns empty `[]`). Use `print -e "msg"` for stderr, or just return the value (implicit return).

**String interpolation uses parentheses, NOT curly braces:**
```nu
# WRONG:  $"hello {$name}"
# CORRECT: $"hello ($name)"
$"($env.HOME)/docs"    $"2 + 2 = (2 + 2)"    $"files: (ls | length)"
```
Gotcha: `$"(some text)"` errors - parens are evaluated as code. Escape literal parens: `\(text\)`.

**No bash syntax:** `cmd1; cmd2` not `&&`, `o+e>|` not `2>&1`, `$env.VAR` not `$VAR`, `(cmd)` not `$(cmd)`.

## Common Mistakes

| Mistake | Fix |
|---------|-----|
| `$"hello {$name}"` | `$"hello ($name)"` |
| `print "msg"` in MCP | `print -e "msg"` or return value |
| `command 2>&1` | `command o+e>\| ...` |
| `$HOME/path` | `$env.HOME` or `$"($env.HOME)/path"` |
| `export FOO=bar` | `$env.FOO = "bar"` |
| Mutating in closure | Use `reduce`, `generate`, or `each` |
| `\u001b` for ANSI | `ansi strip` to remove, `char --unicode '1b'` for ESC |
| `where ($in.a > 1) and ($in.b > 2)` | Second `$in` rebinds to bool. Use bare cols: `where a > 1 and b > 2` |
| `where not ($in.col \| cmd)` | `not` breaks `$in`. Use `where ($in.col \| cmd) == false` |
| `where col \| cmd` (no parens) | Parsed as two pipeline stages. Use `where ($in.col \| cmd)` |

## When to Use Nushell

**Always prefer Nushell for:**
- Any structured data (JSON, YAML, TOML, CSV, Parquet, SQLite) - unifies all formats
- CLI tools with `--json` flags - pipe JSON output directly into Nushell for querying (e.g. `^gh pr list --json title,state | from json`)
- Ad-hoc data analysis and exploration - faster than Python setup
- Initial data science/analytics - histograms, tabular output, basic aggregations
- Polars plugin for large datasets - DataFrames without Python overhead

**Use Bash only when:** bash-specific tooling, MCP unavailable, or bash-syntax integrations.

## Reference Files

Read the relevant file(s) based on what you need:

| File | Read when you need... |
|------|-----------------------|
| [commands.md](references/commands.md) | Command reference tables (filters, strings, conversions, filesystem, math, dates) |
| [types-and-syntax.md](references/types-and-syntax.md) | Type system, string types, operators, variables, control flow, cell-paths |
| [data-analysis.md](references/data-analysis.md) | Format conversion, HTTP, Polars, SQLite, aggregation patterns |
| [advanced.md](references/advanced.md) | Custom commands, modules, error handling, jobs, external commands, env config |
| [bash-equivalents.md](references/bash-equivalents.md) | Complete Bash-to-Nushell translation table |
| [http-transport.md](references/http-transport.md) | Differences when using HTTP transport instead of stdio |

## MCP Server Quick Notes

- `mcp__nushell__evaluate` - run code; `mcp__nushell__list_commands` - discover; `mcp__nushell__command_help` - help
- State persists between calls. `$history` stores prior results (access `$history.0`, etc.)
- Use `| to text` or `| to json` for large outputs. Use `ansi strip` for color removal.
