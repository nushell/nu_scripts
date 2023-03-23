export-env {
    for c in [podman nerdctl docker] {
        if not (which $c | is-empty) {
            let-env docker-cli = $c
            break
        }
    }
}

export def dp [] {
    # ^$env.docker-cli ps --all --no-trunc --format='{{json .}}' | jq
    let cli = $env.docker-cli
    if $cli == 'docker' {
        ^$cli ps -a --format '{"id":"{{.ID}}", "image": "{{.Image}}", "name":"{{.Names}}", "cmd":{{.Command}}, "port":"{{.Ports}}", "status":"{{.Status}}", "created":"{{.CreatedAt}}"}'
        | lines
        | each {|x|
            let r = ($x | from json)
            let t = ($r.created | str substring ',25' | into datetime -f '%Y-%m-%d %H:%M:%S %z' ) - 8hr
            $r | upsert created $t
        }
    } else if $cli == 'podman' {
        ^$cli ps -a --format '{"id":"{{.ID}}", "image": "{{.Image}}", "name":"{{.Names}}", "cmd":"{{.Command}}", "port":"{{.Ports}}", "status":"{{.Status}}", "created":"{{.Created}}"}'
        | lines
        | each {|x|
            let r = ($x | from json)
            let t = ($r.created | str substring ',32' | into datetime ) - 8hr
            $r | upsert created $t
        }
    } else {
        ^$cli ps -a
        | from ssv
        | rename id image cmd created status port name
    }
}

export def di [] {
    ^$env.docker-cli images
    | from ssv -a
    | rename repo tag id created size
    | each {|x|
        let size = ($x.size | into filesize)
        let path = ($x.repo | split row '/')
        let image = ($path | last)
        let repo = ($path | range ..(($path|length) - 2) | str join '/')
        {
            repo: $repo
            image: $image
            tag: $x.tag
            id: $x.id
            created: $x.created
            size: $size
        }
    }
}

def "nu-complete docker ps" [] {
    ^$env.docker-cli ps
    | from ssv -a
    | each {|x| {description: $x.NAMES value: $x.'CONTAINER ID'}}
}

def "nu-complete docker container" [] {
    ^$env.docker-cli ps
    | from ssv -a
    | each {|x| {description: $x.'CONTAINER ID' value: $x.NAMES}}
}

def "nu-complete docker all container" [] {
    ^$env.docker-cli ps -a
    | from ssv -a
    | each {|x| {description: $x.'CONTAINER ID' value: $x.NAMES}}
}

def "nu-complete docker images" [] {
    ^$env.docker-cli images
    | from ssv
    | each {|x| $"($x.REPOSITORY):($x.TAG)"}
}

export def dl [ctn: string@"nu-complete docker container" -n: int = 100] {
    let n = if $n == 0 { [] } else { [--tail $n] }
    ^$env.docker-cli logs -f $n $ctn
}

export def da [
    ctn: string@"nu-complete docker container"
    ...args
] {
    if ($args|is-empty) {
        ^$env.docker-cli exec -it $ctn /bin/sh -c "[ -e /bin/zsh ] && /bin/zsh || [ -e /bin/bash ] && /bin/bash || /bin/sh"
    } else {
        ^$env.docker-cli exec -it $ctn $args
    }
}

def "nu-complete docker cp" [cmd: string, offset: int] {
    let argv = ($cmd | str substring [0 $offset] | split row ' ')
    let p = if ($argv | length) > 2 { $argv | get 2 } else { $argv | get 1 }
    let ctn = (
        ^$env.docker-cli ps
        | from ssv -a
        | each {|x| {description: $x.'CONTAINER ID' value: $"($x.NAMES):" }}
    )
    let n = ($p | split row ':')
    if $"($n | get 0):" in ($ctn | get value) {
        ^$env.docker-cli exec ($n | get 0) sh -c $"ls -dp ($n | get 1)*"
        | lines
        | each {|x| $"($n | get 0):($x)"}
    } else {
        let files = do -i {
            ls -a $"($p)*"
            | each {|x| if $x.type == dir { $"($x.name)/"} else { $x.name }}
        }
        $files | append $ctn
    }
}

export def dcp [
    lhs: string@"nu-complete docker cp",
    rhs: string@"nu-complete docker cp"
] {
    ^$env.docker-cli cp $lhs $rhs
}

export def dcr [ctn: string@"nu-complete docker all container"] {
    ^$env.docker-cli container rm -f $ctn
}

export def dis [img: string@"nu-complete docker images"] {
    ^$env.docker-cli inspect $img
}

export def dh [img: string@"nu-complete docker images"] {
    ^$env.docker-cli history --no-trunc $img | from ssv -a
}

export def dsv [...img: string@"nu-complete docker images"] {
    ^$env.docker-cli save $img
}

export alias dld = podman load

export def dsp [] {
    ^$env.docker-cli system prune -f
}

export alias dspall = podman system prune --all --force --volumes

export def drmi [img: string@"nu-complete docker images"] {
    ^$env.docker-cli rmi $img
}

export def dt [from: string@"nu-complete docker images"  to: string] {
    ^$env.docker-cli tag $from $to
}

export def dps [img: string@"nu-complete docker images"] {
    ^$env.docker-cli push $img
}

export alias dpl = podman pull

### volume
export def dvl [] {
    ^$env.docker-cli volume ls | from ssv -a
}

def "nu-complete docker volume" [] {
    dvl | get name
}

export def dvc [name: string] {
    ^$env.docker-cli volume create
}

export def dvi [name: string@"nu-complete docker volume"] {
    ^$env.docker-cli volume inspect $name
}

export def dvr [...name: string@"nu-complete docker volume"] {
    ^$env.docker-cli volume rm $name
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
        let sshkey = (cat ([$env.HOME .ssh $ssh] | path join) | split row ' ' | get 1)
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
        ^$env.docker-cli run --name $name $args $img ($cmd | flatten)
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
            go: 'gopkg:/opt/go/pkg'
            ng: 'ng:/srv'
            pg: 'pg:/var/lib/postgresql/data'
        }
    let c = do -i {$__dx_cache | transpose k v | where {|x| $dx | str contains $x.k} | get v.0}
    let c = if ($c|is-empty) {
            ''
        } else if $mount_cache {
            let c = ( $c
                    | split row ':'
                    | each {|x i| if $i == 1 { $"/cache($x)" } else { $x } }
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
        if ($env | has 'REGISTRY_TOKEN') {
            http get -H [authorization $"Basic ($env.REGISTRY_TOKEN)"] $"($url)/v2/_catalog"
        } else {
            http get $"($url)/v2/_catalog"
        }
        | get repositories
    } else if ($tag|is-empty) {
        if ($env | has 'REGISTRY_TOKEN') {
            http get $"($url)/v2/($reg)/tags/list"
        } else {
            http get -H [authorization $"Basic ($env.REGISTRY_TOKEN)"] $"($url)/v2/($reg)/tags/list"
        }
        | get tags
    }
}

### docker registry list
export def "registry list" [
    url: string
    reg: string@"nu-complete registry list"
] {
    if ('REGISTRY_TOKEN' in ($env | columns)) {
        http get -H [authorization $"Basic ($env.REGISTRY_TOKEN)"] $"($url)/v2/($reg)/tags/list"
    } else {
        http get $"($url)/v2/($reg)/tags/list"
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
