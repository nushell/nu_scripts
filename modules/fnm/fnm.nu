export-env {
    def fnm-env [] {
        mut env_vars = {}
        let pwsh_vars = (
            ^fnm env --shell power-shell | 
            lines | 
            parse "$env:{key} = \"{value}\""
        )

        # fnm-prefixed vars
        for v in ($pwsh_vars | range 1..) { 
            $env_vars = ($env_vars | insert $v.key $v.value) 
        }

        # path
        let env_used_path = ($env | columns | where {str downcase | $in == "path"} | get 0)
        let path_value = ($pwsh_vars | get 0.value | split row (char esep))
        $env_vars = ($env_vars | insert $env_used_path $path_value)

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
