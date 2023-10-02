$env.config.hooks.env_change.PWD = ($env.config.hooks.env_change.PWD | append { ||
        if (which direnv | is-empty) {
            return
        }

        direnv export json | from json | default {} | load-env
    }
)
