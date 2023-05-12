export def "parse cmd" [] {
    $in
    | split row ' '
    | reduce -f { args: [], sw: '' } {|it, acc|
        if ($acc.sw|is-empty) {
            if ($it|str starts-with '-') {
                $acc | upsert sw $it
            } else {
                let args = ($acc.args | append $it)
                $acc | upsert args $args
            }
        } else {
            if ($it|str starts-with '-') {
                $acc
                | upsert $acc.sw true
                | upsert sw $it
            } else {
                $acc | upsert $acc.sw $it | upsert sw ''
            }
        }
    }
    | reject sw
}

export def ensure-cache-by-lines [cache path action] {
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

export def `kcache flush` [] {
    rm -rf ~/.cache/nu-complete/k8s/
    nu-complete kube ctx
    rm -rf ~/.cache/nu-complete/k8s-api-resources/
}

export-env {
    let-env KUBERNETES_SCHEMA_URL = $"file:///($env.HOME)/.config/kubernetes-json-schema/all.json"
    let-env KUBERNETES_RESOURCE_ABBR = {
        s: services
        d: deployments
        p: pods
    }
}


# kubectl apply -f
export def kaf [p: path] {
    kubectl apply -f $p
}

# kubectl diff -f
export def kdf [p: path] {
    kubectl diff -f $p
}

# kubectl delete -f
export def kdelf [p: path] {
    kubectl delete -f $p
}

# kubectl apply -k
export def kak [p: path] {
    kubectl apply -k $p
}

# kubectl diff -k
export def kdk [p: path] {
    kubectl diff -k $p
}

# kubectl delete -k
export def kdelk [p: path] {
    kubectl delete -k $p
}

# kubectl kustomize (template)
export def kk [p: path] {
    kubectl kustomize $p
}

### ctx
export def "kube-config" [] {
    let file = if ($env.KUBECONFIG? | is-empty) { $"($env.HOME)/.kube/config" } else { $env.KUBECONFIG }
    { path: $file, data: (cat $file | from yaml) }
}

def "nu-complete kube ctx" [] {
    let k = (kube-config)
    let cache = $'($env.HOME)/.cache/nu-complete/k8s/($k.path | path basename).json'
    let data = (ensure-cache-by-lines $cache $k.path { ||
        let clusters = ($k.data | get clusters | select name cluster.server)
        let data = ($k.data
            | get contexts
            | reduce -f {completion:[], mx_ns: 0, mx_cl: 0} {|x, a|
                let ns = (if ($x.context.namespace? | is-empty) { '' } else { $x.context.namespace })
                let max_ns = ($ns | str length)
                let cluster = ($"($x.context.user)@($clusters | where name == $x.context.cluster | get cluster_server.0)")
                let max_cl = ($cluster | str length)
                $a
                | upsert mx_ns (if $max_ns > $a.mx_ns { $max_ns } else $a.mx_ns)
                | upsert mx_cl (if $max_cl > $a.mx_cl { $max_cl } else $a.mx_cl)
                | upsert completion ($a.completion | append {value: $x.name, ns: $ns, cluster: $cluster})
            })
        {completion: $data.completion, max: {ns: $data.mx_ns, cluster: $data.mx_cl}}
    })

    $data.completion | each {|x|
        let ns = ($x.ns | fill -a l -w $data.max.ns -c ' ')
        let cl = ($x.cluster | fill -a l -w $data.max.cluster -c ' ')
        {value: $x.value, description: $"\t($ns) ($cl)"}
    }
}

def "nu-complete kube ns" [] {
    kubectl get namespaces
    | from ssv -a
    | each {|x|
        {value: $x.NAME, description: $"($x.AGE)\t($x.STATUS)"}
    }
}

# kubectl change context
export def kcc [ctx: string@"nu-complete kube ctx"] {
    kubectl config use-context $ctx
}

# kubectl (change) namespace
export def kn [ns: string@"nu-complete kube ns"] {
    kubectl config set-context --current $"--namespace=($ns)"
}

export def 'kconf import' [name: string, path: string] {
    let k = (kube-config)
    let d = $k.data
    let i = (cat $path | from yaml)
    let c = {
        name: $name,
        context: {
            cluster: $name,
            namespace: default,
            user: $name
        }
    }
    $d
    | upsert contexts ($d.contexts | append $c)
    | upsert clusters ($d.clusters | append ($i.clusters.0 | upsert name $name))
    | upsert users ($d.users | append ($i.users.0 | upsert name $name))
    | to yaml
}

export def 'kconf export' [name: string@"nu-complete kube ctx"] {
    let d = (kube-config).data
    let ctx = ($d | get contexts | where name == $name | get 0)
    let user = ($d | get users | where name == $ctx.context.user)
    let cluster = ($d | get clusters | where name == $ctx.context.cluster)
    {
        apiVersion: 'v1',
        current-context: $ctx.name,
        kind: Config,
        clusters: $cluster,
        preferences: {},
        contexts: [$ctx],
        users: $user,
    } | to yaml
}

export def-env kcconf [name: string@"nu-complete kube ctx"] {
    let dist = $"($env.HOME)/.kube/config.d"
    mkdir $dist
    kconf export $name | save -fr $"($dist)/($name)"
    let-env KUBECONFIG = $"($dist)/($name)"
}

### common
def "nu-complete kube kind without cache" [] {
    kubectl api-resources | from ssv -a | get NAME
    | append (kubectl get crd | from ssv -a | get NAME)
}

def "nu-complete kube kind" [] {
    let ctx = (kube-config)
    let cache = $'($env.HOME)/.cache/nu-complete/k8s-api-resources/($ctx.data.current-context).json'
    ensure-cache-by-lines $cache $ctx.path {||
        kubectl api-resources | from ssv -a
        | each {|x| {value: $x.NAME description: $x.SHORTNAMES} }
        | append (kubectl get crd | from ssv -a | each {|x| {$x.NAME} })
    }
}

def "nu-complete kube res" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let def = ($ctx | get args.1)
    let ns = if ($ctx.-n? | is-empty) { [] } else { [-n $ctx.-n] }
    kubectl get $ns $def | from ssv -a | get NAME
}

