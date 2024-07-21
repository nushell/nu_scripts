use argx
use utils.nu *

export def "nu-complete kube ctx" [] {
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

export def "nu-complete kube ns" [] {
    kubectl get namespaces
    | from ssv -a
    | each {|x|
        {value: $x.NAME, description: $"($x.AGE)\t($x.STATUS)"}
    }
}

export def "nu-complete kube kind" [] {
    let ctx = (kube-config)
    let cache = $'($env.HOME)/.cache/nu-complete/k8s-api-resources/($ctx.data.current-context).json'
    ensure-cache-by-lines $cache $ctx.path {||
        kubectl api-resources | from ssv -a
        | each {|x| {value: $x.NAME description: $x.SHORTNAMES} }
        | append (kubectl get crd | from ssv -a | get NAME | wrap value)
    }
}

export def "nu-complete kube res" [context: string, offset: int] {
    let ctx = $context | argx parse
    let kind = $ctx | get _args.1
    let ns = if ($ctx.namespace? | is-empty) { [] } else { [-n $ctx.namespace] }
    kubectl get ...$ns $kind | from ssv -a | get NAME
}

export def "nu-complete kube res via name" [context: string, offset: int] {
    let ctx = $context | argx parse
    let kind = $env.KUBERNETES_RESOURCE_ABBR | get ($ctx | get _args.0 | str substring (-1..))
    let ns = if ($ctx.namespace? | is-empty) { [] } else { [-n $ctx.namespace] }
    kubectl get ...$ns $kind | from ssv -a | get NAME
}

export def "nu-complete kube jsonpath" [context: string] {
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
            if ($c | is-not-empty) and ($c | describe | str substring 0..5) == 'table' {
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


export def "nu-complete kube nodes" [context: string, offset: int] {
    let ctx = $context | argx parse
    kubectl get nodes -o wide | from ssv -a
    | each {|x| {value: $x.NAME, description: $"($x.INTERNAL-IP)(char tab)($x.ROLES)"} }
}

export def "nu-complete kube deploys" [context: string, offset: int] {
    let ctx = $context | argx parse
    let ns = $ctx.namespace? | with-flag -n
    kubectl get ...$ns deployments | from ssv -a | get NAME
}

export def "nu-complete kube deploys and pods" [context: string, offset: int] {
    let ctx = $context | argx parse
    let ns = $ctx.namespace? | with-flag -n
    let all_pods = ($ctx.a? | default false) or ($ctx.all-pods? | default false)
    if $all_pods or ($ctx._pos.pod? | default '' | str ends-with '-') {
        kubectl get ...$ns pods | from ssv -a | get NAME
    } else {
        kubectl get ...$ns deployments | from ssv -a | get NAME | each {|x| $"($x)-"}
    }
}

export def "nu-complete kube ctns" [context: string, offset: int] {
    let ctx = $context | argx parse
    let ns = $ctx.namespace? | with-flag -n
    let pod = $ctx | get _args.1
    kubectl get ...$ns pod $pod -o jsonpath={.spec.containers[*].name} | split row ' '
}

export def "nu-complete port forward type" [] {
    [pod svc]
}

export def "nu-complete kube port" [context: string, offset: int] {
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

export def "nu-complete kube cp" [cmd: string, offset: int] {
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
        let files = do -i { ls -a ($"($p)*" | into glob)
            | each {|x| if $x.type == dir { $"($x.name)/"} else { $x.name }}
        }
        $files | append $ctn
    }
}

export def "nu-complete kube kind with image" [] {
    [
        deployment daemonset statefulset
        pod replicationcontroller
        cronjob replicaset
    ]
}

