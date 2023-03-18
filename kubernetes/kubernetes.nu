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

export def ensure-index [index path action] {
    let ts = do -i { ls $path | sort-by modified | reverse | get 0.modified }
    if ($ts | is-empty) { return false }
    let tc = do -i { ls $index | get 0.modified }
    if not (($index | path exists) and ($ts < $tc)) {
        mkdir (dirname $index)
        do $action
    }
}

export-env {
    let-env KUBERNETES_SCHEMA_URL = $"file:///($env.HOME)/.config/kubernetes-json-schema/all.json"
}


### file
export def kaf [p: path] {
    kubectl apply -f $p
}

export def kdf [p: path] {
    kubectl diff -f $p
}

export def kdelf [p: path] {
    kubectl delete -f $p
}

export def kak [p: path] {
    kubectl apply -k $p
}

export def kdk [p: path] {
    kubectl diff -k $p
}

export def kdelk [p: path] {
    kubectl delete -k $p
}

export def kk [p: path] {
    kubectl kustomize $p
}

### ctx
export def "kube-config" [] {
    let file = if 'KUBECONFIG' in ($env | columns) { $env.KUBECONFIG } else { $"($env.HOME)/.kube/config" }
    { path: $file, data: (cat $file | from yaml)}
}

def "nu-complete kube ctx" [] {
    let k = (kube-config)
    let cache = $'($env.HOME)/.cache/nu-complete/k8s/(basename $k.path).json'
    ensure-index $cache $k.path {
        let clusters = ($k.data | get clusters | select name cluster.server)
        let data = ( $k.data
            | get contexts
            | reduce -f {completion:[], mx_ns: 0, mx_cl: 0} {|x, a|
                let ns = (if ('namespace' in ($x.context|columns)) { $x.context.namespace } else { '' })
                let max_ns = ($ns | str length)
                let cluster = ($"($x.context.user)@($clusters | where name == $x.context.cluster | get cluster_server.0)")
                let max_cl = ($cluster | str length)
                $a
                | upsert mx_ns (if $max_ns > $a.mx_ns { $max_ns } else $a.mx_ns)
                | upsert mx_cl (if $max_cl > $a.mx_cl { $max_cl } else $a.mx_cl)
                | upsert completion ($a.completion | append {value: $x.name, ns: $ns, cluster: $cluster})
            })
        {completion: $data.completion, max: {ns: $data.mx_ns, cluster: $data.mx_cl}} | save -f $cache
    }

    let data = (cat $cache | from json)
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

export def kcc [ctx: string@"nu-complete kube ctx"] {
    kubectl config use-context $ctx
}

export def kn [ns: string@"nu-complete kube ns"] {
    kubectl config set-context --current $"--namespace=($ns)"
}

export def 'kconf import' [name: string, path: string] {
    let k = (kube-config)
    let d = $k.data
    let i = (cat $path | from yaml)
    let c = [{
        name: $name,
        context: {
            cluster: $name,
            namespace: default,
            user: $name
        }
    }]
    $d
    | upsert clusters ($d.clusters | append ($i.clusters.0 | upsert name $name))
    | upsert users ($d.users | append ($i.users.0 | upsert name $name))
    | upsert contexts ($d.contexts | append $c)
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
def "nu-complete kube def" [] {
    [
        pod deployment svc endpoints
        configmap secret event
        namespace node pv pvc ingress
        job cronjob daemonset statefulset
        clusterrole clusterrolebinding role serviceaccount rolebinding
    ] | append (kubectl get crd | from ssv -a | get NAME)
}

def "nu-complete kube res" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let def = ($ctx | get args.1)
    let ns = do -i { $ctx | get '-n' }
    let ns = if ($ns|is-empty) { [] } else { [-n $ns] }
    kubectl get $ns $def | from ssv -a | get NAME
}

export def kg [
    r: string@"nu-complete kube def"
    -n: string@"nu-complete kube ns"
    --all (-A):bool
] {
    let n = if $all {
                [-A]
            } else if ($n | is-empty) {
                []
            } else {
                [-n $n]
            }
    #let h = ($d | columns | str kebab-case)
    #$d | rename ...$h
    kubectl get $n $r | from ssv -a
}

export def kc [
    r: string@"nu-complete kube def"
    -n: string@"nu-complete kube ns"
    name:string
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl create $n $r $name
}

export def ky [
    r: string@"nu-complete kube def"
    i: string@"nu-complete kube res"
    -n: string@"nu-complete kube ns"
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl get $n -o yaml $r $i
}

export def kd [
    r: string@"nu-complete kube def"
    i: string@"nu-complete kube res"
    -n: string@"nu-complete kube ns"
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl describe $n $r $i
}

export def ke [
    r: string@"nu-complete kube def"
    i: string@"nu-complete kube res"
    -n: string@"nu-complete kube ns"
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl edit $n $r $i
}

export def kdel [
    r: string@"nu-complete kube def"
    i: string@"nu-complete kube res"
    -n: string@"nu-complete kube ns"
    --force(-f): bool
] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    let f = if $force { [--grace-period=0 --force] } else { [] }
    kubectl delete $n $f $r $i
}


