export-env {
    use env.nu *
}

### ctx
export def "kube-config" [] {
    let file = if ($env.KUBECONFIG? | is-empty) { $"($env.HOME)/.kube/config" } else { $env.KUBECONFIG }
    { path: $file, data: (cat $file | from yaml) }
}

use utils.nu *
use complete.nu *

export use refine.nu *
export use helm.nu *
export use conf.nu *
export use resources.nu *
export use compose.nu *

def krefine [kind] {
    let obj = $in
    let conf = $env.KUBERNETES_REFINE
    let kind = if $kind in $conf.shortnames {
        $conf.shortnames | get $kind
    } else {
        $kind
    }
    let tg = [cluster_resources cluster_status resources status]
    | reduce -f {} {|i,a|
        let r = $conf | get $i
        if $kind in $r {
            $a | merge ($r | get $kind)
        } else {
            $a
        }
    }
    if ($tg | is-empty) {
        $obj
    } else {
        refine $tg $obj
    }
}


# kubectl apply -f
export def kaf [file: path] {
    kubectl apply -f $file
}

# kubectl diff -f
export def kdf [file: path] {
    kubectl diff -f $file
}

# kubectl delete -f
export def kdelf [file: path] {
    kubectl delete -f $file
}

# kubectl apply -k (kustomize)
export def kak [file: path] {
    kubectl apply -k $file
}

# kubectl diff -k (kustomize)
export def kdk [file: path] {
    kubectl diff -k $file
}

# kubectl delete -k (kustomize)
export def kdelk [file: path] {
    kubectl delete -k $file
}

# kubectl kustomize (template)
export def kk [file: path] {
    kubectl kustomize $file
}



# kubectl change context
export def kcc [context: string@"nu-complete kube ctx"] {
    kubectl config use-context $context
}

# kubectl (change) namespace
export def kn [namespace: string@"nu-complete kube ns"] {
    if not ($namespace in (kubectl get namespace | from ssv -a | get NAME)) {
        if ([no yes] | input list $"namespace '($namespace)' doesn't exist, create it?") in [yes] {
            kubectl create namespace $namespace
        } else {
            return
        }
    }
    kubectl config set-context --current $"--namespace=($namespace)"
}

# kubectl change context clone
export def --env kccc [name: string@"nu-complete kube ctx"] {
    let dist = $"($env.HOME)/.kube/config.d"
    mkdir $dist
    kconf export $name | save -fr $"($dist)/($name)"
    $env.KUBECONFIG = $"($dist)/($name)"
}


# kubectl get
export def kg [
    kind: string@"nu-complete kube kind"
    resource?: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube jsonpath"
    --selector (-l): string
    --verbose (-v)
    --watch (-w)
    --wide (-W)
    --all (-a)
] {
    let n = if $all {
                [-A]
            } else if ($namespace | is-empty) {
                []
            } else {
                [-n $namespace]
            }
    if ($resource | is-empty) {
        let l = $selector | with-flag -l
        if ($jsonpath | is-empty) {
            let wide = if $wide {[-o wide]} else {[]}
            if $verbose {
                kubectl get -o json ...$n $kind ...$l | from json
                | get items
                | krefine $kind
            } else if $watch {
                kubectl get ...$n $kind ...$l ...$wide --watch
            } else {
                kubectl get ...$n $kind ...$l ...$wide | from ssv -a | normalize-column-names
            }
        } else {
            kubectl get ...$n $kind $"--output=jsonpath={($jsonpath)}" | from json
        }
    } else {
        let o = kubectl get ...$n $kind $resource -o json | from json
        if $verbose { $o } else { $o | krefine $kind }
    }
}

# kubectl describe
export def kd [
    kind: string@"nu-complete kube kind"
    resource: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kubectl describe ...($namespace | with-flag -n) $kind $resource
}

# kubectl create
export def kc [
    kind: string@"nu-complete kube kind"
    --namespace (-n): string@"nu-complete kube ns"
    name:string
] {
    kubectl create ...($namespace | with-flag -n) $kind $name
}

