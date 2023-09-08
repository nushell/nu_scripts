export-env {
    def fnm-env [] {
        mut env_vars = {}
        let pwsh_vars = (^fnm env --shell power-shell)
        let var_table = ($pwsh_vars
            | lines
            | parse "$env:{key} = \"{value}\""
        )
        for v in $var_table  {
            mut value: any = null
            if ($v.key | str downcase) == 'path' {
                $value = ($v.value | split row (char esep))
            } else {
                $value = $v.value
            }
            $env_vars = ($env_vars | insert $v.key $value)
        }
        return $env_vars
    }

    if not (which fnm | is-empty) {
        fnm-env | load-env

        if (not ($env | default false __fnm_hooked | get __fnm_hooked)) {
            $env.__fnm_hooked = true
            $env.config = ($env | default {} config).config
            $env.config = ($env.config | default {} hooks)
            $env.config = ($env.config | update hooks ($env.config.hooks | default {} env_change))
            $env.config = ($env.config | update hooks.env_change ($env.config.hooks.env_change | default [] PWD))
            $env.config = ($env.config | update hooks.env_change.PWD ($env.config.hooks.env_change.PWD | append { |before, after|
                if ('FNM_DIR' in $env) and ([.nvmrc .node-version] | path exists | any { |it| $it }) {
                    (^fnm use); (fnm-env | load-env)
                }
            }))
        }
    }
}
