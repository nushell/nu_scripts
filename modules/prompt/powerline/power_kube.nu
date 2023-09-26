### kubernetes
export def ensure-cache [cache path action] {
    let ts = (do -i { ls $path | sort-by modified | reverse | get 0.modified })
    if ($ts | is-empty) { return false }
    let tc = (do -i { ls $cache | get 0.modified })
    if not (($cache | path exists) and ($ts < $tc)) {
        mkdir ($cache | path dirname)
        do $action | save -f $cache
    }
    open $cache
}

def "kube ctx" [] {
    mut cache = ''
    mut file = ''
    if ($env.KUBECONFIG? | is-empty) {
        $cache = $'($env.HOME)/.cache/nu-power/kube.json'
        $file = $"($env.HOME)/.kube/config"
    } else {
        $cache = $"($env.HOME)/.cache/nu-power/kube-($env.KUBECONFIG | str replace -a '/' ':').json"
        $file = $env.KUBECONFIG
    }
    if not ($file | path exists) { return null }
    ensure-cache $cache $file {
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
