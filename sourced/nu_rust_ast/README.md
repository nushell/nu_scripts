# Rust Symbol Harvesting with Nushell 🌾
**A CLI Tool for Structured Symbol Analysis of Rust Projects**

- Actively Maintained at: https://github.com/graves/nu_rust_ast
- Written By: Thomas Gentry \<thomas@awfulsec.com\>

## 🎉 What This Does

`rust-ast` **harvests symbols** from Rust projects into structured Nushell records. It uses `ast-grep` to:

- Extract **Rust items**: `fn`, `extern_fn`, `struct`, `enum`, `type`, `trait`, `impl`, `mod`, `macro_rules`, `const`, `static`, `use`
- Normalize metadata (file, span, visibility, Fully Qualified Paths)
- Capture **Rustdoc comments** and **full source bodies** (when applicable)
- Estimate token counts for doc/comments and bodies
- Map **function definitions to call sites** within your codebase

Think of it as a Nushell-first *Rust AST explorer*. Perfect for reverse-engineering, code analysis, and documentation generation.

---

## 🧠 Core Features

### 1. Structured Symbol Tables

Each row represents a Rust symbol with:

| Field                | Description                                                                                                  |
|----------------------|--------------------------------------------------------------------------------------------------------------|
| `kind`               | `'fn'`, `'struct'`, `'enum'`, `'trait'`, `'impl'`, `'mod'`, …                                                |
| `name`               | Best-effort symbol name (`'*'` for grouped-use leaves; file name for synthetic file `mod`s)                 |
| `crate`              | Package name from `Cargo.toml` (fallback: `"crate"`)                                                         |
| `module_path`        | Module path under `src/` as a list (e.g., `["foo","bar"]`)                                                   |
| `fqpath`             | Canonical path (`crate::foo::Bar`, UFCS for trait methods when needed)                                       |
| `visibility`         | `pub`, `private`, `pub(crate)`, etc.                                                                         |
| `file`               | Absolute file path                                                                                           |
| `span`               | `{ start_line, end_line, start_byte, end_byte }` (lines 1-based inclusive; bytes from ast-grep)             |
| `attrs`              | Reserved (empty)                                                                                              |
| `signature`          | Single-line preamble (no body)                                                                               |
| `has_body`           | Whether the item has a `{ … }` body                                                                          |
| `async/unsafe/const` | Bool flags parsed from signature                                                                             |
| `abi/generics/where` | Extra meta when present                                                                                      |
| `doc`                | Verbatim rustdoc or inner file docs                                                                          |
| `impl_of`            | For `impl` and methods: `{ trait_path?, type_path? }`                                                        |
| `trait_items`        | Reserved                                                                                                     |
| `reexports`          | Reserved                                                                                                     |
| `body_text`          | Exact matched text or whole file for synthetic file `mod`s                                                   |
| `synthetic`          | True for synthetic file `mod` rows                                                                           |
| `doc_tokens`         | Token estimate for `doc`                                                                                     |
| `body_tokens`        | Token estimate for `body_text`                                                                               |

### 2. `ast-grep` Integration

- Uses `ast-grep --json=stream` to parse Rust
- Patterns cover bodies, decls, generics, where clauses, etc.

### 3. Optimized for Large Projects

- Synthesizes “file module” rows for `src/foo.rs` / `src/foo/mod.rs`
- Normalizes module paths directly from the filesystem layout

### 4. Rustdoc & Token Counts

- Extracts leading `///`, `#[doc = "..."]`, `/** ... */`, and file inner docs (`//!`, `/*! ... */`)
- Token estimation mode configurable via `RUST_AST_TOKENIZER` (`words` default; `chars`; or `tiktoken` if you wire it up)

### 5. Call Site Analysis

- Finds simple call sites (`foo(...)`, `Type::foo(...)`, `recv.foo(...)`)
- Attaches a `callers` list (as FQ paths) to function definitions

---

## 📦 Functions in this Script

### `rust-ast [...paths]`
Flat table of symbols and metadata (see fields above). Public entry point.

### `rust-tree [...paths] [--include-use]`
Builds a **nested** tree of minimal nodes for pretty printing:
```nu
{ kind, name, fqpath, children: [ ... ] }
```

