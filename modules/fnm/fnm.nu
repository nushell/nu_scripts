export-env {
  def fnm-env [] {
    mut env_vars = {}
    let pwsh_vars = (
      ^fnm env --shell power-shell | lines | parse "$env:{key} = \"{value}\""
    )

    # fnm-prefixed vars
    for v in ($pwsh_vars | slice 1..) {
      $env_vars = ($env_vars | insert $v.key $v.value)
    }

    # path
    let env_used_path = ($env | columns | where { str downcase | $in == "path" } | get 0)
    let path_value = ($pwsh_vars | get 0.value | split row (char esep))
    $env_vars = ($env_vars | insert $env_used_path $path_value)

    return $env_vars
  }

  if not (which fnm | is-empty) {
    fnm-env | load-env

    $env.config = (
      $env.config?
      | default {}
      | upsert hooks { default {} }
      | upsert hooks.env_change { default {} }
      | upsert hooks.env_change.PWD { default [] }
    )
    let __fnm_hooked = (
      $env.config.hooks.env_change.PWD | any { try { get __fnm_hook } catch { false } }
    )
    if not $__fnm_hooked {
      $env.config.hooks.env_change.PWD = (
        $env.config.hooks.env_change.PWD | append {
          __fnm_hook: true
          code: {|before, after|
            if ('FNM_DIR' in $env) and ([.nvmrc .node-version] | path exists | any {|it| $it }) {
              ^fnm use
            }
          }
        }
      )
    }
  }
}
