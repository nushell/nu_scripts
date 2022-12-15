alias docker = podman

export def dp [] {
    # docker ps --all --no-trunc --format='{{json .}}' | jq
    docker ps -a --format '{"id":"{{.ID}}", "image": "{{.Image}}", "name":"{{.Names}}", "cmd":"{{.Command}}", "port":"{{.Ports}}", "status":"{{.Status}}", "created":"{{.Created}}"}'
    | lines
    | each {|x|
            let r = ($x | from json)
            let t = ($r.created | str substring ',32' | into datetime ) - 8hr
            $r | upsert created $t
           }
}

export def di [] {
    docker images
    | from ssv -a
    | rename repo tag id created size
    | upsert size { |i| $i.size | into filesize }
}

def "nu-complete docker ps" [] {
    docker ps
    | from ssv -a
    | each {|x| {description: $x.NAMES value: $x.'CONTAINER ID'}}
}

def "nu-complete docker container" [] {
    docker ps
    | from ssv -a
    | each {|x| {description: $x.'CONTAINER ID' value: $x.NAMES}}
}

def "nu-complete docker all container" [] {
    docker ps -a
    | from ssv -a
    | each {|x| {description: $x.'CONTAINER ID' value: $x.NAMES}}
}

def "nu-complete docker images" [] {
    docker images
    | from ssv
    | each {|x| $"($x.REPOSITORY):($x.TAG)"}
}

export def dl [ctn: string@"nu-complete docker container"] {
    docker logs -f $ctn
}

export def da [
    ctn: string@"nu-complete docker container"
    ...args
] {
    if ($args|is-empty) {
        docker exec -it $ctn /bin/sh -c "[ -e /bin/zsh ] && /bin/zsh || [ -e /bin/bash ] && /bin/bash || /bin/sh"
    } else {
        docker exec -it $ctn $args
    }
}

export def dcp [
    lhs: string@"nu-complete docker container",
    rhs: string@"nu-complete docker container"
] {
    docker cp $lhs $rhs
}

export def dcr [ctn: string@"nu-complete docker all container"] {
    docker container rm -f $ctn
}

export def dis [img: string@"nu-complete docker images"] {
    docker inspect $img
}

export def dh [img: string@"nu-complete docker images"] {
    docker history --no-trunc $img | from ssv -a
}

export def dsv [...img: string@"nu-complete docker images"] {
    docker save $img
}

export alias dld = podman load

export def dsp [] {
    docker system prune -f
}

export alias dspall = podman system prune --all --force --volumes

export def drmi [img: string@"nu-complete docker images"] {
    docker rmi $img
}

export def dt [from: string@"nu-complete docker images"  to: string] {
    docker tag $from $to
}

export def dps [img: string@"nu-complete docker images"] {
    docker push $img
}

export alias dpl = podman pull

### volume
export def dvl [] {
    docker volume ls | from ssv -a
}

def "nu-complete docker volume" [] {
    dvl | get name
}

export def dvc [name: string] {
    docker volume create
}

export def dvi [name: string@"nu-complete docker volume"] {
    docker volume inspect $name
}

export def dvr [...name: string@"nu-complete docker volume"] {
    docker volume rm $name
}

### run
def "nu-complete docker run vol" [] {
    [
        $"($env.PWD):/world"
        $"($env.PWD):/app"
        $"($env.PWD):/srv"
        $"($env.HOME)/.config/nvim:/etc/nvim"
    ]
}

def "nu-complete docker run port" [ctx: string, pos: int] {
    [
        $"(port 8080):80"
        $"(port 2222):22"
        $"(port 3000):3000"
        $"(port 5000):5000"
        $"(port 8000):8000"
        $"(port 9000):9000"
    ]
}

