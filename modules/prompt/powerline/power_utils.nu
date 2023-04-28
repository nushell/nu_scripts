export def atuin_stat [] {
    {||
        let theme = $env.NU_POWER_THEME.atuin
        if not ($env.ATUIN_SESSION? | is-empty) {
            $theme.on
        } else {
            $nothing
        }
    }
}

export-env {
    power register atuin (atuin_stat) {
        on: white
    }
}
