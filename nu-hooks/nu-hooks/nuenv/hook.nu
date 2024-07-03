const NUENV_FILE = ($nu.cache-dir | path join 'nuenv' 'allowed.txt')

def get-allowed []: [ nothing -> list<string> ] {
    if ($NUENV_FILE | path exists) {
        open $NUENV_FILE | lines
    } else {
        []
    }
}

# setup a hook that will try to load `.env.nu` if it is allowed
#
# # Example
# ```nushell
# use nu-hooks/nuenv/hook.nu [ "nuenv allow", "nuenv disallow" ]
# $env.config.hooks.env_change.PWD = (use nu-hooks/nuenv/hook.nu; hook setup)
# ```
export def setup []: [ nothing -> record<condition: closure, code: string> ] {
    {
        condition: {|_, after| $after | path join '.env.nu' | path exists }
        code: $"
            let allowed = if \('($NUENV_FILE)' | path exists\) {
                open ($NUENV_FILE) | lines
            } else {
                []
            }

            if \(open .env.nu | hash sha256\) not-in $allowed {
                error make --unspanned {
                    msg: $'\(ansi purple\)\('.env.nu' | path expand\)\(ansi reset\) is not allowed',
                    help: $'please run \(ansi default_dimmed\)nuenv allow\(ansi reset\) first',
                }
            }

            print $'[\(ansi yellow_bold\)nu-hooks nuenv\(ansi reset\)] loading env file \(ansi purple\).env.nu\(ansi reset\)'
            source .env.nu
        "
    }
}

def _log [msg: string, color: string] {
    print $'[(ansi $color)nuenv(ansi reset)] (ansi purple)(".env.nu" | path expand)(ansi reset) ($msg)'
}

def warning [msg: string] {
    _log $msg "yellow_bold"
}

def info [msg: string] {
    _log $msg "green_bold"
}

def check-env-file [] {
    if not (".env.nu" | path exists) {
        error make --unspanned {
            msg: $"(ansi red_bold)env file not found(ansi reset)",
            help: $"no (ansi yellow).env.nu(ansi reset) in (ansi purple)(pwd)(ansi reset)",
        }
    }
}

# adds `./.env.nu` to the list of allowed "env" files
export def "nuenv allow" [] {
    check-env-file

    let allowed = get-allowed

    let hash = open .env.nu | hash sha256
    if $hash in $allowed {
        warning "is already allowed"
        return
    }

    mkdir ($nu.cache-dir | path join "nuenv")
    $hash | $in + "\n" out>> $NUENV_FILE
    info "has been allowed"
}

# removes `./.env.nu` from the list of allowed "env" files
export def "nuenv disallow" [] {
    check-env-file

    let allowed = get-allowed

    let hash = open .env.nu | hash sha256
    if $hash not-in $allowed {
        warning "is already disallowed"
        return
    }

    $allowed | find --invert $hash | to text | save --force $NUENV_FILE
    info "has been disallowed"
}