def "nu-complete docker run sshkey" [ctx: string, pos: int] {
    (do { cd ~/.ssh; ls **/*.pub } | get name)
}

def "nu-complete docker run proxy" [] {
    let hostaddr = do -i {hostname -I | split row ' ' | get 0}
    [$"http://($hostaddr):7890" $"http://localhost:7890"]
}

export def dr [
    --debug(-x): bool
    --appimage: bool
    --netadmin(-n): bool
    --proxy: string@"nu-complete docker run proxy"      # proxy
    --ssh(-s): string@"nu-complete docker run sshkey"   # specify ssh key
    --sshuser: string=root                              # default root
    --cache(-c): string                                 # cache
    --vol(-v): string@"nu-complete docker run vol"      # volume
    --port(-p): any                                     # { 8080: 80 }
    --envs(-e): any                                     # { FOO: BAR }
    --daemon(-d): bool
    --attach(-a): string@"nu-complete docker container" # attach
    --entrypoint: string                                # entrypoint
    --dry-run: bool
    --with-x: bool
    img: string@"nu-complete docker images"             # image
    ...cmd                                              # command args
] {
    let entrypoint = if ($entrypoint|is-empty) { [] } else { [--entrypoint $entrypoint] }
    let daemon = if $daemon { [-d] } else { [--rm -it] }
    let mnt = if ($vol|is-empty) { [] } else { [-v $vol] }
    let envs = if ($envs|is-empty) { [] } else { $envs | transpose k v | each {|x| $"-e ($x.k)=($x.v)"} }
    let port = if ($port|is-empty) { [] } else { $port | transpose k v | each {|x|[-p $"($x.k):($x.v)"]} | flatten }
    let debug = if $debug { [--cap-add=SYS_ADMIN --cap-add=SYS_PTRACE --security-opt seccomp=unconfined] } else { [] }
    #let appimage = if $appimage { [--device /dev/fuse --security-opt apparmor:unconfined] } else { [] }
    let appimage = if $appimage { [--device /dev/fuse] } else { [] }
    let netadmin = if $netadmin { [--cap-add=NET_ADMIN --device /dev/net/tun] } else { [] }
    let clip = if $with_x { [-e DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix] } else { [] }
    let ssh = if ($ssh|is-empty) { [] } else {
        let sshkey = (cat ([~/.ssh $ssh] | path join) | split row ' ' | get 1)
        [-e $"ed25519_($sshuser)=($sshkey)"]
    }
    let proxy = if ($proxy|is-empty) { [] } else {
        [-e $"http_proxy=($proxy)" -e $"https_proxy=($proxy)"]
    }
    let attach = if ($attach|is-empty) { [] } else {
        let c = $"container:($attach)"
        [--uts $c --ipc $c --pid $c --network $c]
    }
    let cache = if ($cache|is-empty) { [] } else { [-v $cache] }
    let args = ([$entrypoint $attach $daemon $envs $ssh $proxy $debug $appimage $netadmin $clip $mnt $port $cache] | flatten)
    let name = $"($img | split row '/' | last | str replace ':' '-')_(date now | date format %m%d%H%M)"
    if $dry_run {
        echo $"docker run --name ($name) ($args|str join ' ') ($img) ($cmd | flatten)"
    } else {
        docker run --name $name $args $img ($cmd | flatten)
    }
}

def "nu-complete docker dev env" [] {
    [ io io:rs io:hs io:jpl io:go ng ng:pg ]
}


export def dx [
    --dry-run(-v): bool
    --mount-cache: bool
    --attach(-a): string@"nu-complete docker container" # attach
    --proxy: string@"nu-complete docker run proxy"      # proxy
    dx: string@"nu-complete docker images"              # image
    --envs(-e): any                                     # { FOO: BAR }
    --port(-p): any                                     # { 8080: 80 } # todo: multiple specify parameters(-p 8080:80 -p 8181:81)
    ...cmd                                              # command args
] {
    let __dx_cache = {
        hs: 'stack:/opt/stack'
        rs: 'cargo:/opt/cargo'
        go: 'gopkg:/opt/gopkg'
        ng: 'ng:/srv'
        pg: 'pg:/var/lib/postgresql/data'
    }
    let c = do -i {$__dx_cache | transpose k v | where {|x| $dx | str contains $x.k} | get v.0}
    let c = if ($c|is-empty) { '' } else if $mount_cache {
        let c = ( $c
                | split row ':'
                | each -n {|x| if $x.index == 1 { $"/cache($x.item)" } else { $x.item } }
                | str join ':'
                )
        $"($env.HOME)/.cache/($c)"
    } else {
        $"($env.HOME)/.cache/($c)"
    }
    let proxy = if ($proxy|is-empty) { [] } else { [--proxy $proxy] }
    if $dry_run {
        print $"cache: ($c)"
        dr --dry-run --attach $attach --port $port --envs $envs --cache $c -v $"($env.PWD):/world" --debug --proxy $proxy --ssh id_ed25519.pub $dx $cmd
    } else {
        dr --attach $attach --port $port --envs $envs --cache $c -v $"($env.PWD):/world" --debug --proxy $proxy --ssh id_ed25519.pub $dx $cmd
    }
}


def "nu-complete registry list" [cmd: string, offset: int] {
    let cmd = ($cmd | split row ' ')
    let url = do -i { $cmd | get 2 }
    let reg = do -i { $cmd | get 3 }
    let tag = do -i { $cmd | get 4 }
    if ($reg|is-empty) {
        if (do -i { $env.REGISTRY_TOKEN } | is-empty) {
            fetch $"($url)/v2/_catalog"
        } else {
            fetch -H [authorization $"Basic ($env.REGISTRY_TOKEN)"] $"($url)/v2/_catalog"
        }
        | get repositories
    } else if ($tag|is-empty) {
        if (do -i { $env.REGISTRY_TOKEN } | is-empty) {
            fetch $"($url)/v2/($reg)/tags/list"
        } else {
            fetch -H [authorization $"Basic ($env.REGISTRY_TOKEN)"] $"($url)/v2/($reg)/tags/list"
        }
        | get tags
    }
}

### docker registry list
export def "registry list" [
    url: string
    reg: string@"nu-complete registry list"
] {
    if (do -i { $env.REGISTRY_TOKEN } | is-empty) {
        fetch $"($url)/v2/($reg)/tags/list"
    } else {
        fetch -H [authorization $"Basic ($env.REGISTRY_TOKEN)"] $"($url)/v2/($reg)/tags/list"
    }
    | get tags
}

### buildah

export def "bud img" [] {
    buildah images
    | from ssv -a
    | rename repo tag id created size
    | upsert size { |i| $i.size | into filesize }
}

export def "bud ls" [] {
    buildah list
    | from ssv -a
    | rename id builder image-id image container
}

export def "bud ps" [] {
    buildah ps
    | from ssv -a
    | rename id builder image-id image container
}

def "nu-complete bud ps" [] {
    bud ps
    | select 'CONTAINER ID' "CONTAINER NAME"
    | rename value description
}

export def "bud rm" [
    id: string@"nu-complete bud ps"
] {
    buildah rm $id
}