def "nu-complete kube res via name" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let cmd = ($ctx | get args.0)
    let def = ($env.KUBERNETES_RESOURCE_ABBR | get ($cmd | str substring (($cmd | str length) - 1)..))
    echo $'($cmd), ($def)' | save -a ~/.nulog
    let ns = if ($ctx.-n? | is-empty) { [] } else { [-n $ctx.-n] }
    kubectl get $ns $def | from ssv -a | get NAME
}

def "nu-complete kube path" [context: string, offset: int] {
}

# kubectl get
export def kg [
    k: string@"nu-complete kube kind"
    r?: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube path"
    --selector (-l): string
    --verbose (-v): bool
    --watch (-w): bool
    --all (-A): bool
] {
    let n = if $all {
                [-A]
            } else if ($namespace | is-empty) {
                []
            } else {
                [-n $namespace]
            }
    let r = if ($r | is-empty) { [] } else { [$r] }
    let l = if ($selector | is-empty) { [] } else { [-l $selector] }
    if ($jsonpath | is-empty) {
        if ($verbose) {
            kubectl get -o json $n $k $r | from json | get items
            | each {|x|
                {
                    name: $x.metadata.name
                    kind: $x.kind
                    ns: $x.metadata.namespace
                    created: ($x.metadata.creationTimestamp | into datetime)
                    metadata: $x.metadata
                    status: $x.status
                    spec: $x.spec
                }
            }
        } else if $watch {
            kubectl get $n $k $r --watch
        } else {
            kubectl get $n $k $r | from ssv -a
        }
    } else {
        kubectl get $n $k $r $"--output=jsonpath={($jsonpath)}" | from yaml
    }
}

# kubectl create
export def kc [
    r: string@"nu-complete kube kind"
    -n: string@"nu-complete kube ns"
    name:string
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl create $n $r $name
}

# kubectl get -o yaml
export def ky [
    r: string@"nu-complete kube kind"
    i: string@"nu-complete kube res"
    -n: string@"nu-complete kube ns"
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl get $n -o yaml $r $i
}

# kubectl describe
export def kd [
    r: string@"nu-complete kube kind"
    i: string@"nu-complete kube res"
    -n: string@"nu-complete kube ns"
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl describe $n $r $i
}

# kubectl edit
export def ke [
    k: string@"nu-complete kube kind"
    r: string@"nu-complete kube res"
    -n: string@"nu-complete kube ns"
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl edit $n $k $r
}

