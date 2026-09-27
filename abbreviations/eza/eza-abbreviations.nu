const eza_abbreviations = {
    x: "eza --icons"
    xa: "eza --icons --all"
    xl: "eza --long"
    xla: "eza --long --all"
    xt: "eza --icons --tree"
    xta: "eza --icons --tree --all"
}

export-env {
    $env.config.abbreviations = {
        ...$eza_abbreviations
        ...$env.config.abbreviations
    }
}