# kubectl get -o yaml
export def ky [
    kind: string@"nu-complete kube kind"
    resource: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kubectl get ...($namespace | with-flag -n) -o yaml $kind $resource
}

# kubectl edit
export def ke [
    kind: string@"nu-complete kube kind"
    resource?: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
    --selector(-l): string
] {
    let n = $namespace | with-flag -n
    let r = if ($selector | is-empty) { $resource } else {
        let res = kubectl get $kind ...$n -l $selector | from ssv -a | each {|x| $x.NAME}
        if ($res | length) == 1 {
            $res.0
        } else if ($res | length) == 0 {
            return
        } else {
            $res | input list $'select ($kind) '
        }
    }
    kubectl edit ...$n $kind $r
}

# kubectl delete
export def kdel [
    kind: string@"nu-complete kube kind"
    resource: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
    --force(-f)
] {
    kubectl delete ...($namespace | with-flag -n) ...(if $force {[--grace-period=0 --force]} else {[]}) $kind $resource
}


# kubectl get nodes
export def kgno [] {
    kubectl get nodes -o wide | from ssv -a
    | rename name status roles age version internal-ip external-ip os kernel runtime
}

# kubectl get pods
export def kgp [
    pod?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube jsonpath"
    --selector (-l): string
    --all (-a)
] {
    if ($pod | is-not-empty) {
        kg pods -n $namespace $pod
    } else if $all {
        kg pods -a --wide
    } else {
        kg pods -n $namespace -p $jsonpath -l $selector --wide $pod
    }
}

# kubectl get pods --watch
export def kwp [
    pod?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --selector (-l): string
] {
    kg pods -n $namespace -w -l $selector --wide $pod
}

# kubectl edit pod
export def kep [
    --namespace (-n): string@"nu-complete kube ns"
    pod: string@"nu-complete kube res via name"
    --selector (-l): string
] {
    ke -n $namespace pod -l $selector $pod
}

# kubectl describe pod
export def kdp [
    --namespace (-n): string@"nu-complete kube ns"
    pod: string@"nu-complete kube res via name"
] {
    kd -n $namespace pod $pod
}

# kubectl attach (exec -it)
export def --wrapped ka [
    pod?: string@"nu-complete kube deploys and pods"
    --namespace (-n): string@"nu-complete kube ns"
    --container(-c): string@"nu-complete kube ctns"
    --selector(-l): string
    --all-pods(-a) # for completion
    ...args
] {
    let n = $namespace | with-flag -n
    let pod = if ($selector | is-empty) {
        if ($pod | str ends-with '-') {
            $"deployment/($pod | str trim --char '-' --right)"
        } else {
            $pod
        }
        } else {
        let pods = kubectl get pods $n -o wide -l $selector
            | from ssv -a
            | where STATUS == Running
            | select NAME IP NODE
            | rename name ip node
        if ($pods | length) == 1 {
            ($pods.0).name
        } else if ($pods | length) == 0 {
            return
        } else {
            ($pods | input list 'select pod ').name
        }
    }
    let c = if ($container | is-empty) {
        if ($selector | is-empty)  { [] } else {
            let cs = kgp -n $n $pod -p '.spec.containers[*].name' | split row ' '
            let ctn = if ($cs | length) == 1 {
                $cs.0
            } else {
                $cs | input list 'select container '
            }
            [-c $ctn]
        }
    } else {
        [-c $container]
    }
    kubectl exec ...$n -it $pod ...$c -- ...(if ($args|is-empty) {['bash']} else { $args })
}

# kubectl logs
export def kl [
    pod: string@"nu-complete kube deploys and pods"
    --namespace(-n): string@"nu-complete kube ns"
    --container(-c): string@"nu-complete kube ctns"
    --follow(-f)
    --previous(-p)
    --all-pods(-a) # for completion
] {
    let n = $namespace | with-flag -n
    let c = $container | with-flag -c
    let f = if $follow {[-f]} else {[]}
    let p = if $previous {[-p]} else {[]}
    let trg = if ($pod | str ends-with '-') {
        $"deployment/($pod | str substring ..-1)"
        } else {
            $pod
        }
    kubectl logs ...$n ...$f ...$p $trg ...$c
}

