const exa_abbreviations = {
    x: "exa --icons"
    xa: "exa --icons --all"
    xl: "exa --long"
    xla: "exa --long --all"
    xt: "exa --icons --tree"
    xta: "exa --icons --tree --all"
}

export-env {
    $env.config.abbreviations = {
        ...$exa_abbreviations
        ...$env.config.abbreviations
    }
}
