# Claude Code CLI completions

[Claude Code](https://docs.anthropic.com/en/docs/claude-code) is an agentic coding tool by Anthropic that lives in your terminal.

This completion script covers the `claude` command and its subcommands: `auth`, `mcp`, `plugin`, `agents`, `setup-token`, `doctor`, `update`, `upgrade`, and `install`.

## Install completion script

### Method 1: Use from Git repo

- `git clone https://github.com/nushell/nu_scripts.git`

- Add this to your `$nu.config-path` file:

  ```nu
  source path/to/nu_scripts/custom-completions/claude/claude-completions.nu
  ```

### Method 2: Copy to completions directory

- Copy the _claude-completions.nu_ to the Nu standard completions directory:

  ```nu
  cp custom-completions/claude/claude-completions.nu ($nu.data-dir | path join 'completions')
  ```

- Nushell will automatically load it on next startup.
