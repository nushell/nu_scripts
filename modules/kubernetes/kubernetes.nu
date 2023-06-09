def get-sign [cmd] {
    let x = ($nu.scope.commands | where name == $cmd).signatures?.0?.any?
    mut s = []
    mut n = {}
    mut p = []
    for it in $x {
        if $it.parameter_type in ['switch' 'named'] {
            let name = $it.parameter_name
            if not ($it.short_flag | is-empty) {
                $n = ($n | upsert $it.short_flag $name)
            }
            if $it.parameter_type == 'switch' {
                $s = ($s | append $name)
                if not ($it.short_flag | is-empty) {
                    $s = ($s | append $it.short_flag)
                }
            }
        } else if $it.parameter_type == 'positional' {
            $p = ($p | append $it.parameter_name)
        }
    }
    { switch: $s, name: $n, positional: $p }
}

def "parse cmd" [] {
    let cmd = ($in | split row ' ')
    let sign = (get-sign $cmd.0)
    mut sw = ''
    mut pos = []
    mut opt = {}
    for c in $cmd {
        if ($sw | is-empty) {
            if ($c | str starts-with '-') {
                let c = if ($c | str substring 1..2) != '-' {
                    let k = ($c | str substring 1..)
                    if $k in $sign.name {
                        $'($sign.name | get $k)'
                    } else {
                        $k
                    }
                } else {
                    $c | str substring 2..
                }
                if $c in $sign.switch {
                    $opt = ($opt | upsert $c true)
                } else {
                    $sw = $c
                }
            } else {
                $pos ++= [$c]
            }
        } else {
            $opt = ($opt | upsert $sw $c)
            $sw = ''
        }
    }
    $opt._args = $pos
    $opt._pos = ( $pos | range 1.. | enumerate | reduce -f {} {|it, acc| $acc | upsert ($sign.positional | get $it.index) $it.item } )
    $opt
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

export def normalize-column-names [ ] {
    let i = $in
    let cols = ($i | columns)
    mut t = $i
    for c in $cols {
        $t = ($t | rename -c [$c ($c | str downcase | str replace ' ' '_')])
    }
    $t
}

def sprb [flag, args] {
    if $flag {
        $args
    } else {
        []
    }
}

def spr [args] {
    let lst = ($args | last)
    if ($lst | is-empty) {
        []
    } else {
        let init = ($args | range ..-2)
        if ($init | is-empty) {
            [ $lst ]
        } else {
            $init | append $lst
        }
    }
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

# helm list and get
export def kgh [
    name?: string@"nu-complete helm list"
    --namespace (-n): string@"nu-complete kube ns"
    --manifest (-m): bool
    --values(-v): bool
    --all (-a): bool
] {
    if ($name | is-empty) {
        let ns = if $all { [--all] } else { (spr [-n $namespace]) }
        helm list $ns --output json
        | from json
        | update updated {|x|
            $x.updated
            | str substring ..-4
            | into datetime -f '%Y-%m-%d %H:%M:%S.%f %z'
        }
    } else {
        if $manifest {
            helm get manifest $name (spr [-n $namespace])
        } else if $values {
            helm get values $name (spr [-n $namespace])
        } else {
            helm get notes $name (spr [-n $namespace])
        }
    }
}

def "nu-complete helm list" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    kgh -n $ctx.namespace? | each {|x| {value: $x.name  description: $x.updated} }
}

def "nu-complete helm charts" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let path = ($ctx | get _pos.chart)
    let path = if ($path | is-empty) { '.' } else { $path }
    let paths = (do -i { ls $"($path)*" | each {|x| if $x.type == dir { $"($x.name)/"} else { $x.name }} })
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
] {
    let update = $name in (
        helm list (spr [-n $namespace]) --output json
        | from json | get name
    )
    let act = if $update { [upgrade] } else { [install] }
    let values = if ($values | is-empty) { [] } else { [--set-json (record-to-set-json $values)] }
    helm $act $name $chart -f $valuefile $values (spr [-n $namespace])
}

# helm install or upgrade via values file
export def kdh [
    name: string@"nu-complete helm list"
    chart: string@"nu-complete helm charts"
    values: path
    --namespace (-n): string@"nu-complete kube ns"
] {
    helm diff upgrade $name $chart -f $values (spr [-n $namespace])
}

# helm delete
export def kdelh [
    name: string@"nu-complete helm list"
    --namespace (-n): string@"nu-complete kube ns"
] {
    helm uninstall $name (spr [-n $namespace])
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
    let target = ($valuefile | split row '.' | range ..-2 | append [out yaml] | str join '.')
    if (not ($target | path exists)) and (([yes no] | input list $'create ($target)?') in [no]) { return }
    helm template $app $chart -f $valuefile $values (spr [-n $namespace])
    | save -f $target
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
    let i = (cat $path | from yaml)
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
    let kind = ($ctx | get _args.1)
    let ns = if ($ctx.namespace? | is-empty) { [] } else { [-n $ctx.namespace] }
    kubectl get $ns $kind | from ssv -a | get NAME
}

