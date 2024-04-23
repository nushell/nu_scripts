export def atuin_stat [] {
    {|bg|
        let theme = $env.NU_POWER_THEME.atuin
        if ($env.ATUIN_SESSION? | is-not-empty) {
            [$bg '']
        } else {
            ['#504945' '']
        }
    }
}

export-env {
    power register atuin (atuin_stat) {
        theme: {
            on: white
        }
    }
}
