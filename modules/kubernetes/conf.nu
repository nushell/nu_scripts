use complete.nu *

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