# kubectl port-forward
export def kpf [
    kind: string@"nu-complete port forward type"
    target: string@"nu-complete kube res"
    port: string@"nu-complete kube port"
    --local (-l): string
    --namespace (-n): string@"nu-complete kube ns"
] {
    let ns = $namespace | with-flag -n
    let port = if ($local | is-empty) { $port } else { $"($local):($port)" }
    kubectl port-forward ...$ns $"($kind)/($target)" $port
}

# kubectl cp
export def kcp [
    lhs: string@"nu-complete kube cp"
    rhs: string@"nu-complete kube cp"
    --container (-c): string@"nu-complete kube ctns"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kubectl cp ...($namespace | with-flag -n) $lhs ...($container | with-flag -c) $rhs
}

# kubectl get services
export def kgs [
    service?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube jsonpath"
    --selector (-l): string
] {
    if ($service | is-empty) {
        kg services -n $namespace -p $jsonpath -l $selector $service
    } else {
        kg services -n $namespace $service
    }
}

# kubectl edit service
export def kes [
    service?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --selector (-l): string
] {
    ke -n $namespace service -l $selector $service
}

# kubectl delete service
export def kdels [
    service: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kdel -n $namespace service $service
}

# kubectl get deployments
export def kgd [
    deployment?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube jsonpath"
    --selector (-l): string
] {
    kg -n $namespace deployments -p $jsonpath -l $selector $deployment
}

# kubectl edit deployment
export def ked [
    deployment?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --selector (-l): string
] {
    ke -n $namespace deployments -l $selector $deployment
}

def "nu-complete num9" [] { [0 1 2 3] }
# kubectl scale deployment
export def ksd [
    deployment: string@"nu-complete kube deploys"
    num: string@"nu-complete num9"
    --namespace (-n): string@"nu-complete kube ns"
] {
    if ($num | into int) > 9 {
        "too large"
    } else {
        let ns = $namespace | with-flag -n
        kubectl scale ...$ns deployments $deployment --replicas $num
    }
}

# kubectl scale deployment with reset
export def ksdr [
    deployment: string@"nu-complete kube deploys"
    num: int@"nu-complete num9"
    --namespace (-n): string@"nu-complete kube ns"
] {
    if $num > 9 {
        "too large"
    } else if $num <= 0 {
        "too small"
    } else {
        let ns = $namespace | with-flag -n
        kubectl scale ...$ns deployments $deployment --replicas 0
        kubectl scale ...$ns deployments $deployment --replicas $num
    }
}

# kubectl set image
export def ksi [
    kind: string@"nu-complete kube kind with image"
    resource: string@"nu-complete kube res"
    --namespace(-n): string@"nu-complete kube ns"
    act?: any
] {
    let ns = $namespace | with-flag -n
    let path = match $kind {
        _ => '.spec.template.spec.containers[*]'
    }
    let name = kubectl get ...$ns $kind $resource -o $"jsonpath={($path).name}" | split row ' '
    let image = kubectl get ...$ns $kind $resource -o $"jsonpath={($path).image}" | split row ' '
    let list = $name | zip $image | reduce -f {} {|it,acc| $acc | insert $it.0 $it.1 }
    if ($act | describe -d).type == 'closure' {
        let s = do $act $list
        if ($s | describe -d).type == 'record' {
            let s = $s | transpose k v | each {|x| $"($x.k)=($x.v)"}
            kubectl ...$ns set image $"($kind)/($resource)" ...$s
        }
    } else {
        $list
    }
}

