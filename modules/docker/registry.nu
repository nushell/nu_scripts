def "nu-complete registry show" [cmd: string, offset: int] {
    let new = $cmd | str ends-with ' '
    let cmd = $cmd | split row ' '
    let url = $cmd.3?
    let reg = $cmd.4?
    let tag = $cmd.5?
    let auth = if ($env.REGISTRY_TOKEN? | is-not-empty) {
        ["Authorization" $"Basic ($env.REGISTRY_TOKEN)"]
    } else {
        []
    }
    if ($tag | is-empty) and (not $new) or ($reg | is-empty) {
        http get -H $auth $"($url)/v2/_catalog"
        | get repositories
    } else {
        http get -H $auth $"($url)/v2/($reg)/tags/list"
        | get tags
    }
}

### docker registry show
export def "docker registry show" [
    url: string
    reg?: string@"nu-complete registry show"
    tag?: string@"nu-complete registry show"
] {
    let header = if ($env.REGISTRY_TOKEN? | is-not-empty) {
        ["Authorization" $"Basic ($env.REGISTRY_TOKEN)"]
    } else {
        []
    }
    | append ['Accept' 'application/vnd.oci.image.manifest.v1+json']

    if ($reg | is-empty) {
        http get -H $header $"($url)/v2/_catalog" | get repositories
    } else if ($tag | is-empty) {
        http get -H $header $"($url)/v2/($reg)/tags/list" | get tags
    } else {
        http get -H $header $"($url)/v2/($reg)/manifests/($tag)"
    }
}

### docker registry delete
export def "docker registry delete" [
    url: string
    reg: string@"nu-complete registry show"
    tag: string@"nu-complete registry show"
] {
    let header = if ($env.REGISTRY_TOKEN? | is-not-empty) {
        ['Authorization' $'Basic ($env.REGISTRY_TOKEN)']
    } else {
        []
    }
    | append ['Accept' 'application/vnd.oci.image.manifest.v1+json']
    #| append ['Accept' 'application/vnd.docker.distribution.manifest.v2+json']
    let digest = do -i {
        http get -H $header -f $"($url)/v2/($reg)/manifests/($tag)"
        | get headers.response
        | where name == docker-content-digest
        | first
        | get value
    }
    print -e $digest
    if ($digest | is-not-empty) {
        http delete -H $header $"($url)/v2/($reg)/manifests/($digest)"
    } else {
        'not found'
    }
}
