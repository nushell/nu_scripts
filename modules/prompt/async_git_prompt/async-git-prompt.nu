# This module exports commands for creating a nushell prompt that computes git status (staged and
# unstaged changes) asynchronously. This can be useful in large git repos when it is slow to obtain
# this information synchronously.

# See README.md for usage.

def unstaged-symbol [] { 'અ' }
def staged-symbol [] { 'જ' }
def in-progress-symbol [] { '…' }
def cached-result-symbol [] { $"·" } #〈
def cache-file [] { '.nu-async-git-prompt-cache'}

def do-async [commands: string] {
    bash -c $"nu -c '($commands)' &"
}

export def async-git-prompt-string [] {
    let cache_path = (cache-path)
    if ($cache_path | is-empty) {
        ""
    } else if ($cache_path | path exists) {
        $"(cached-result-symbol)(open $cache_path | str trim)"
    } else {
        async-git-prompt-compute-sync
    }
}

export def async-git-prompt-compute-sync [] {
    let unstaged = {
        let symbol = if ((git diff --quiet | complete).exit_code == 1) {
            (unstaged-symbol)
        } else {
            ''
        }
        { unstaged: $symbol}
    }
    let staged = {
        let symbol = if ((git diff --cached --quiet | complete).exit_code == 1) {
            (staged-symbol)
        } else {
            ''
        }
        { staged: $symbol}
    }
    # Execute the two slow git commands in parallel and merge the results into a single record
    let symbols = ([ $unstaged $staged ] | par-each { |it| do $it } | reduce {|a b| $a | merge {$b}})

    $"($symbols | get 'unstaged') ($symbols | get 'staged')" | str trim
}

export def async-git-prompt-refresh-cache [] {
    let cache_path = (cache-path)
    if ($cache_path != null) {
        echo (in-progress-symbol) | save $cache_path
        do-async $"use ($nu.config-path | path expand | path dirname)/async-git-prompt.nu *; async-git-prompt-compute-sync | save ($cache_path)"
    }
}

export def async-git-prompt-delete-cache [] {
    let cache_path = (cache-path)
    if ($cache_path != null) {
        rm -f $cache_path
    }
}

def cache-path [] {
    let dir = if ('.git' | path exists) {
        '.'
    } else {
        do -i { git rev-parse --show-toplevel | str trim -r }
    }
    if ($dir | is-empty) {
        null
    } else {
        $dir | path join (cache-file)
    }
}
