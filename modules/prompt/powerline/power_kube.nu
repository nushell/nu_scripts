### kubernetes
def "kube ctx" [] {
    do -i {
        kubectl config get-contexts
        | from ssv -a
        | where CURRENT == '*'
        | get 0
    }
}

def kube_stat [] {
    {||
        let ctx = (kube ctx)
        let theme = $env.NU_POWER_THEME.kube
        if ($ctx | is-empty) {
            ""
        } else {
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
        context: (ansi red)
        separator: (ansi yellow)
        namespace: (ansi cyan_bold)
    }
}
