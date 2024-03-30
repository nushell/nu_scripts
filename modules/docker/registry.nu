def "nu-complete registry show" [cmd: string, offset: int] {
    let new = $cmd | str ends-with ' '
    let cmd = $cmd | split row ' '
    let url = $cmd.3?
    let reg = $cmd.4?
    let tag = $cmd.5?
    let auth = if ($env.REGISTRY_TOKEN? | is-not-empty) {
        [-H $"Authorization: Basic ($env.REGISTRY_TOKEN)"]
    } else {
        []
    }
    if ($tag | is-empty) and (not $new) or ($reg | is-empty) {
        curl -sSL ...$auth $"($url)/v2/_catalog"
        | from json | get repositories
    } else {
        curl -sSL ...$auth $"($url)/v2/($reg)/tags/list"
        | from json | get tags
    }
}

### docker registry show
export def "docker registry show" [
    url: string
    reg?: string@"nu-complete registry show"
    tag?: string@"nu-complete registry show"
] {
    let header = if ($env.REGISTRY_TOKEN? | is-not-empty) {
        [-H $"Authorization: Basic ($env.REGISTRY_TOKEN)"]
    } else {
        []
    }
    | append [-H 'Accept: application/vnd.oci.image.manifest.v1+json']
    if ($reg | is-empty) {
        curl -sSL ...$header $"($url)/v2/_catalog" | from json | get repositories
    } else if ($tag | is-empty) {
        curl -sSL ...$header $"($url)/v2/($reg)/tags/list" | from json | get tags
    } else {
        curl -sSL ...$header $"($url)/v2/($reg)/manifests/($tag)" | from json
    }
}

### docker registry delete
export def "docker registry delete" [
    url: string
    reg: string@"nu-complete registry show"
    tag: string@"nu-complete registry show"
] {
    let header = if ($env.REGISTRY_TOKEN? | is-not-empty) {
        [-H $"Authorization: Basic ($env.REGISTRY_TOKEN)"]
    } else {
        []
    }
    | append [-H 'Accept: application/vnd.oci.image.manifest.v1+json']
    #| append [-H 'Accept: application/vnd.docker.distribution.manifest.v2+json']
    let digest = do -i {
        curl -sSI ...$header $"($url)/v2/($reg)/manifests/($tag)"
        | rg docker-content-digest
        | split row ' '
        | get 1
        | str trim
    }
    print -e $digest
    if ($digest | is-not-empty) {
        curl -sSL -X DELETE ...$header $"($url)/v2/($reg)/manifests/($digest)"
    } else {
        'not found'
    }
}
