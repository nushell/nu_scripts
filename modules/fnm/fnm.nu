# fnm.nu - Fast Node Manager integration for Nushell
#
# Automatically switches Node.js versions when changing directories.
# To configure, set $env.FNM_NU_CONFIG in your config.nu:
#   $env.FNM_NU_CONFIG = {
#     triggers: ['.nvmrc', '.node-version'] # Files to watch for
#     auto_install: false # Install missing versions without prompting
#     install_flags: [] # Flags passed to `fnm install`
#     fallback_alias: 'default' # Optional: add a fallback fnm alias to PATH for systemd/non-shell processes
#   }
#
# The fallback_alias option is useful when another script (e.g. for login sessions) copies
# environment variables into systemd so that non-shell processes get access to Node.js tools.
# Without a fallback, the multishell path alone won't help those processes since it's
# session-specific. Setting fallback_alias to e.g. 'default' places that fnm alias's bin
# directory in PATH as a stable fallback, giving tools like pnpm to systemd services, IDEs,
# and other non-shell consumers.

export-env {
    if (which fnm | is-empty) { return }

    # 1. Initialize fnm environment variables
    # We wrap in try/catch to ensure shell startup doesn't crash if fnm is broken
    try {
        ^fnm env --json | from json | load-env
    } catch {
        return
    }

    # 2. Build PATH array with multishell path first, then fallback alias if configured
    # Multishell path is prepended so fnm's node/npm always takes precedence.
    let multishell_bin = if $nu.os-info.name == 'windows' { $env.FNM_MULTISHELL_PATH } else { $env.FNM_MULTISHELL_PATH | path join "bin" }

    # Load user config with defaults
    let fnm_config = {
        triggers: ['.nvmrc', '.node-version', 'package.json']
        auto_install: false
        install_flags: []
        fallback_alias: null
    } | merge ($env.FNM_NU_CONFIG? | default {})

    # If a fallback alias is set, resolve its bin directory under fnm's aliases dir.
    # This path sits below the multishell path in precedence, so the active fnm version
    # always wins. But when multishell isn't meaningful (e.g. systemd importing PATH from
    # a login session), the fallback alias provides a stable path to node/pnpm/etc.
    let fallback_bin = if $fnm_config.fallback_alias != null {
        $env.FNM_DIR | path join $"aliases/($fnm_config.fallback_alias)/bin"
    } else { null }

    $env.PATH = (
        $env.PATH
        | prepend (if $fallback_bin != null { [$fallback_bin] } else { [] })
        | prepend $multishell_bin
        | uniq
    )

    # 3. Register PWD change hook
    # Ensure config structure exists
    $env.config = (
        $env.config?
        | default {}
        | upsert hooks { default {} }
        | upsert hooks.env_change { default {} }
        | upsert hooks.env_change.PWD { default [] }
    )

    # Check if hook is already registered to avoid duplication
    let is_hooked = ($env.config.hooks.env_change.PWD | any {|h| try { $h.__fnm_hook } catch { false } })

    if not $is_hooked {
        $env.config.hooks.env_change.PWD = ($env.config.hooks.env_change.PWD | append {
            __fnm_hook: true # Marker to identify this hook
            code: {|before, after|
                # Load user config dynamically so changes take effect without restarting
                let fnm_config = {
                    triggers: ['.nvmrc', '.node-version', 'package.json']
                    auto_install: false
                    install_flags: []
                    fallback_alias: null
                } | merge ($env.FNM_NU_CONFIG? | default {})

                # Only run if a trigger file exists in the new directory
                if not ($fnm_config.triggers | any {|f| $after | path join $f | path exists }) {
                    return
                }

                # Try to switch version
                let res = (do { ^fnm use --silent-if-unchanged } | complete)
                if $res.exit_code == 0 { return }

                # Trim "error: " prefix from fnm output (case-insensitive for robustness)
                let err_msg = ($res.stderr | str trim | str replace -r -a '(?i)^error:\s*' '')

                if $fnm_config.auto_install {
                    print $"(ansi yellow_bold)fnm:(ansi reset) ($err_msg). Installing..."
                    let install_res = (do { ^fnm install ...$fnm_config.install_flags } | complete)
                    if $install_res.exit_code != 0 {
                        print $"(ansi red_bold)fnm:(ansi reset) Install failed."
                        return
                    }
                    ^fnm use
                } else {
                    print $"(ansi yellow_bold)fnm:(ansi reset) ($err_msg)"
                    let answer = (input "Install it? [y/N] ")
                    if ($answer | str downcase) == "y" {
                        let install_res = (do { ^fnm install ...$fnm_config.install_flags } | complete)
                        if $install_res.exit_code != 0 {
                            print $"(ansi red_bold)fnm:(ansi reset) Install failed."
                            return
                        }
                        ^fnm use
                    } else {
                        print $"(ansi red_dimmed)Skipping. Run (ansi reset)(ansi green)fnm install(ansi reset)(ansi red_dimmed) manually.(ansi reset)"
                    }
                }
            }
        })
    }
}
