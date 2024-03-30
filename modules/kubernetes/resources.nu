use complete *

### refine kubernetes resources
export def kube-refine [
    ...namespace: string@"nu-complete kube ns"
    --kind(-k): list<string@"nu-complete kube kind">
] {
    use lg
    let config = $env.KUBERNETES_REFINE

    let nsf = if ($namespace | is-empty) {
        {|x| $x not-in $config._namespace }
    } else {
        {|x| $x in $namespace}
    }
    let cns = kubectl get namespace
    | from ssv -a
    | get NAME
    | filter $nsf

    let resource = kubectl get crd | from ssv | get NAME
    let resource = kubectl api-resources | from ssv -a | get NAME | append $resource
    let resource = if ($kind | is-empty) {
        $resource
    } else {
        $resource
        | filter {|x| $x in $kind }
    }

    mut data = []
    if ($namespace | is-empty) {
        lg level 4 {stage: cluster}
        for p in ($config.cluster_resources | transpose k v) {
            if $p.k not-in $resource { continue }
            lg level 3 {kind: $p.k} list
            let rs = kubectl get $p.k | from ssv -a | get NAME
            for r in $rs {
                lg level 1 {kind: $p.k, name: $r} collect
                let obj = kubectl get $p.k $r --output=json | from json
                let pyl = refine $p.v $obj
                $data ++= $pyl
            }
        }
    }
    lg level 4 {stage: namespace}
    for p in ($config.resources | transpose k v) {
        if $p.k not-in $resource { continue }
        for ns in $cns {
            lg level 2 {kind: $p.k, ns: $ns} list
            let rs = kubectl get $p.k --namespace $ns | from ssv -a | get NAME
            for r in $rs {
                lg level 0 {kind: $p.k, ns: $ns, name: $r} collect
                let obj = kubectl get $p.k --namespace $ns $r --output=json | from json
                let pyl = refine $p.v $obj
                $data ++= $pyl
            }
        }
    }
    $data
}