### `rust-print-symbol-tree [--fq-branches] [--tokens]`
Pretty-prints the nested tree with aligned columns:

- **Name** (ASCII tree branches + colorized name)
- **Kind** (colorized + padded)
- **FQ Path** (shown on leaves; optionally on branches)
- **Tokens** (optional rightmost column showing `Body Tokens: N, Doc Tokens: M`)
- Token sub-columns are **right-aligned** per number so all counts line up.

Color is applied via `_paint-kind` using `ansi`. All alignment uses `_vlen`, which strips ANSI before measuring. Works even if your terminal doesn’t support color.

### `rust-print-call-graph <pattern> [--max-depth N] [--reverse] [--show-roots]`
Visualizes function call relationships as a tree.

- Useful for answering the question: **_"What codepaths could be traversed whenever X is called?"_**
- `--reverse:` Bottom-up callers view. Start from target and walk upward through its parents.
- `--max-depth:` Limit traversal depth (default: 3).
- `--show-roots:` Print a one-line header describing the direction and depth.

### `rust-print-dep-usage [dep?] [--max-depth N] [--include-maybe] [--records]`
Analyze how external dependencies are **used in your codebase** and visualize their call graph impact.

- **`dep?`**: Optional crate name to focus on (case-insensitive). If omitted, all detected dependencies are shown.  
- `--reverse:` Bottom-up callers view. Start from target and walk upward through its parents.
- `--max-depth`: Limit call graph depth (default: 4).  
- `--include-maybe`: Include heuristic matches from glob imports (e.g., `use foo::*;`).  
- `--records`: Output as structured Nushell records (instead of colorized text). Useful for post-processing with `where`, `get`, `select`, etc.


---

## 🔧 Installation

```nu
# ast-grep
brew install ast-grep

# Put the script somewhere Nushell will load it from, e.g.:
cd $"($nu.data-dir)/scripts"
curl -L https://raw.githubusercontent.com/graves/nu_rust_ast/refs/heads/main/rust_ast.nu -o $"($nu.data-dir)/scripts/rust_ast.nu"
```

Add to your Nushell config (`$nu.config-path`):

```nu
use $"($nu.data-dir)/scripts/rust_ast.nu" *
```

Reload your shell.

> **Optional:** tokenization behavior  
> - `RUST_AST_TOKENIZER=words` (default): fast, word-ish counting  
> - `RUST_AST_TOKENIZER=chars`: ~1 token per 4 chars heuristic  
> - `RUST_AST_TOKENIZER=tiktoken`: route to your `_token-count-via-tiktoken` if you implement it

---

## 🧪 Examples

### 1. Explore call relationships

```nu
rust-ast |
  where kind == 'fn' |
  select name fqpath callers |
  sort-by fqpath
```

### 2. Inspect docs and bodies for a specific function

```nu
rust-ast |
  where kind == 'fn' and name == 'search' |
  select doc doc_tokens body_text body_tokens
```
```text
╭──────┬──────────────────────────────────────────────────────────────────────────────┬───────────────┬─────────────────────────────────────────────────────────────────────────────────────────────┬───────────────╮
│    # │                                     doc                                      │  doc_tokens   │                                          body_text                                          │  body_tokens  │
├──────┼──────────────────────────────────────────────────────────────────────────────┼───────────────┼─────────────────────────────────────────────────────────────────────────────────────────────┼───────────────┤
│    0 │     /// Query the index for the `top_k` nearest vectors to `vector`.         │            60 │ pub fn search(&self, vector: &[f32], top_k: usize) -> Result<Vec<usize>, &'static str> {    │            24 │
│      │     ///                                                                      │               │         if vector.len() != self.dimension {                                                 │               │
│      │     /// # Parameters                                                         │               │             return Err("dimension mismatch");                                               │               │
│      │     /// - `vector`: Query vector; must have length `dimension`.              │               │         }                                                                                   │               │
│      │     /// - `top_k`: Number of nearest IDs to return.                          │               │         Ok(self.index.search(vector, top_k))                                                │               │
│      │     ///                                                                      │               │     }                                                                                       │               │
│      │     /// # Returns                                                            │               │                                                                                             │               │
│      │     /// A `Vec<usize>` of IDs sorted by increasing distance (best first).    │               │                                                                                             │               │
│      │     ///                                                                      │               │                                                                                             │               │
│      │     /// # Errors                                                             │               │                                                                                             │               │
│      │     /// - `"dimension mismatch"` if `vector.len() != self.dimension`.        │               │                                                                                             │               │
╰──────┴──────────────────────────────────────────────────────────────────────────────┴───────────────┴─────────────────────────────────────────────────────────────────────────────────────────────┴───────────────
````

### 3. Show signatures and body token counts

```nu
rust-ast |
  where kind == 'fn' and name == 'search' |
  select signature body_tokens