# kubectl redistribution deployment
export def krd [
    deployment: string@"nu-complete kube deploys"
    ...nodes: string@"nu-complete kube nodes"
    --namespace (-n): string@"nu-complete kube ns"
] {
    let ns = $namespace | with-flag -n
    let nums = kubectl get nodes | from ssv -a | length
    kubectl scale ...$ns deployments $deployment --replicas $nums
    let labels = kubectl get ...$ns deploy $deployment --output=json
    | from json
    | get spec.selector.matchLabels
    | transpose k v
    | each {|x| $"($x.k)=($x.v)"}
    | str join ','
    let pods = kubectl get ...$ns pods -l $labels -o wide | from ssv -a
    for p in ($pods | where NODE not-in $nodes) {
        kubectl delete ...$ns pod --grace-period=0 --force $p.NAME
    }
    kubectl scale ...$ns deployments $deployment --replicas ($pods | where NODE in $nodes | length)
}

# kubectl rollout status deployment
export alias krsd = kubectl rollout status deployment
# kubectl get rs
export alias kgrs = kubectl get rs

# kubectl rollout history
export def krhd [
    --namespace (-n): string@"nu-complete kube ns"
    --revision (-v): int
    deployment: string@"nu-complete kube res via name"
] {
    let ns = $namespace | with-flag -n
    let v = if ($revision|is-empty) { [] } else { [ $"--revision=($revision)" ] }
    kubectl ...$ns rollout history $"deployment/($deployment)" ...$v
}

# kubectl rollout undo
export def krud [
    --namespace (-n): string@"nu-complete kube ns"
    --revision (-v): int
    deployment: string@"nu-complete kube res via name"
] {
    let ns = $namespace | with-flag -n
    let v = if ($revision|is-empty) { [] } else { [ $"--to-revision=($revision)" ] }
    kubectl ...$ns rollout undo $"deployment/($deployment)" ...$v
}
export alias ksss = kubectl scale statefulset
export alias krsss = kubectl rollout status statefulset

# kubectl top pod
export def ktp [
    --namespace (-n): string@"nu-complete kube ns"
    --all(-a)
] {
    if $all {
        kubectl top pod -A | from ssv -a | rename namespace name cpu mem
        | each {|x|
            {
                namespace: $x.namespace
                name: $x.name
                cpu: ($x.cpu| str substring ..-1 | into float)
                mem: ($x.mem | str substring ..-2 | into float)
            }
        }
    } else {
        let ns = $namespace | with-flag -n
        kubectl top pod ...$ns | from ssv -a | rename name cpu mem
        | each {|x|
            {
                name: $x.name
                cpu: ($x.cpu| str substring ..-1 | into float)
                mem: ($x.mem | str substring ..-2 | into float)
            }
        }
    }
}

# kubectl top node
export def ktno [] {
    kubectl top node | from ssv -a | rename name cpu pcpu mem pmem
    | each {|x| {
        name: $x.name
        cpu: ($x.cpu| str substring ..-1 | into float)
        cpu%: (($x.pcpu| str substring ..-1 | into float) / 100)
        mem: ($x.mem | str substring ..-2 | into float)
        mem%: (($x.pmem | str substring ..-1 | into float) / 100)
    } }
}

###
export def "kclean evicted" [] {
    kubectl get pods -A
    | from ssv -a
    | where STATUS == Evicted
    | each { |x| kdel pod -n $x.NAMESPACE $x.NAME }
}

### FIXME:
export def "kclean stucked ns" [ns: string] {
    kubectl get namespace $ns -o json \
    | tr -d "\n"
    | sed 's/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/' \
    | kubectl replace --raw /api/v1/namespaces/$1/finalize -f -
}

export alias "kclean finalizer" = kubectl patch -p '{\"metadata\":{\"finalizers\":null}}'

export alias "kadm check" = kubeadm certs check-expiration
export alias "kadm renew" = kubeadm certs renew all

### cert-manager
export def kgcert [] {
    kubectl get certificates -o wide | from ssv | rename certificates
    kubectl get certificaterequests -o wide | from ssv | rename certificaterequests
    kubectl get order.acme -o wide | from ssv | rename order.acme
    kubectl get challenges.acme -o wide | from ssv | rename challenges.acme
}

