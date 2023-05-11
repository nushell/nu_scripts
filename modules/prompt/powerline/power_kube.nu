### kubernetes
def ensure-cache-by-lines [cache path action] {
    let ls = (do -i { open $path | lines | length })
    if ($ls | is-empty) { return false }
    let lc = (do -i { open $cache | get lines})
    if not (($cache | path exists) and (not ($lc | is-empty)) and ($ls == $lc)) {
        mkdir ($cache | path dirname)
        {
            lines: $ls
            payload: (do $action)
        } | save -f $cache
    }
    (open $cache).payload
}

def "kube ctx" [] {
    let cache = $'($env.HOME)/.cache/nu-power/kube.json'
    let file = if ($env.KUBECONFIG? | is-empty) { $"($env.HOME)/.kube/config" } else { $env.KUBECONFIG }
    if not ($file | path exists) { return $nothing }
    ensure-cache-by-lines $cache $file {
        do -i {
            kubectl config get-contexts
            | from ssv -a
            | where CURRENT == '*'
            | get 0
        }
    }
}

def kube_stat [] {
    {|bg|
        let ctx = (kube ctx)
        if ($ctx | is-empty) {
            [$bg ""]
        } else {
            let theme = $env.NU_POWER_THEME.kube
            let config = $env.NU_POWER_CONFIG.kube
            let p = if $config.reverse {
                $"($theme.namespace)($ctx.NAMESPACE)($theme.separator)($config.separator)($theme.context)($ctx.NAME)"
            } else {
                $"($theme.context)($ctx.NAME)($theme.separator)($config.separator)($theme.namespace)($ctx.NAMESPACE)"
            }
            [$bg $"($p)"]
        }
    }
}

export-env {
    power register kube (kube_stat) {
        context: cyan
        separator: purple
        namespace: yellow
    } {
        reverse: false
        separator: ':'
    }
}
