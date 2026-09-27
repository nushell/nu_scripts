const chezmoi_abbreviations = {
    ch: "chezmoi"
    chad: "chezmoi add"
    chap: "chezmoi apply"
    chd: "chezmoi diff"
    chda: "chezmoi data"
    chs: "chezmoi status"
}

export-env {
    $env.config.abbreviations = {
        ...$chezmoi_abbreviations
        ...$env.config.abbreviations
    }
}