def "nu-complete kube res via name" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let kind = ($env.KUBERNETES_RESOURCE_ABBR | get ($ctx | get _args.0 | str substring (-1..)))
    let ns = if ($ctx.namespace? | is-empty) { [] } else { [-n $ctx.namespace] }
    kubectl get $ns $kind | from ssv -a | get NAME
}

def "nu-complete kube jsonpath" [context: string] {
    let ctx = ($context | parse cmd)
    let kind = ($ctx | get _args.1)
    let res = ($ctx | get _args.2)
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
        let row = ($path | split row '.')
        let p = ($row  | range ..-2 | str join '.')
        if ($p | is-empty) {
            $r = ( kubectl get $ns -o json $kind $res
                 | from json
                 | columns
                 | each {|x| $'($p).($x)'}
                 )
        } else {
            let m = (kubectl get $ns $kind $res $"--output=jsonpath={($p)}" | from json)
            let l = ($row | last)
            let c = (do -i {$m | get $l})
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
    --verbose (-v): bool
    --watch (-w): bool
    --wide (-W): bool
    --all (-a): bool
] {
    let n = if $all {
                [-A]
            } else if ($namespace | is-empty) {
                []
            } else {
                [-n $namespace]
            }
    let r = (spr [$r])
    let l = (spr [-l $selector])
    if ($jsonpath | is-empty) {
        let wide = (sprb $wide [-o wide])
        if ($verbose) {
            kubectl get -o json $n $k $r $l | from json | get items
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
            kubectl get $n $k $r $l $wide --watch
        } else {
            kubectl get $n $k $r $l $wide | from ssv -a | normalize-column-names
        }
    } else {
        kubectl get $n $k $r $"--output=jsonpath={($jsonpath)}" | from json
    }
}

# kubectl describe
export def kd [
    r: string@"nu-complete kube kind"
    i: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kubectl describe (spr [-n $namespace]) $r $i
}

# kubectl create
export def kc [
    r: string@"nu-complete kube kind"
    --namespace (-n): string@"nu-complete kube ns"
    name:string
] {
    kubectl create (spr [-n $namespace]) $r $name
}

# kubectl get -o yaml
export def ky [
    r: string@"nu-complete kube kind"
    i: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kubectl get (spr [-n $namespace]) -o yaml $r $i
}

# kubectl edit
export def ke [
    k: string@"nu-complete kube kind"
    r?: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
    --selector(-l): string
] {
    let n = (spr [-n $namespace])
    let r = if ($selector | is-empty) { $r } else {
        let res = (kubectl get $k $n -l $selector | from ssv -a | each {|x| $x.NAME})
        if ($res | length) == 1 {
            $res.0
        } else if ($res | length) == 0 {
            return
        } else {
            $res | input list $'select ($k) '
        }
    }
    kubectl edit $n $k $r
}

# kubectl delete
export def kdel [
    r: string@"nu-complete kube kind"
    i: string@"nu-complete kube res"
    --namespace (-n): string@"nu-complete kube ns"
    --force(-f): bool
] {
    kubectl delete (spr [-n $namespace]) (sprb $force [--grace-period=0 --force]) $r $i
}


# kubectl get nodes
export def kgno [] {
    kubectl get nodes -o wide | from ssv -a
    | rename name status roles age version internal-ip external-ip os kernel runtime
}

def "nu-complete kube pods" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let ns = (do -i { $ctx | get namespace })
    let ns = (spr [-n $ns])
    kubectl get $ns pods | from ssv -a | get NAME
}

def "nu-complete kube ctns" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let ns = (do -i { $ctx | get namespace })
    let ns = (spr [-n $ns])
    let ctn = (do -i { $ctx | get container })
    let ctn = (spr [-c $ctn])
    let pod = ($ctx | get _args.1)
    kubectl get $ns pod $pod -o jsonpath={.spec.containers[*].name} | split row ' '
}

# kubectl get pods
export def kgp [
    r?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube jsonpath"
    --selector (-l): string
    --all (-a): bool
] {
    if $all {
        kg pods -a --wide
    } else {
        kg pods -n $namespace -p $jsonpath -l $selector --wide $r
    }
}