### node
export def kgno [] {
    kubectl get nodes -o wide | from ssv -a
    | rename name status roles age version internal-ip external-ip os kernel runtime
}

### pods
def "nu-complete kube pods" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let ns = do -i { $ctx | get '-n' }
    let ns = if ($ns|is-empty) { [] } else { [-n $ns] }
    kubectl get $ns pods | from ssv -a | get NAME
}

def "nu-complete kube ctns" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let ns = do -i { $ctx | get '-n' }
    let ns = if ($ns|is-empty) { [] } else { [-n $ns] }
    let ctn = do -i { $ctx | get '-c' }
    let ctn = if ($ctn|is-empty) { [] } else { [-c $ctn] }
    let pod = ($ctx | get args.1)
    kubectl get $ns pod $pod -o jsonpath={.spec.containers[*].name} | split row ' '
}

export def kgpl [] {
    kubectl get pods -o json
    | from json
    | get items
    | each {|x|
        let rs = $x.status.containerStatuses.0.restartCount
        {
            namespace: $x.metadata.namespace,
            name: $x.metadata.name,
            status: $x.status.phase,
            restarts: ($rs | split row ' '| get 0 | into int),
            age: ($x.status.startTime | into datetime)
        }}
}

export def kgpa [] {
    kubectl get pods -o wide -A | from ssv -a
    | rename namespace name ready status restarts age ip node
    | each {|x| ($x| upsert restarts ($x.restarts|split row ' '| get 0 | into int)) }
    | reject 'NOMINATED NODE' 'READINESS GATES'
}

export def kgp [-n: string@"nu-complete kube ns"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl get pods $n -o wide | from ssv -a
    | rename name ready status restarts age ip node
    | each {|x| ($x| upsert restarts ($x.restarts|split row ' '| get 0 | into int)) }
    | reject 'NOMINATED NODE' 'READINESS GATES'
}

export def kgpw [] {
    kubectl get pods --watch
}

export def kep [-n: string@"nu-complete kube ns", pod: string@"nu-complete kube pods"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl edit pod $n $pod
}

export def kdp [-n: string@"nu-complete kube ns", pod: string@"nu-complete kube pods"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl describe pod $n $pod
}

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

export def kl [
    pod: string@"nu-complete kube pods"
    --namespace(-n): string@"nu-complete kube ns"
    --container(-c): string@"nu-complete kube ctns"
] {
    let n = if ($namespace|is-empty) { [] } else { [-n $namespace] }
    let c = if ($container|is-empty) { [] } else { [-c $container] }
    kubectl logs $n $pod $c
}

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
    let ctx = ($cmd | str substring [0 $offset] | parse cmd)
    let p = ($ctx.args | get (($ctx.args | length) - 1))
    let ns = do -i { $ctx | get '-n' }
    let ns = if ($ns|is-empty) { [] } else { [-n $ns] }
    let c = do -i { $ctx | get '-c' }
    let c = if ($c|is-empty) { [] } else { [-c $c] }
    let ctn = (kubectl get pod $ns | from ssv -a | each {|x| {description: $x.READY value: $"($x.NAME):" }})
    let n = ($p | split row ':')
    if $"($n | get 0):" in ($ctn | get value) {
        kubectl exec $ns ($n | get 0) $c -- sh -c $"ls -dp ($n | get 1)*"
        | lines
        | each {|x| $"($n | get 0):($x)"}
    } else {
        let files = do -i { ls -a $"($p)*"
            | each {|x| if $x.type == dir { $"($x.name)/"} else { $x.name }}
        }
        $files | append $ctn
    }
}
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

