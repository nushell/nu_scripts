export-env {
  if not (which fnm | is-empty) {
    ^fnm env --json | from json | load-env

    $env.PATH = $env.PATH | prepend ($env.FNM_MULTISHELL_PATH | path join (if $nu.os-info.name == 'windows' {''} else {'bin'}))

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
      let version_files = [.nvmrc .node-version package.json]

      $env.config.hooks.env_change.PWD = (
        $env.config.hooks.env_change.PWD | append {
          __fnm_hook: true
          code: {|before, after|
            if ('FNM_DIR' in $env) and ($version_files | path exists | any {|it| $it }) {
              ^fnm use
            }
          }
        }
      )
    }
  }
}
