export def atuin_stat [] {
    {|bg|
        let theme = $env.NU_POWER_THEME.atuin
        if not ($env.ATUIN_SESSION? | is-empty) {
            [$bg '']
        } else {
            ['#504945' '']
        }
    }
}

export-env {
    power register atuin (atuin_stat) {
        on: white
    }
}
