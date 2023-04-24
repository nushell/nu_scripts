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
        if ($ctx | is-empty) {
            ""
        } else {
            let c = if $ctx.AUTHINFO == $ctx.CLUSTER {
                    $ctx.CLUSTER
                } else {
                    $"($ctx.AUTHINFO)@($ctx.CLUSTER)"
                }
            let p = $"(ansi red)($c)(ansi yellow)/(ansi cyan_bold)($ctx.NAMESPACE)"
            $"($p)" | str trim
        }
    }
}

export-env {
    power reg kube (kube_stat)
}