### service
def "nu-complete kube service" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let ns = do -i { $ctx | get '-n' }
    let ns = if ($ns|is-empty) { [] } else { [-n $ns] }
    kubectl get $ns services | from ssv -a | get NAME
}

export def kgs [-n: string@"nu-complete kube ns"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl get $n services | from ssv -a
    | rename name type cluster-ip external-ip ports age selector
}

export def kes [svc: string@"nu-complete kube service", -n: string@"nu-complete kube ns"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl edit $n service $svc
}

export def kdels [svc: string@"nu-complete kube service", -n: string@"nu-complete kube ns"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl delete $n service $svc
}

### deployments
def "nu-complete kube deployments" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let ns = do -i { $ctx | get '-n' }
    let ns = if ($ns|is-empty) { [] } else { [-n $ns] }
    kubectl get $ns deployments | from ssv -a | get NAME
}

export def kgd [-n: string@"nu-complete kube ns"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl get $n deployments -o wide | from ssv -a
    | rename name ready up-to-date available age containers images selector
    | reject selector
}

export def ked [d: string@"nu-complete kube deployments", -n: string@"nu-complete kube ns"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl edit $n deployments $d
}

def "nu-complete num9" [] { [1 2 3] }
export def ksd [
    d: string@"nu-complete kube deployments"
    num: int@"nu-complete num9"
    -n: string@"nu-complete kube ns"
] {
    if $num > 9 {
        "too large"
    } else {
        let n = if ($n|is-empty) { [] } else { [-n $n] }
        kubectl scale $n deployments $d --replicas $num
    }
}
export def ksdr [
    d: string@"nu-complete kube deployments"
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

export alias krsd = kubectl rollout status deployment
export alias kgrs = kubectl get rs
export def krh [-n: string@"nu-complete kube ns", --revision (-v): int, dpl: string@"nu-complete kube deployments"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    let v = if ($revision|is-empty) { [] } else { [ $"--revision=($revision)" ] }
    kubectl $n rollout history $"deployment/($dpl)" $v
}
export def kru [-n: string@"nu-complete kube ns", --revision (-v): int, dpl: string@"nu-complete kube deployments"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    let v = if ($revision|is-empty) { [] } else { [ $"--to-revision=($revision)" ] }
    kubectl $n rollout undo $"deployment/($dpl)" $v
}
export alias ksss = kubectl scale statefulset
export alias krsss = kubectl rollout status statefulset

### kubectl top pod
export def ktp [-n: string@"nu-complete kube ns"] {
    let n = if ($n|is-empty) { [] } else { [-n $n] }
    kubectl top pod $n | from ssv -a | rename name cpu mem
    | each {|x| {
        name: $x.name
        cpu: ($x.cpu| str substring ',-1' | into decimal)
        mem: ($x.mem | str substring ',-2' | into decimal)
    } }
}

export def ktpa [] {
    kubectl top pod -A | from ssv -a | rename namespace name cpu mem
    | each {|x| {
        namespace: $x.namespace
        name: $x.name
        cpu: ($x.cpu| str substring ',-1' | into decimal)
        mem: ($x.mem | str substring ',-2' | into decimal)
    } }
}

### kube top node
export def ktn [] {
    kubectl top node | from ssv -a | rename name cpu pcpu mem pmem
    | each {|x| {
        name: $x.name
        cpu: ($x.cpu| str substring ',-1' | into decimal)
        cpu%: (($x.pcpu| str substring ',-1' | into decimal) / 100)
        mem: ($x.mem | str substring ',-2' | into decimal)
        mem%: (($x.pmem | str substring ',-1' | into decimal) / 100)
    } }
}

###
export def "kclean evicted" [] {
    kubectl get pods -A
    | from ssv -a
    | where STATUS == Evicted
    | each { |x| kdel pod -n $x.NAMESPACE $x.NAME }
}

### fixme:
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