# kubectl delete
export def kdel [
    r: string@"nu-complete kube kind"
    i: string@"nu-complete kube res"
    -n: string@"nu-complete kube ns"
    --force(-f): bool
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    let f = if $force { [--grace-period=0 --force] } else { [] }
    kubectl delete $n $f $r $i
}


# kubectl get nodes
export def kgno [] {
    kubectl get nodes -o wide | from ssv -a
    | rename name status roles age version internal-ip external-ip os kernel runtime
}

def "nu-complete kube pods" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let ns = (do -i { $ctx | get '-n' })
    let ns = if ($ns|is-empty) { [] } else { [-n $ns] }
    kubectl get $ns pods | from ssv -a | get NAME
}

def "nu-complete kube ctns" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let ns = (do -i { $ctx | get '-n' })
    let ns = if ($ns|is-empty) { [] } else { [-n $ns] }
    let ctn = (do -i { $ctx | get '-c' })
    let ctn = if ($ctn|is-empty) { [] } else { [-c $ctn] }
    let pod = ($ctx | get args.1)
    kubectl get $ns pod $pod -o jsonpath={.spec.containers[*].name} | split row ' '
}

# kubectl get pods
export def kgp [
    r?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube path"
    --selector (-l): string
] {
    kg pods -n $namespace -p $jsonpath -l $selector $r
}

# kubectl edit pod
export def kep [-n: string@"nu-complete kube ns", pod: string@"nu-complete kube res via name"] {
    ke -n $n pod $pod
}

# kubectl describe pod
export def kdp [-n: string@"nu-complete kube ns", pod: string@"nu-complete kube res via name"] {
    kd -n $n pod $pod
}

# kubectl attach (exec -it)
export def ka [
    pod: string@"nu-complete kube pods"
    -n: string@"nu-complete kube ns"
    --container(-c): string@"nu-complete kube ctns"
    ...args
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    let c = if ($container|is-empty) { [] } else { [-c $container] }
    kubectl exec $n -it $pod $c -- (if ($args|is-empty) { 'bash' } else { $args })
}

# kubectl logs
export def kl [
    pod: string@"nu-complete kube pods"
    --namespace(-n): string@"nu-complete kube ns"
    --container(-c): string@"nu-complete kube ctns"
] {
    let n = if ($namespace|is-empty) { [] } else { [-n $namespace] }
    let c = if ($container|is-empty) { [] } else { [-c $container] }
    kubectl logs $n $pod $c
}

# kubectl logs -f
export def klf [
    pod: string@"nu-complete kube pods"
    --namespace(-n): string@"nu-complete kube ns"
    --container(-c): string@"nu-complete kube ctns"
] {
    let n = if ($namespace|is-empty) { [] } else { [-n $namespace] }
    let c = if ($container|is-empty) { [] } else { [-c $container] }
    kubectl logs $n -f $pod $c
}

def "nu-complete port forward type" [] {
    [pod svc]
}
# kubectl port-forward
export def kpf [
    res: string@"nu-complete port forward type"
    target: string@"nu-complete kube res"
    -n: string@"nu-complete kube ns"
    port: string    ### reflect port num
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl port-forward $n $"($res)/($target)" $port
}

def "nu-complete kube cp" [cmd: string, offset: int] {
    let ctx = ($cmd | str substring ..$offset | parse cmd)
    let p = ($ctx.args | get (($ctx.args | length) - 1))
    let ns = (do -i { $ctx | get '-n' })
    let ns = if ($ns|is-empty) { [] } else { [-n $ns] }
    let c = (do -i { $ctx | get '-c' })
    let c = if ($c|is-empty) { [] } else { [-c $c] }
    let ctn = (kubectl get pod $ns | from ssv -a | each {|x| {description: $x.READY value: $"($x.NAME):" }})
    let n = ($p | split row ':')
    if $"($n | get 0):" in ($ctn | get value) {
        kubectl exec $ns ($n | get 0) $c -- sh -c $"ls -dp ($n | get 1)*"
        | lines
        | each {|x| $"($n | get 0):($x)"}
    } else {
        let files = (do -i { ls -a $"($p)*"
            | each {|x| if $x.type == dir { $"($x.name)/"} else { $x.name }}
        })
        $files | append $ctn
    }
}
# kubectl cp
export def kcp [
    lhs: string@"nu-complete kube cp"
    rhs: string@"nu-complete kube cp"
    -c: string@"nu-complete kube ctns"
    -n: string@"nu-complete kube ns"
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    let c = if ($c|is-empty) { [] } else { [-c $c] }
    kubectl cp $n $lhs $c $rhs
}

