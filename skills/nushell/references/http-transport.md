# HTTP Transport Differences

The Nushell MCP server can run in **stdio** (default) or **HTTP** transport mode. Most behavior is identical, but there are key differences to be aware of if using HTTP.

## Parameter Renames

| Tool | stdio parameter | HTTP parameter |
|---|---|---|
| `mcp__nushell__evaluate` | `command` | `input` |
| `mcp__nushell__command_help` | `command` | `name` |

`mcp__nushell__list_commands` uses `find` in both modes.

## Print Behavior

| Pattern | stdio | HTTP |
|---|---|---|
| Bare `print "msg"` | `[]` (lost) | `[]` (lost) |
| `print -e "msg"` (stderr) | Captured | `[]` (lost) |
| Implicit return (just the value) | Works | Works |
| `print -e "msg"; "return val"` | Both visible | Only return value; stderr lost |

**In HTTP mode there is no print workaround.** Always use implicit return (let the last expression be your output).

## Response Format

**stdio** returns a plain output string.

**HTTP** returns a structured envelope:
```
{cwd: "/path", history_index: 3, timestamp: 2026-03-06T..., output: "..."}
```

The `cwd` field is useful for tracking directory changes across calls.

## Error Format

**stdio** returns MCP error strings.

**HTTP** returns MCP error `-32603` with a structured JSON body:
```
{code: "nu::shell::error", msg: "...", labels: [[text, span, line, column]; ...]}
```

`try/catch` works identically in both modes.

## Everything Else Is the Same

These all work identically in both transports:
- Variable, env var, and custom `def` persistence across calls
- `$history` variable and `$env.NU_MCP_OUTPUT_LIMIT` truncation (use filesize type, e.g. `100b`)
- `job spawn` / `job send` / `job recv` (background jobs and mailbox)
- `cd` persistence, `glob`, `open`, `save`, file I/O
- Format conversions (`to json`, `to csv`, `to text`)
- `| complete` for capturing external command stderr/exit codes
- `par-each`, `reduce`, pipelines, closures
- `http get` / `http post`
- `ansi strip`, `list_commands`, `command_help`