```
```text
╭───┬────────────────────────────────────────────────────────────────────────────────────────┬─────────────╮
│ # │                                       signature                                        │ body_tokens │
├───┼────────────────────────────────────────────────────────────────────────────────────────┼─────────────┤
│ 0 │ pub fn search(&self, vector: &[f32], top_k: usize) -> Result<Vec<usize>, &'static str> │          24 │
╰───┴────────────────────────────────────────────────────────────────────────────────────────┴─────────────╯
```

### 4. Print a **colorized** symbol tree

```nu
rust-tree | rust-print-symbol-tree
```
![Print Symbol Tree Screenshot](./rust-print-symbol-tree.png)

### 5. Take advantage of **Nushell's built in regex matching** inside queries

```nu
 rust-ast |
  where kind == 'fn' and name =~ 'test_' |
  select signature body_tokens
```
```text
╭───┬────────────────────────────────────────────────────────────┬─────────────╮
│ # │                         signature                          │ body_tokens │
├───┼────────────────────────────────────────────────────────────┼─────────────┤
│ 0 │ async fn test_create_client()                              │          19 │
│ 1 │ async fn test_prepare_messages()                           │          68 │
│ 2 │ fn test_load_config_valid_file()                           │          88 │
│ 3 │ fn test_load_config_invalid_file()                         │           9 │
│ 4 │ fn test_load_config_invalid_format()                       │          18 │
│ 5 │ async fn test_load_template_valid_file()                   │          99 │
│ 6 │ async fn test_load_template_invalid_file()                 │          15 │
│ 7 │ async fn test_load_template_invalid_format()               │          83 │
│ 8 │ async fn test_vector_store() -> Result<(), Box<dyn Error>> │          51 │
╰───┴────────────────────────────────────────────────────────────┴─────────────╯
```

### 6. Show **token counts** with aligned sub-columns in the symbol tree

```nu
rust-tree | rust-print-symbol-tree --tokens
```

### 7. Explore call graphs

Default callers view:
```nu
rust-print-call-graph crate::api::prepare_messages --max-depth 5 --show-roots
```
```text
Call graph depth: 5 ← callers crate::api::prepare_messages
test_prepare_messages  [crate::api::test_prepare_messages]
|  `- prepare_messages  [crate::api::prepare_messages]
main  [crate::main]
   `- run  [crate::run]
      |- handle_ask_command  [crate::handle_ask_command]
      |  `- ask  [crate::api::ask]
      |     `- get_session_messages  [crate::api::get_session_messages]
      |        |- prepare_messages  [crate::api::prepare_messages]
      |        `- prepare_messages_for_existing_session  [crate::api::prepare_messages_for_existing_session]
      |           `- prepare_messages  [crate::api::prepare_messages]
      `- handle_interactive_command  [crate::handle_interactive_command]
         `- interactive_mode  [crate::api::interactive_mode]
            `- get_session_messages  [crate::api::get_session_messages]
               |- prepare_messages  [crate::api::prepare_messages]
               `- prepare_messages_for_existing_session  [crate::api::prepare_messages_for_existing_session]
````

