### kubernetes
def ensure-cache [cache path action] {
    let ts = (do -i { ls $path | sort-by modified | reverse | get 0.modified })
    if ($ts | is-empty) { return false }
    let tc = (do -i { ls $cache | get 0.modified })
    if not (($cache | path exists) and ($ts < $tc)) {
        mkdir (dirname $cache)
        do $action | save -f $cache
    }
    open $cache
}

def "kube ctx" [] {
    let cache = $'($env.HOME)/.cache/nu-power/kube.json'
    let file = if ($env.KUBECONFIG? | is-empty) { $"($env.HOME)/.kube/config" } else { $env.KUBECONFIG }
    if not ($file | path exists) { return $nothing }
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
    {||
        let ctx = (kube ctx)
        if ($ctx | is-empty) {
            ""
        } else {
            let theme = $env.NU_POWER_THEME.kube
            let c = if $ctx.AUTHINFO == $ctx.CLUSTER {
                    $ctx.CLUSTER
                } else {
                    $"($ctx.AUTHINFO)@($ctx.CLUSTER)"
                }
            let p = $"($theme.context)($c)($theme.separator)/($theme.namespace)($ctx.NAMESPACE)"
            $"($p)" | str trim
        }
    }
}

export-env {
    power register kube (kube_stat) {
        context: red
        separator: yellow
        namespace: cyan_bold
    }
}