# kubectl get services
export def kgs [
    r?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube path"
    --selector (-l): string
] {
    kg services -n $namespace -p $jsonpath -l $selector $r
}

# kubectl edit service
export def kes [svc: string@"nu-complete kube res via name", -n: string@"nu-complete kube ns"] {
    ke -n $n service $svc
}

# kubectl delete service
export def kdels [svc: string@"nu-complete kube res via name", -n: string@"nu-complete kube ns"] {
    kdel -n $n service $svc
}

# kubectl get deployments
export def kgd [
    r?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube path"
    --selector (-l): string
] {
    kg -n $namespace deployments -p $jsonpath -l $selector $r
}

# kubectl edit deployment
export def ked [d: string@"nu-complete kube res via name", -n: string@"nu-complete kube ns"] {
    ke -n $n deployments $d
}

def "nu-complete num9" [] { [1 2 3] }
# kubectl scale deployment
export def ksd [
    d: string@"nu-complete kube res via name"
    num: string@"nu-complete num9"
    -n: string@"nu-complete kube ns"
] {
    if ($num | into int) > 9 {
        "too large"
    } else {
        let n = if ($n|is-empty) { [] } else { [-n $n] }
        kubectl scale $n deployments $d --replicas $num
    }
}
# kubectl scale deployment with reset
export def ksdr [
    d: string@"nu-complete kube res via name"
    num: int@"nu-complete num9"
    -n: string@"nu-complete kube ns"
] {
    if $num > 9 {
        "too large"
    } else if $num <= 0 {
        "too small"
    } else {
        let n = if ($n|is-empty) { [] } else { [-n $n] }
        kubectl scale $n deployments $d --replicas 0
        kubectl scale $n deployments $d --replicas $num
    }
}

# kubectl rollout status deployment
export alias krsd = kubectl rollout status deployment
# kubectl get rs
export alias kgrs = kubectl get rs

# kubectl rollout history
export def krhd [-n: string@"nu-complete kube ns", --revision (-v): int, dpl: string@"nu-complete kube res via name"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    let v = if ($revision|is-empty) { [] } else { [ $"--revision=($revision)" ] }
    kubectl $n rollout history $"deployment/($dpl)" $v
}

# kubectl rollout undo
export def krud [-n: string@"nu-complete kube ns", --revision (-v): int, dpl: string@"nu-complete kube res via name"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    let v = if ($revision|is-empty) { [] } else { [ $"--to-revision=($revision)" ] }
    kubectl $n rollout undo $"deployment/($dpl)" $v
}
export alias ksss = kubectl scale statefulset
export alias krsss = kubectl rollout status statefulset

# kubectl top pod
export def ktp [-n: string@"nu-complete kube ns"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl top pod $n | from ssv -a | rename name cpu mem
    | each {|x| {
        name: $x.name
        cpu: ($x.cpu| str substring ..-1 | into decimal)
        mem: ($x.mem | str substring ..-2 | into decimal)
    } }
}

# kubectl top pod -all
export def ktpa [] {
    kubectl top pod -A | from ssv -a | rename namespace name cpu mem
    | each {|x| {
        namespace: $x.namespace
        name: $x.name
        cpu: ($x.cpu| str substring ..-1 | into decimal)
        mem: ($x.mem | str substring ..-2 | into decimal)
    } }
}

# kubectl top node
export def ktn [] {
    kubectl top node | from ssv -a | rename name cpu pcpu mem pmem
    | each {|x| {
        name: $x.name
        cpu: ($x.cpu| str substring ..-1 | into decimal)
        cpu%: (($x.pcpu| str substring ..-1 | into decimal) / 100)
        mem: ($x.mem | str substring ..-2 | into decimal)
        mem%: (($x.pmem | str substring ..-1 | into decimal) / 100)
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

export alias "kadm renew" = kubeadm alpha certs renew all

### cert-manager
export def kgcert [] {
    kubectl get certificates -o wide | from ssv | rename certificates
    kubectl get certificaterequests -o wide | from ssv | rename certificaterequests
    kubectl get order.acme -o wide | from ssv | rename order.acme
    kubectl get challenges.acme -o wide | from ssv | rename challenges.acme
}
