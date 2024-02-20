use argx.nu

export def ensure-cache-by-lines [cache path action] {
    let ls = do -i { open $path | lines | length }
    if ($ls | is-empty) { return false }
    let lc = do -i { open $cache | get lines}
    if not (($cache | path exists) and (not ($lc | is-empty)) and ($ls == $lc)) {
        mkdir ($cache | path dirname)
        {
            lines: $ls
            payload: (do $action)
        } | save -f $cache
    }
    (open $cache).payload
}

export def normalize-column-names [ ] {
    let i = $in
    let cols = $i | columns
    mut t = $i
    for c in $cols {
        $t = ($t | rename -c {$c: ($c | str downcase | str replace ' ' '_')})
    }
    $t
}

def --wrapped with-flag [...flag] {
    if ($in | is-empty) { [] } else { [...$flag $in] }
}

export def `kcache flush` [] {
    rm -rf ~/.cache/nu-complete/k8s/
    nu-complete kube ctx
    rm -rf ~/.cache/nu-complete/k8s-api-resources/
}

export-env {
    $env.KUBERNETES_SCHEMA_URL = $"file:///($env.HOME)/.config/kubernetes-json-schema/all.json"
    $env.KUBERNETES_RESOURCE_ABBR = {
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

# kubectl apply -k (kustomize)
export def kak [p: path] {
    kubectl apply -k $p
}

# kubectl diff -k (kustomize)
export def kdk [p: path] {
    kubectl diff -k $p
}

# kubectl delete -k (kustomize)
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
    let data = ensure-cache-by-lines $cache $k.path { ||
        let clusters = $k.data | get clusters | select name cluster.server
        let data = $k.data
            | get contexts
            | reduce -f {completion:[], mx_ns: 0, mx_cl: 0} {|x, a|
                let ns = if ($x.context.namespace? | is-empty) { '' } else { $x.context.namespace }
                let max_ns = $ns | str length
                let cluster = $"($x.context.user)@($clusters | where name == $x.context.cluster | get cluster_server.0)"
                let max_cl = $cluster | str length
                $a
                | upsert mx_ns (if $max_ns > $a.mx_ns { $max_ns } else $a.mx_ns)
                | upsert mx_cl (if $max_cl > $a.mx_cl { $max_cl } else $a.mx_cl)
                | upsert completion ($a.completion | append {value: $x.name, ns: $ns, cluster: $cluster})
            }
        {completion: $data.completion, max: {ns: $data.mx_ns, cluster: $data.mx_cl}}
    }

    $data.completion | each {|x|
        let ns = $x.ns | fill -a l -w $data.max.ns -c ' '
        let cl = $x.cluster | fill -a l -w $data.max.cluster -c ' '
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
    if not ($ns in (kubectl get namespace | from ssv -a | get NAME)) {
        if ([no yes] | input list $"namespace '($ns)' doesn't exist, create it?") in [yes] {
            kubectl create namespace $ns
        } else {
            return
        }
    }
    kubectl config set-context --current $"--namespace=($ns)"
}

def parse_cellpath [path] {
    $path | split row '.' | each {|x|
        if ($x | find --regex "^[0-9]+$" | is-empty) {
            $x
        } else {
            $x | into int
        }
    }
}

def get_cellpath [record path] {
    $path | reduce -f $record {|it, acc| $acc | get $it }
}

def set_cellpath [record path value] {
    if ($path | length) > 1 {
        $record | upsert ($path | first) {|it|
            set_cellpath ($it | get ($path | first)) ($path | range 1..) $value
        }
    } else {
        $record | upsert ($path | last) $value
    }
}

def upsert_row [table col mask id value] {
    # let value = ($mask | reduce -f $value {|it, acc|
    #     let path = (parse_cellpath $it)
    #     set_cellpath $value $path (get_cellpath $table $path)
    # })
    if $id in ($table | get $col) {
        $table | each {|x|
            if ($x | get $col) == $id {
                $value
            } else {
                $x
            }
        }
    } else {
        $table | append $value
    }
}

export def 'kconf import' [name: string, path: string] {
    let k = (kube-config)
    mut d = $k.data
    let i = cat $path | from yaml
    let c = {
        context: {
            cluster: $name,
            namespace: default,
            user: $name
        }
        name: $name,
    }
    $d.clusters = (upsert_row $d.clusters name [] $name ($i.clusters.0 | upsert name $name))
    $d.users = (upsert_row $d.users name [] $name ($i.users.0 | upsert name $name))
    $d.contexts = (upsert_row $d.contexts name [] $name $c)
    $d | to yaml
}

export def 'kconf delete' [name: string@"nu-complete kube ctx"] {
    let kc = (kube-config)
    let d = $kc.data
    let ctx = $d | get contexts | where name == $name | get 0
    let rctx = $d | get contexts | where name != $name
    let user =  if ($ctx.context.user in ($rctx | get context.user)) {
        $d | get users
    } else {
        $d | get users | where name != $ctx.context.user
    }
    let cluster = if ($ctx.context.cluster in ($rctx | get context.cluster)) {
        $d | get clusters
    } else {
        $d | get clusters | where name != $ctx.context.cluster
    }
    $d
    | update contexts $rctx
    | update users $user
    | update clusters $cluster
    | to yaml
}

export def 'kconf export' [name: string@"nu-complete kube ctx"] {
    let d = (kube-config).data
    let ctx = $d | get contexts | where name == $name | get 0
    let user = $d | get users | where name == $ctx.context.user
    let cluster = $d | get clusters | where name == $ctx.context.cluster
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

export def --env kcconf [name: string@"nu-complete kube ctx"] {
    let dist = $"($env.HOME)/.kube/config.d"
    mkdir $dist
    kconf export $name | save -fr $"($dist)/($name)"
    $env.KUBECONFIG = $"($dist)/($name)"
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
    let ctx = $context | argx parse
    let kind = $ctx | get _args.1
    let ns = if ($ctx.namespace? | is-empty) { [] } else { [-n $ctx.namespace] }
    kubectl get ...$ns $kind | from ssv -a | get NAME
}

def "nu-complete kube res via name" [context: string, offset: int] {
    let ctx = $context | argx parse
    let kind = $env.KUBERNETES_RESOURCE_ABBR | get ($ctx | get _args.0 | str substring (-1..))
    let ns = if ($ctx.namespace? | is-empty) { [] } else { [-n $ctx.namespace] }
    kubectl get ...$ns $kind | from ssv -a | get NAME
}

def "nu-complete kube jsonpath" [context: string] {
    let ctx = $context | argx parse
    let kind = $ctx | get _args.1
    let res = $ctx | get _args.2
    let path = $ctx.jsonpath?
    let ns = if ($ctx.namespace? | is-empty) { [] } else { [-n $ctx.namespace] }
    mut r = []
    if ($path | is-empty) {
        if ($context | str ends-with '-p ') {
            $r = ['.']
        } else {
            $r = ['']
        }
    } else if ($path | str starts-with '.') {
        let row = $path | split row '.'
        let p = $row  | range ..-2 | str join '.'
        if ($p | is-empty) {
            $r = ( kubectl get ...$ns -o json $kind $res
                 | from json
                 | columns
                 | each {|x| $'($p).($x)'}
                 )
        } else {
            let m = kubectl get ...$ns $kind $res $"--output=jsonpath={($p)}" | from json
            let l = $row | last
            let c = do -i {$m | get $l}
            if (not ($c | is-empty)) and ($c | describe | str substring 0..5) == 'table' {
                $r = (0..(($c | length) - 1) | each {|x| $'($p).($l)[($x)]'})
            } else {
                $r = ($m | columns | each {|x| $'($p).($x)'})
            }
        }
    } else {
        $r = ['']
    }
    $r
}

# kubectl get
export def kg [
    k: string@"nu-complete kube kind"
    r?: string@"nu-complete kube res"
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
    if ($r | is-empty) {
        let l = $selector | with-flag -l
        if ($jsonpath | is-empty) {
            let wide = if $wide {[-o wide]} else {[]}
            if ($verbose) {
                kubectl get -o json ...$n $k ...$l | from json | get items
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
                | normalize-column-names
            } else if $watch {
                kubectl get ...$n $k ...$l ...$wide --watch
            } else {
                kubectl get ...$n $k ...$l ...$wide | from ssv -a | normalize-column-names
            }
        } else {
            kubectl get ...$n $k $"--output=jsonpath={($jsonpath)}" | from json
        }
    } else {
        kubectl get ...$n $k $r -o json | from json
    }
}

# kubectl describe
export def kd [
    r: string@"nu-complete kube kind"
    i: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kubectl describe ...($namespace | with-flag -n) $r $i
}

# kubectl create
export def kc [
    r: string@"nu-complete kube kind"
    --namespace (-n): string@"nu-complete kube ns"
    name:string
] {
    kubectl create ...($namespace | with-flag -n) $r $name
}

# kubectl get -o yaml
export def ky [
    r: string@"nu-complete kube kind"
    i: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kubectl get ...($namespace | with-flag -n) -o yaml $r $i
}

# kubectl edit
export def ke [
    k: string@"nu-complete kube kind"
    r?: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
    --selector(-l): string
] {
    let n = $namespace | with-flag -n
    let r = if ($selector | is-empty) { $r } else {
        let res = kubectl get $k ...$n -l $selector | from ssv -a | each {|x| $x.NAME}
        if ($res | length) == 1 {
            $res.0
        } else if ($res | length) == 0 {
            return
        } else {
            $res | input list $'select ($k) '
        }
    }
    kubectl edit ...$n $k $r
}

# kubectl delete
export def kdel [
    r: string@"nu-complete kube kind"
    i: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
    --force(-f)
] {
    kubectl delete ...($namespace | with-flag -n) ...(if $force {[--grace-period=0 --force]} else {[]}) $r $i
}


# kubectl get nodes
export def kgno [] {
    kubectl get nodes -o wide | from ssv -a
    | rename name status roles age version internal-ip external-ip os kernel runtime
}

def "nu-complete kube nodes" [context: string, offset: int] {
    let ctx = $context | argx parse
    kubectl get nodes -o wide | from ssv -a
    | each {|x| {value: $x.NAME, description: $"($x.INTERNAL-IP)(char tab)($x.ROLES)"} }
}

def "nu-complete kube deploys" [context: string, offset: int] {
    let ctx = $context | argx parse
    let ns = $ctx.namespace? | with-flag -n
    kubectl get ...$ns deployments | from ssv -a | get NAME
}

def "nu-complete kube deploys and pods" [context: string, offset: int] {
    let ctx = $context | argx parse
    let ns = $ctx.namespace? | with-flag -n
    let all_pods = ($ctx.a? | default false) or ($ctx.all-pods? | default false)
    if $all_pods or ($ctx._pos.pod? | default '' | str ends-with '-') {
        kubectl get ...$ns pods | from ssv -a | get NAME
    } else {
        kubectl get ...$ns deployments | from ssv -a | get NAME | each {|x| $"($x)-"}
    }
}

def "nu-complete kube ctns" [context: string, offset: int] {
    let ctx = $context | argx parse
    let ns = $ctx.namespace? | with-flag -n
    let pod = $ctx | get _args.1
    kubectl get ...$ns pod $pod -o jsonpath={.spec.containers[*].name} | split row ' '
}

# kubectl get pods
export def kgp [
    r?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube jsonpath"
    --selector (-l): string
    --all (-a)
] {
    if not ($r | is-empty) {
        kubectl get pods ...($namespace | with-flag -n) $r --output=json
        | from json
        | {...$in.metadata, ...$in.spec, ...$in.status}
    } else if $all {
        kg pods -a --wide
    } else {
        kg pods -n $namespace -p $jsonpath -l $selector --wide $r
    }
}

# kubectl get pods --watch
export def kwp [
    r?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --selector (-l): string
] {
    kg pods -n $namespace -w -l $selector --wide $r
}

# kubectl edit pod
export def kep [
    --namespace (-n): string@"nu-complete kube ns"
    pod?: string@"nu-complete kube res via name"
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
            $"deployment/($pod | str substring ..-1)"
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

def "nu-complete port forward type" [] {
    [pod svc]
}

def "nu-complete kube port" [context: string, offset: int] {
    let ctx = $context | argx parse
    let kind = $ctx | get _args.1
    let ns = if ($ctx.namespace? | is-empty) { [] } else { [-n $ctx.namespace] }
    let res = $ctx | get _args.2
    if ($kind | str starts-with 's') {
        kubectl get ...$ns svc $res --output=jsonpath="{.spec.ports}"
        | from json
        | each {|x| {value: $x.port  description: $x.name} }
    } else {
        kubectl get ...$ns pods $res --output=jsonpath="{.spec.containers[].ports}"
        | from json
        | each {|x| {value: $x.containerPort description: $x.name?} }
    }
}

# kubectl port-forward
export def kpf [
    res: string@"nu-complete port forward type"
    target: string@"nu-complete kube res"
    port: string@"nu-complete kube port"
    --local (-l): string
    --namespace (-n): string@"nu-complete kube ns"
] {
    let ns = $namespace | with-flag -n
    let port = if ($local | is-empty) { $port } else { $"($local):($port)" }
    kubectl port-forward ...$ns $"($res)/($target)" $port
}

def "nu-complete kube cp" [cmd: string, offset: int] {
    let ctx = $cmd | str substring ..$offset | argx parse
    let p = $ctx._args | get (($ctx._args | length) - 1)
    let ns = $ctx.namespace? | with-flag -n
    let c = $ctx.container? | with-flag -c
    let ctn = kubectl get pod ...$ns | from ssv -a | each {|x| {description: $x.READY value: $"($x.NAME):" }}
    let n = $p | split row ':'
    if $"($n | get 0):" in ($ctn | get value) {
        kubectl exec ...$ns ($n | get 0) ...$c -- sh -c $"ls -dp ($n | get 1)*"
        | lines
        | each {|x| $"($n | get 0):($x)"}
    } else {
        let files = do -i { ls -a $"($p)*"
            | each {|x| if $x.type == dir { $"($x.name)/"} else { $x.name }}
        }
        $files | append $ctn
    }
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
    r?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube jsonpath"
    --selector (-l): string
] {
    if ($r | is-empty) {
        kg services -n $namespace -p $jsonpath -l $selector $r
    } else {
        kubectl get svc ...($namespace | with-flag -n) $r --output=json
        | from json
        | {...$in.metadata, ...$in.spec, ...$in.status}
    }
}

# kubectl edit service
export def kes [
    svc?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --selector (-l): string
] {
    ke -n $namespace service -l $selector $svc
}

# kubectl delete service
export def kdels [
    svc: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kdel -n $namespace service $svc
}

# kubectl get deployments
export def kgd [
    r?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube jsonpath"
    --selector (-l): string
] {
    kg -n $namespace deployments -p $jsonpath -l $selector $r
}

# kubectl edit deployment
export def ked [
    d?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --selector (-l): string
] {
    ke -n $namespace deployments -l $selector $d
}

def "nu-complete num9" [] { [0 1 2 3] }
# kubectl scale deployment
export def ksd [
    d: string@"nu-complete kube deploys"
    num: string@"nu-complete num9"
    --namespace (-n): string@"nu-complete kube ns"
] {
    if ($num | into int) > 9 {
        "too large"
    } else {
        let ns = $namespace | with-flag -n
        kubectl scale ...$ns deployments $d --replicas $num
    }
}

# kubectl scale deployment with reset
export def ksdr [
    d: string@"nu-complete kube deploys"
    num: int@"nu-complete num9"
    --namespace (-n): string@"nu-complete kube ns"
] {
    if $num > 9 {
        "too large"
    } else if $num <= 0 {
        "too small"
    } else {
        let ns = $namespace | with-flag -n
        kubectl scale ...$ns deployments $d --replicas 0
        kubectl scale ...$ns deployments $d --replicas $num
    }
}


def "nu-complete kube kind with image" [] {
    [
        deployment daemonset statefulset
        pod replicationcontroller
        cronjob replicaset
    ]
}

# kubectl set image
export def ksi [
    k: string@"nu-complete kube kind with image"
    r: string@"nu-complete kube res"
    --namespace(-n): string@"nu-complete kube ns"
    act?: any
] {
    let ns = $namespace | with-flag -n
    let path = match $k {
        _ => '.spec.template.spec.containers[*]'
    }
    let name = kubectl get ...$ns $k $r -o $"jsonpath={($path).name}" | split row ' '
    let image = kubectl get ...$ns $k $r -o $"jsonpath={($path).image}" | split row ' '
    let list = $name | zip $image | reduce -f {} {|it,acc| $acc | insert $it.0 $it.1 }
    if ($act | describe -d).type == 'closure' {
        let s = do $act $list
        if ($s | describe -d).type == 'record' {
            let s = $s | transpose k v | each {|x| $"($x.k)=($x.v)"}
            kubectl ...$ns set image $"($k)/($r)" ...$s
        }
    } else {
        $list
    }
}

# kubectl redistribution deployment
export def krd [
    d: string@"nu-complete kube deploys"
    ...nodes: string@"nu-complete kube nodes"
    --namespace (-n): string@"nu-complete kube ns"
] {
    let ns = $namespace | with-flag -n
    let nums = kubectl get nodes | from ssv -a | length
    kubectl scale ...$ns deployments $d --replicas $nums
    let labels = kubectl get ...$ns deploy $d --output=json
    | from json
    | get spec.selector.matchLabels
    | transpose k v
    | each {|x| $"($x.k)=($x.v)"}
    | str join ','
    let pods = kubectl get ...$ns pods -l $labels -o wide | from ssv -a
    for p in ($pods | where NODE not-in $nodes) {
        kubectl delete ...$ns pod --grace-period=0 --force $p.NAME
    }
    kubectl scale ...$ns deployments $d --replicas ($pods | where NODE in $nodes | length)
}

# kubectl rollout status deployment
export alias krsd = kubectl rollout status deployment
# kubectl get rs
export alias kgrs = kubectl get rs

# kubectl rollout history
export def krhd [
    --namespace (-n): string@"nu-complete kube ns"
    --revision (-v): int
    dpl: string@"nu-complete kube res via name"
] {
    let ns = $namespace | with-flag -n
    let v = if ($revision|is-empty) { [] } else { [ $"--revision=($revision)" ] }
    kubectl ...$ns rollout history $"deployment/($dpl)" ...$v
}

# kubectl rollout undo
export def krud [
    --namespace (-n): string@"nu-complete kube ns"
    --revision (-v): int
    dpl: string@"nu-complete kube res via name"
] {
    let ns = $namespace | with-flag -n
    let v = if ($revision|is-empty) { [] } else { [ $"--to-revision=($revision)" ] }
    kubectl ...$ns rollout undo $"deployment/($dpl)" ...$v
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

# kubernetes to docker-compose
export def kcmp [--without-service(-s)] {
    let a = $in
    let dpl = $a | where kind == 'Deployment'
    mut dpl_svc = {}
    mut svc = {}
    if not $without_service {
        let svcs = $a | where kind == 'Service'
        for s in $svcs {
            for d in $dpl {
                let dl = $d.metadata.labels?
                let ss = $s.spec.selector?
                mut p = true
                for x in ($ss | transpose k v) {
                    if (not ($x.k in $dl)) or (($dl | get $x.k) != $x.v) {
                        $p = false
                        break
                    }
                }
                if $p {
                    let dn = $d.metadata.name
                    let dv = if $dn in $dpl_svc {
                        $dpl_svc | get $dn
                    } else { [] }
                    $dpl_svc = ($dpl_svc | upsert $dn ($dv | append $s.metadata.name))
                }
            }
        }
        $svc = ($svcs
        | reduce -f {} {|i, a|
            $a | upsert $i.metadata.name $i.spec.ports
        })
    }
    let dpl_svc = $dpl_svc
    let svc = $svc

    let cm = $a | where kind == 'ConfigMap'
    | reduce -f {} {|i,a|
        let p = ['.kcmp', 'ConfigMap', $i.metadata.name] | path join
        mkdir $p
        for f in ($i.data | transpose k v) {
            $f.v | save -f ([$p $f.k] | path join)
        }
        $a | insert $i.metadata.name $p
    }
    let sec = $a | where kind == 'Secret'
    | reduce -f {} {|i,a|
        let p = ['.kcmp', 'Secret', $i.metadata.name] | path join
        mkdir $p
        for f in ($i.data | transpose k v) {
            $f.v | decode base64 | save -f ([$p $f.k] | path join)
        }
        $a | insert $i.metadata.name $p
    }
    let pv = $a | where kind == 'PersistentVolume'
    | reduce -f {} {|i,a| $a | insert $i.metadata.name $i.spec.local?.path? }
    let pvc = $a | where kind == 'PersistentVolumeClaim'
    | reduce -f {} {|i,a| $a | insert $i.metadata.name ($pv | get $i.spec.volumeName) }

    let services = $dpl
    | each {|x|
        let d = $x.metadata.name
        let s = if not $without_service {
            $dpl_svc
            | get $d
            | each {|z| $svc | get $z}
            | flatten
            | each {|z| [$z.port $z.targetPort] }
        }

        let v = $x.spec.template.spec.volumes?
        | reduce -f {} {|i,a|
            $a | insert $i.name $i
        }

        $x.spec.template.spec.containers?
        | default []
        | each {|y|
            let ca = $y.securityContext?.capabilities?.add?
            let cd = $y.securityContext?.capabilities?.drop?
            let v = $y.volumeMounts?
            | default []
            | each {|z|
                let sp = $z.subPath? | default ''
                let s = $v | get $z.name
                let s = if not ($s.hostPath? | is-empty) {
                    $s.hostPath.path
                } else if not ($s.path? | is-empty) {
                    $s.path
                } else if not ($s.persistentVolumeClaim?.claimName? | is-empty) {
                    $pvc | get $s.persistentVolumeClaim.claimName
                } else if not ($s.configMap?.name? | is-empty) {
                    ['.'
                    ($cm | get $s.configMap.name)
                    $sp
                    ] | path join
                } else if not ($s.secret?.secretName? | is-empty) {
                    ['.'
                    ($sec | get $s.secret.secretName)
                    $sp
                    ] | path join
                } else {
                    $s
                }
                let m = [$z.mountPath $sp] | path join
                $"($s):($m)"
            }
            let s = if $without_service {
                $y.ports? | default [] | each {|x| $"($x.containerPort):($x.containerPort)"}
            } else {
                $s | each {|x|
                    if ($x.1 | find -r '[^0-9]' | is-empty) {
                        $"($x.0):($x.1)"
                    } else {
                        mut p = ''
                        for i in ($y.ports? | default []) {
                            if $i.name == $x.1 {
                                $p = $i.containerPort
                                break
                            }
                        }
                        $"($x.0):($p)"
                    }
                }
            }

            {
                name: $"($d)_($y.name)"
                image: $y.image
                environment: ($y.env? | reduce -f {} {|i,a| $a | insert $i.name $i.value?})
                ports: $s
                entrypoint: $y.command?
                command: $y.args?
                cap_add: $ca
                cap_drop: $cd
                volumes: $v
            }
            | transpose k v
            | reduce -f {} {|i,a|
                if ($i.v | is-empty) {
                    $a
                } else {
                    $a | insert $i.k $i.v
                }
            }
        }
    }
    | flatten
    | reduce -f {} {|i,a|
        $a | insert $i.name ($i | reject name)
    }

    { version: '3.8', services: $services}
    | to yaml
}

# helm list and get
export def kgh [
    name?: string@"nu-complete helm list"
    --namespace (-n): string@"nu-complete kube ns"
    --manifest (-m)
    --values(-v)
    --all (-a)
] {
    if ($name | is-empty) {
        let ns = if $all { [--all] } else { $namespace | with-flag -n }
        helm list ...$ns --output json
        | from json
        | update updated {|x|
            $x.updated
            | str substring ..-4
            | into datetime -f '%Y-%m-%d %H:%M:%S.%f %z'
        }
    } else {
        if $manifest {
            helm get manifest $name ...($namespace | with-flag -n)
        } else if $values {
            helm get values $name ...($namespace | with-flag -n)
        } else {
            helm get notes $name ...($namespace | with-flag -n)
        }
    }
}

def "nu-complete helm list" [context: string, offset: int] {
    let ctx = $context | argx parse
    kgh -n $ctx.namespace? | each {|x| {value: $x.name  description: $x.updated} }
}

def "nu-complete helm charts" [context: string, offset: int] {
    let ctx = $context | argx parse
    let path = $ctx | get _pos.chart
    let path = if ($path | is-empty) { '.' } else { $path }
    let paths = do -i { ls $"($path)*" | each {|x| if $x.type == dir { $"($x.name)/"} else { $x.name }} }
    helm repo list | from ssv -a | rename value description
    | append $paths
}

def record-to-set-json [value] {
    $value | transpose k v
    | each {|x| $"($x.k)=($x.v | to json -r)"}
    | str join ','
}

# helm install or upgrade via values file
export def kah [
    name: string@"nu-complete helm list"
    chart: string@"nu-complete helm charts"
    valuefile: path
    --values (-v): any
    --namespace (-n): string@"nu-complete kube ns"
    --ignore-image (-i) # for kdh
] {
    let update = $name in (
        helm list ...($namespace | with-flag -n) --output json
        | from json | get name
    )
    let act = if $update { [upgrade] } else { [install] }
    let values = if ($values | is-empty) { [] } else { [--set-json (record-to-set-json $values)] }
    helm ...$act $name $chart -f $valuefile ...$values ...($namespace | with-flag -n)
}

# helm diff
export def kdh [
    name: string@"nu-complete helm list"
    chart: string@"nu-complete helm charts"
    valuefile: path
    --values (-v): any
    --namespace (-n): string@"nu-complete kube ns"
    --ignore-image (-i)
    --has-plugin (-h)
] {
    if $has_plugin {
        helm diff $name $chart -f $valuefile ...($namespace | with-flag -n)
    } else {
        let update = $name in (
            helm list ...($namespace | with-flag -n) --output json
            | from json | get name
        )
        if not $update {
            echo "new installation"
            return
        }

        let values = if ($values | is-empty) { [] } else { [--set-json (record-to-set-json $values)] }
        let target = $'/tmp/($chart | path basename).($name).out.yaml'
        helm template --debug $name $chart -f $valuefile ...$values ...($namespace | with-flag -n) | save -f $target
        if $ignore_image {
            do -i { yq -i ea 'del(.spec.template.spec.containers.[].image)' $target }
        }
        kubectl diff -f $target
    }
}

# helm delete
export def kdelh [
    name: string@"nu-complete helm list"
    --namespace (-n): string@"nu-complete kube ns"
] {
    helm uninstall $name ...($namespace | with-flag -n)
}

# helm template
export def kh [
    chart: string@"nu-complete helm charts"
    valuefile: path
    --values (-v): any
    --namespace (-n): string@"nu-complete kube ns"='test'
    --app (-a): string='test'
] {
    let values = if ($values | is-empty) { [] } else { [--set-json (record-to-set-json $values)] }
    let target = $valuefile | split row '.' | range ..-2 | append [out yaml] | str join '.'
    if (not ($target | path exists)) and (([yes no] | input list $'create ($target)?') in [no]) { return }
    helm template --debug $app $chart -f $valuefile ...$values ...($namespace | with-flag -n)
    | save -f $target
}