Bottom-up callers view:
```nu
rust-print-call-graph crate::api::prepare_messages --reverse --max-depth 5 --show-roots
```
```
Call graph depth: 5 ← callers (inverted) crate::api::prepare_messages
prepare_messages  [crate::api::prepare_messages]
|- get_session_messages  [crate::api::get_session_messages]
|  |- ask  [crate::api::ask]
|  |  `- handle_ask_command  [crate::handle_ask_command]
|  |     `- run  [crate::run]
|  |        `- main  [crate::main]
|  `- interactive_mode  [crate::api::interactive_mode]
|     `- handle_interactive_command  [crate::handle_interactive_command]
|        `- run  [crate::run]
|           `- main  [crate::main]
|- prepare_messages_for_existing_session  [crate::api::prepare_messages_for_existing_session]
|  `- get_session_messages  [crate::api::get_session_messages]
|     |- ask  [crate::api::ask]
|     |  `- handle_ask_command  [crate::handle_ask_command]
|     |     `- run  [crate::run]
|     `- interactive_mode  [crate::api::interactive_mode]
|        `- handle_interactive_command  [crate::handle_interactive_command]
|           `- run  [crate::run]
`- test_prepare_messages  [crate::api::test_prepare_messages]
```

### 8. Find all call sites where external dependencies are used

Example (text view):
```nu
rust-print-dep-usage crossterm --max-depth 5 --include-maybe
```
```text
Dependency usage: crossterm
direct references
interactive_mode  [crate::api::interactive_mode] uses: cursor::position
main  [crate::main]
   `- run  [crate::run]
      `- handle_interactive_command  [crate::handle_interactive_command]
         `- interactive_mode  [crate::api::interactive_mode]
```

Example (text view, reversed):
```nu
rust-print-dep-usage crossterm --max-depth 5 --include-maybe --reverse
```
```text
Dependency usage: crossterm
direct references
interactive_mode  [crate::api::interactive_mode] uses: cursor::position
`- handle_interactive_command  [crate::handle_interactive_command]
   `- run  [crate::run]
      `- main  [crate::main]
```

Example (records view):
```nu
rust-print-dep-usage --max-depth 5 --include-maybe --records
```
```text
╭───┬────────────┬───────────────┬──────────────────────────────────────────────╮
│ # │   crate    │   category    │                   symbol                     │
├───┼────────────┼───────────────┼──────────────────────────────────────────────┤
│ 0 │ crossterm  │ direct        │ crate::api::interactive_mode                 │
│ 1 │ crossterm  │ maybe (glob)  │ crate::api::ask                              │
│ 2 │ diesel     │ direct        │ crate::session_messages::SessionMessages::…  │
╰───┴────────────┴───────────────┴──────────────────────────────────────────────╯
```

---

## 🙋🏻‍♀️ Why This Matters

Use it to:

- **Debug** complex relationships (trait impls, method resolution).
- **Generate docs** from raw source.
- **Analyze structure** for refactors and performance work.
- **Revive a Rust project** that won't build and thus cannot make use of `rust-analyzer`.

It helps answer the questions:

> "What is this?", "Where did it come from?", "What does it do?", "Is it documented?", "What’s it related to?", "How do we remove it?"

with actionable metadata.

---

## 🧩 Limitations & Tips

- **Performance:** On huge crates, filter early (e.g., `where kind == 'fn'`) or scope paths.
- **Module Paths:** File-based `mod` rows reflect filesystem layout, not necessarily `use` resolution.
- **ANSI:** We color via Nushell’s `ansi` command. Spacing is computed on **stripped** strings, so alignment holds even with color.
- **Token counts:** Heuristic by default unless you wire up `_token-count-via-tiktoken`.
- **Inverted callers view**: avoids explosion by stopping at known roots.
- **Cyclical dependencies**: Cycles are marked with (⟲ cycle).
  - Duplicate expansions are skipped once visited.

---

## 📚 Further Reading

- [Ast-grep Documentation](https://ast-grep.github.io/reference/cli.html)  
- [Nushell Commands](https://www.nushell.sh/commands/)  

---

## 📄 License

Creative Commons Zero v1.0 Universal (CC0-1.0).  
If you use this to document your code, high-five ✋

---

## 🤝 Contributing / Questions

PRs and issues welcome.  
Questions? Ping me via email.

— *Written by [Thomas Gentry](https://awfulsec.com) – a real human bean.* 🫛
