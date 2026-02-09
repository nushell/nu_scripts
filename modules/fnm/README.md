# Fast Node Manager (fnm)

Nushell integration for [Fast Node Manager (fnm)](https://github.com/Schniz/fnm), a fast and simple Node.js version manager. Automatically switches Node.js versions when you `cd` into a directory containing `.nvmrc`, `.node-version`, or `package.json`.

Based on [this GitHub issue](https://github.com/Schniz/fnm/issues/463) and [fnm-nushell](https://github.com/Southclaws/fnm-nushell).

Requires `fnm` to be installed separately.

## Install

Copy or clone `fnm.nu` to a location of your choice and add the following to your Nushell config (`$nu.config-path`):

```nu
use /path/to/fnm.nu
```

It also works from `$nu.user-autoload-dirs` if you prefer autoloading.

## Configuration

All options are configured through `$env.FNM_NU_CONFIG`. Set it in your `config.nu` **before** `use fnm.nu` is evaluated. Every field is optional — defaults are applied for anything you omit.

```nu
$env.FNM_NU_CONFIG = {
    triggers: ['.nvmrc', '.node-version']  # files that trigger a version switch
    auto_install: true                      # install missing versions without prompting
    install_flags: ['--lts']                # extra flags passed to `fnm install`
    fallback_alias: 'default'               # optional stable PATH entry for non-shell processes
}
```

### Options

| Option | Default | Description |
|---|---|---|
| `triggers` | `['.nvmrc', '.node-version', 'package.json']` | Files whose presence triggers `fnm use` on directory change. |
| `auto_install` | `false` | When `true`, missing Node.js versions are installed automatically. When `false`, you get an interactive `[y/N]` prompt. |
| `install_flags` | `[]` | Additional flags forwarded to `fnm install` (e.g. `--progress never`). |
| `fallback_alias` | `null` | An fnm alias (e.g. `'default'`) whose bin directory is added to PATH as a stable fallback. See below. |

Configuration is re-read on every directory change, so you can update `$env.FNM_NU_CONFIG` at any time without restarting the shell.

### Fallback alias

fnm's multishell path is session-specific. If another tool copies your login environment into systemd (or similar), that path won't resolve for non-shell processes like IDEs or background services.

Setting `fallback_alias` to e.g. `'default'` places that alias's bin directory in PATH *below* the multishell path. The active fnm version still takes precedence inside the shell, but non-shell consumers get a stable path to `node`, `pnpm`, and other tools.

_The concrete use case that triggered adding this was [Aspire](https://aspire.dev) launching ViteApp resources without env vars from the shell, and thus the install step failed when looking for pnpm. With `fallback_alias: 'default'`, Aspire can find the default Node.js version even without the multishell path.  So if you're playing around with Aspire and your dashboard yells at you that frontend couldn't start because "**Missing command** Required command 'pnpm' was not found on PATH or at the specified location" - there you go._

## Missing version handling

When you `cd` into a project that requires a Node.js version you don't have installed:

- **`auto_install: true`** — the version is installed and activated automatically.
- **`auto_install: false`** (default) — you see a message and an interactive prompt:

  ```
  fnm: Can't find an installed Node version matching v20.11.0. [y/N]
  ```

  Answering `y` installs and activates the version. Answering anything else skips with a hint to run `fnm install` manually.
