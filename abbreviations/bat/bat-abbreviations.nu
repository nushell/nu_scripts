const bat_abbreviations = {
    b: "bat"
    bn: "bat --number"
    bnl: "bat --number --line-range"
    bp: "bat --plain"
    bpl: "bat --plain --line-range"
    bl: "bat --line-range"
}

export-env {
    $env.config.abbreviations = {
        ...$bat_abbreviations
        ...$env.config.abbreviations
    }
}