# kubectl get pods --watch
export def kgpw [
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
export def ka [
    pod?: string@"nu-complete kube pods"
    --namespace (-n): string@"nu-complete kube ns"
    --container(-c): string@"nu-complete kube ctns"
    --selector(-l): string
    ...args
] {
    let n = (spr [-n $namespace])
    let pod = if ($selector | is-empty) { $pod } else {
        let pods = (
            kubectl get pods $n -o wide -l $selector
            | from ssv -a
            | where STATUS == Running
            | select NAME IP NODE
            | rename name ip node
        )
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
            let cs = (kgp -n $n $pod -p '.spec.containers[*].name' | split row ' ')
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
    kubectl exec $n -it $pod $c -- (if ($args|is-empty) { 'bash' } else { $args })
}

# kubectl logs
export def kl [
    pod: string@"nu-complete kube pods"
    --namespace(-n): string@"nu-complete kube ns"
    --container(-c): string@"nu-complete kube ctns"
    --follow(-f): bool
] {
    let n = (spr [-n $namespace])
    let c = (spr [-c $container])
    let f = (sprb $follow [-f])
    kubectl logs $n $f $pod $c
}

def "nu-complete port forward type" [] {
    [pod svc]
}

def "nu-complete kube port" [context: string, offset: int] {
    let ctx = ($context | parse cmd)
    let kind = ($ctx | get _args.1)
    let ns = if ($ctx.namespace? | is-empty) { [] } else { [-n $ctx.namespace] }
    let res = ($ctx | get _args.2)
    if ($kind | str starts-with 's') {
        kubectl get $ns svc $res --output=jsonpath="{.spec.ports}"
        | from json
        | each {|x| {value: $x.port  description: $x.name} }
    } else {
        kubectl get $ns pods $res --output=jsonpath="{.spec.containers[].ports}"
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
    let n = (spr [-n $namespace])
    let port = if ($local | is-empty) { $port } else { $"($local):($port)" }
    kubectl port-forward $n $"($res)/($target)" $port
}

def "nu-complete kube cp" [cmd: string, offset: int] {
    let ctx = ($cmd | str substring ..$offset | parse cmd)
    let p = ($ctx._args | get (($ctx._args | length) - 1))
    let ns = (do -i { $ctx | get namespace })
    let ns = (spr [-n $ns])
    let c = (do -i { $ctx | get container })
    let c = (spr [-c $c])
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
    --container (-c): string@"nu-complete kube ctns"
    --namespace (-n): string@"nu-complete kube ns"
] {
    kubectl cp (spr [-n $namespace]) $lhs (spr [-c $container]) $rhs
}

# kubectl get services
export def kgs [
    r?: string@"nu-complete kube res via name"
    --namespace (-n): string@"nu-complete kube ns"
    --jsonpath (-p): string@"nu-complete kube jsonpath"
    --selector (-l): string
] {
    kg services -n $namespace -p $jsonpath -l $selector $r
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
    d: string@"nu-complete kube res via name"
    num: string@"nu-complete num9"
    --namespace (-n): string@"nu-complete kube ns"
] {
    if ($num | into int) > 9 {
        "too large"
    } else {
        let n = (spr [-n $namespace])
        kubectl scale $n deployments $d --replicas $num
    }
}
# kubectl scale deployment with reset
export def ksdr [
    d: string@"nu-complete kube res via name"
    num: int@"nu-complete num9"
    --namespace (-n): string@"nu-complete kube ns"
] {
    if $num > 9 {
        "too large"
    } else if $num <= 0 {
        "too small"
    } else {
        let n = (spr [-n $namespace])
        kubectl scale $n deployments $d --replicas 0
        kubectl scale $n deployments $d --replicas $num
    }
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
    let n = (spr [-n $namespace])
    let v = if ($revision|is-empty) { [] } else { [ $"--revision=($revision)" ] }
    kubectl $n rollout history $"deployment/($dpl)" $v
}

# kubectl rollout undo
export def krud [
    --namespace (-n): string@"nu-complete kube ns"
    --revision (-v): int
    dpl: string@"nu-complete kube res via name"
] {
    let n = (spr [-n $namespace])
    let v = if ($revision|is-empty) { [] } else { [ $"--to-revision=($revision)" ] }
    kubectl $n rollout undo $"deployment/($dpl)" $v
}
export alias ksss = kubectl scale statefulset
export alias krsss = kubectl rollout status statefulset

# kubectl top pod
export def ktp [
    --namespace (-n): string@"nu-complete kube ns"
    --all(-a): bool
] {
    if $all {
        kubectl top pod -A | from ssv -a | rename namespace name cpu mem
        | each {|x|
            {
                namespace: $x.namespace
                name: $x.name
                cpu: ($x.cpu| str substring ..-1 | into decimal)
                mem: ($x.mem | str substring ..-2 | into decimal)
            }
        }
    } else {
        let n = (spr [-n $namespace])
        kubectl top pod $n | from ssv -a | rename name cpu mem
        | each {|x|
            {
                name: $x.name
                cpu: ($x.cpu| str substring ..-1 | into decimal)
                mem: ($x.mem | str substring ..-2 | into decimal)
            }
        }
    }
}

# kubectl top node
export def ktno [] {
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
