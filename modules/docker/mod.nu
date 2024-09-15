export-env {
    for c in [podman nerdctl docker] {
        if (which $c | is-not-empty) {
            $env.CONTCTL = $c
            break
        }
    }
}

def --wrapped container [...flag] {
    ^$env.CONTCTL ...$flag
}

def --wrapped with-flag [...flag] {
    if ($in | is-empty) { [] } else { [...$flag $in] }
}

def "nu-complete docker ns" [] {
    if $env.CONTCTL == 'nerdctl' {
        ^$env.CONTCTL namespace list
        | from ssv -a
        | each {|x| { value: $x.NAMES }}
    } else {
        []
    }
}

# network
def "nu-complete docker network" [] {
    containers-network-list | get NAME
}

export def containers-network-list [
    name?: string@"nu-complete docker network"
    --subnet
] {
    if ($name | is-empty) {
        ^$env.CONTCTL network ls | from ssv -a
    } else {
        ^$env.CONTCTL network inspect $name
        | from json
        | do {
            if $subnet {
                match $env.CONTCTL {
                    podman => ($in | get subnets.0 )
                    _ => ($in | get IPAM.Config.0)
                }
            } else {
                $in
            }
        }
    }
}

def "nu-complete docker network driver" [] {
    [bridge host none overlay ipvlan macvlan]
}

export def containers-network-create [
    name: string
    --driver(-d): string = "bridge"@"nu-complete docker network driver"
] {
    ^$env.CONTCTL network create $name
}

export def containers-network-remove [
    network?: string@"nu-complete docker network"
    --force(-f)
] {
    if ($network | is-empty) {
        ^$env.CONTCTL network prune
    } else {
        ^$env.CONTCTL network rm $network ...(if $force { [-f] } else { [] })
    }
}

# list containers
export def container-list [
    -n: string@"nu-complete docker ns"
    container?: string@"nu-complete docker containers"
    --all(-a)
] {
    let cli = $env.CONTCTL
    if ($container | is-empty) {
        let fmt = '{"id":"{{.ID}}", "image": "{{.Image}}", "name":"{{.Names}}", "cmd":{{.Command}}, "port":"{{.Ports}}", "status":"{{.Status}}", "created":"{{.CreatedAt}}"}'
        let fmt = if $cli == 'podman' { $fmt | str replace '{{.Command}}' '"{{.Command}}"' | str replace '{{.CreatedAt}}' '{{.Created}}' } else { $fmt }
        let all = if $all {[-a]} else {[]}
        ^$cli ps ...$all --format $fmt
            | lines
            | each {|x|
                let r = $x | from json
                let t = $r.created | into datetime
                $r | upsert created $t
            }
    } else {
        let r = ^$cli ...($n | with-flag -n) inspect $container
            | from json
            | get 0
        let image = $r.Image
        let img = ^$cli ...($n | with-flag -n) inspect $image
            | from json
            | get 0
        let imgCmd = $img.Config.Cmd?
        let imgEnv = $img.Config.Env?
            | reduce -f {} {|i, a|
                let x = $i | split row '='
                $a | upsert $x.0 $x.1?
            }
        let m = $r.Mounts
            | reduce -f {} {|i, a|
                if $i.Type == 'bind' {
                    $a | upsert $i.Source? $i.Destination?
                } else { $a }
            }
        let p = $r.NetworkSettings.Ports? | default {} | transpose k v
            | reduce -f {} {|i, a| $a | upsert $i.k $"($i.v.HostIp?.0?):($i.v.HostPort?.0?)"}
        {
            name: $r.Name?
            hostname: $r.Config.Hostname?
            id: $r.Id
            status: $r.State.Status?
            image: $image
            created: ($r.Created | into datetime)
            ports: $p
            env: $imgEnv
            mounts: $m
            entrypoint: $r.Path?
            cmd: $imgCmd
            args: $r.Args
        }
    }
}

def parse-img [] {
    let n = $in | split row ':'
    let tag = $n.1? | default 'latest'
    let repo = $n.0 | split row '/'
    let image = $repo | last
    let repo = $repo | range 0..-2 | str join '/'
    {image: $image, tag: $tag, repo: $repo}
}

# select image
export def image-select [name] {
    let n = $name | parse-img
    let imgs = (image-list)
    let fs = [image tag repo]
    for i in 2..0 {
        let r = $imgs | filter {|x|
            $fs | range 0..$i | all {|y| ($n | get $y) == ($x | get $y) }
        }
        if ($r | is-not-empty) {
            return ($r | sort-by -r created | first | get name)
        }
    }
    $name
}

# list images
export def image-list [
    -n: string@"nu-complete docker ns"
    image?: string@"nu-complete docker images"
] {
    if ($image | is-empty) {
        let fmt = '{"id":"{{.ID}}", "repo": "{{.Repository}}", "tag":"{{.Tag}}", "size":"{{.Size}}" "created":"{{.CreatedAt}}"}'
        ^$env.CONTCTL ...($n | with-flag -n) images --format $fmt
            | lines
            | each {|x|
                let x = $x | from json
                let img = $x.repo | parse-img
                {
                    name: $"($x.repo):($x.tag)"
                    id: $x.id
                    created: ($x.created | into datetime)
                    size: ($x.size | into filesize)
                    repo: $img.repo
                    image: $img.image
                    tag: $x.tag
                }
            }
    } else {
        let r = ^$env.CONTCTL ...($n | with-flag -n) inspect $image
            | from json
            | get 0
        let e = $r.Config.Env?
            | reduce -f {} {|i, a|
                let x = $i | split row '='
                $a | upsert $x.0 $x.1?
            }
        let id = if $env.CONTCTL == 'nerdctl' {
            $r.RepoDigests.0? | split row ':' | get 1 | str substring 0..<12
        } else {
            $r.Id | str substring 0..<12
        }
        {
            id: $id
            created: ($r.Created | into datetime)
            author: $r.Author
            arch: $r.Architecture
            os: $r.Os
            size: $r.Size
            labels: $r.Labels?
            user: $r.Config.User?
            env: $e
            entrypoint: $r.Config.Entrypoint?
            cmd: $r.Config.Cmd?
        }
    }
}

def "nu-complete docker ps" [] {
    ^$env.CONTCTL ps
    | from ssv -a
    | each {|x| {description: $x.NAMES value: $x.'CONTAINER ID'}}
}

def "nu-complete docker containers" [] {
    ^$env.CONTCTL ps -a
    | from ssv -a
    | each {|i|
        let st = if ($i.STATUS | str starts-with 'Up') { ' ' } else { '!' }
        { id: $i.'CONTAINER ID', name: $i.NAMES, status: $st }
    }
    | group-by name
    | transpose k v
    | each {|i|
        let s = ($i.v | length) == 1
        $i.v | each {|i|
            if $s {
                {value: $i.name, description: $"($i.status) ($i.id)"}
            } else {
                {value: $i.id, description: $"($i.status) ($i.name)"}
            }
        }
    }
    | flatten
}

# TODO: filter by description
def "nu-complete docker containers b" [] {
    ^$env.CONTCTL ps -a
    | from ssv -a
    | each {|i|
        let s = if ($i.STATUS | str starts-with 'Up') { ' ' } else { '!' }
        { value: $i.'CONTAINER ID', description: $"($s) ($i.NAMES)" }
    }
}

def "nu-complete docker images" [] {
    ^$env.CONTCTL images
    | from ssv
    | each {|x| $"($x.REPOSITORY):($x.TAG)"}
}


# container log
export def container-log [
    container: string@"nu-complete docker containers"
    -l: int = 100 # line
    -n: string@"nu-complete docker ns" # namespace
] {
    let l = if $l == 0 { [] } else { [--tail $l] }
    ^$env.CONTCTL ...($n | with-flag -n) logs -f ...$l $container
}

export def container-log-trunc [
    container: string@"nu-complete docker containers"
    -n: string@"nu-complete docker ns" # namespace
] {
    if $env.CONTCTL == 'podman' {
        print -e $'(ansi yellow)podman(ansi dark_gray) isn’t supported(ansi reset)'
    } else {
        let f = ^$env.CONTCTL ...($n | with-flag -n) inspect --format='{{.LogPath}}' $container
        truncate -s 0 $f
    }
}

# attach container
export def --wrapped container-attach [
    container: string@"nu-complete docker containers"
    -n: string@"nu-complete docker ns"
    ...args
] {
    let ns = $n | with-flag -n
    if ($args | is-empty) {
        let cmd = [
            '/usr/local/bin/nu'
            '/bin/nu'
            '/bin/bash'
            '/bin/sh'
        ]
        | str join ' '
        | $"for sh in ($in); do if [ -e $sh ]; then exec $sh; fi; done"
        ^$env.CONTCTL ...$ns exec -it $container /bin/sh -c $cmd
    } else {
        ^$env.CONTCTL ...$ns exec -it $container ...$args
    }
}

def "nu-complete docker cp" [cmd: string, offset: int] {
    let argv = $cmd | str substring ..<$offset | split row ' '
    let p = if ($argv | length) > 2 { $argv | get 2 } else { $argv | get 1 }
    let container = ^$env.CONTCTL ps
        | from ssv -a
        | each {|x| {description: $x.'CONTAINER ID' value: $"($x.NAMES):" }}
    let n = $p | split row ':'
    if $"($n | get 0):" in ($container | get value) {
        ^$env.CONTCTL exec ($n | get 0) sh -c $"ls -dp ($n | get 1)*"
        | lines
        | each {|x| $"($n | get 0):($x)"}
    } else {
        let files = do -i {
            ls -a ($"($p)*" | into glob)
            | each {|x| if $x.type == dir { $"($x.name)/"} else { $x.name }}
        }
        $files | append $container
    }
}

# copy file
export def container-copy-file [
    lhs: string@"nu-complete docker cp",
    rhs: string@"nu-complete docker cp"
] {
    ^$env.CONTCTL cp $lhs $rhs
}

# remove container
export def container-remove [container: string@"nu-complete docker containers" -n: string@"nu-complete docker ns"] {
    let cs = ^$env.CONTCTL ...($n | with-flag -n) ps -a | from ssv -a | get NAMES
    if $container in $cs {
        ^$env.CONTCTL ...($n | with-flag -n) container rm -f $container
    } else {
        print -e $"(ansi grey)container (ansi yellow)($container)(ansi grey) not exist(ansi reset)"
    }
}


# history
export def container-history [image: string@"nu-complete docker images" -n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) history --no-trunc $image | from ssv -a
}


# save images
export def image-save [-n: string@"nu-complete docker ns" ...image: string@"nu-complete docker images"] {
    ^$env.CONTCTL ...($n | with-flag -n) save ...$image
}

# load images
export def image-load [-n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) load
}

# system prune
export def system-prune [-n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) system prune -f
}

# system prune all
export def system-prune-all [-n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) system prune --all --force --volumes
}

# remove image
export def image-remove [image: string@"nu-complete docker images" -n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) rmi $image
}

# add new tag
export def image-tag [from: string@"nu-complete docker images"  to: string -n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) tag $from $to
}

# push image
export def image-push [
    image: string@"nu-complete docker images"
    --tag(-t): string
    -n: string@"nu-complete docker ns" -i
] {
    let $insecure = if $i {[--insecure-registry]} else {[]}
    if ($tag | is-empty) {
        ^$env.CONTCTL ...($n | with-flag -n) ...$insecure push $image
    } else {
        ^$env.CONTCTL ...($n | with-flag -n) tag $image $tag
        do -i {
            ^$env.CONTCTL ...($n | with-flag -n) ...$insecure push $tag
        }
        ^$env.CONTCTL ...($n | with-flag -n) rmi $tag
    }
}

# pull image
export def image-pull [image -n: string@"nu-complete docker ns" -i] {
    let $insecure = if $i {[--insecure-registry]} else {[]}
    ^$env.CONTCTL ...($n | with-flag -n) ...$insecure pull $image
}

### list volume
export def volume-list [-n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) volume ls | from ssv -a
}

def "nu-complete docker volume" [] {
    ^$env.CONTCTL volume ls
    | from ssv -a
    | get 'VOLUME NAME'
}

# create volume
export def volume-create [name: string -n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) volume create $name
}

# inspect volume
export def volume-inspect [name: string@"nu-complete docker volume" -n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) volume inspect $name
}

# remove volume
export def volume-remove [...name: string@"nu-complete docker volume" -n: string@"nu-complete docker ns"] {
    ^$env.CONTCTL ...($n | with-flag -n) volume rm ...$name
}

# dump volume
export def volume-dump [
    name: string@"nu-complete docker volume"
    --image(-i): string='debian'
    -n: string@"nu-complete docker ns"
] {
    let id = random chars -l 6
    ^$env.CONTCTL ...($n | with-flag -n) ...[
        run --rm
        -v $"($name):/tmp/($id)"
        $image
        sh -c $'cd /tmp/($id); tar -zcf - *'
    ]
}

# restore volume
export def volume-restore [
    name: string@"nu-complete docker volume"
    --from(-f): string
    --image(-i): string='debian'
    -n: string@"nu-complete docker ns"
] {
    let id = random chars -l 6
    let src = random chars -l 6
    ^$env.CONTCTL ...($n | with-flag -n) ...[
        run --rm
        -v $"($name):/tmp/($id)"
        -v $"(host-path $from):/tmp/($src)"
        $image
        sh -c $'cd /tmp/($id); tar -zxf /tmp/($src)'
    ]
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

def "nu-complete docker run sshkey" [ctx: string, pos: int] {
    ls ~/.ssh/**/*.pub
    | get name
    | path relative-to ~/.ssh
}

def "nu-complete docker run proxy" [] {
    let hostaddr = do -i { hostname -I | split row ' ' | get 0 }
    [ $"http://($hostaddr):7890" $"http://($hostaddr):" ]
}

def host-path [path] {
    match ($path | str substring ..<1) {
        '/' => { $path }
        '=' => { $path | str substring 1.. }
        '~' => { [ $env.HOME ($path | str substring 2..) ] | path join }
        '$' => { $env | get ($path | str substring 1..) }
        _   => { [ $env.PWD $path ] | path join }
    }
}

# run
export def container-create [
    --name: string
    --debug(-x)
    --appimage
    --netadmin
    --proxy: string@"nu-complete docker run proxy"      # proxy
    --ssh(-s): string@"nu-complete docker run sshkey"   # specify ssh key
    --sshuser: string=root                              # default root
    --cache(-c): string                                 # cache
    --mnt(-m): string@"nu-complete docker run vol"      # mnt
    --vols(-v): any                                     # { host: container }
    --ports(-p): any                                    # { 8080: 80 }
    --envs(-e): any                                     # { FOO: BAR }
    --daemon(-d)
    --join(-j): string@"nu-complete docker containers"  # join
    --network: string@"nu-complete docker network"      # network
    --workdir(-w): string                               # workdir
    --entrypoint: string                                # entrypoint
    --dry-run
    --with-x
    --privileged(-P)
    --namespace(-n): string@"nu-complete docker ns"
    image: string@"nu-complete docker images"           # image
    ...cmd                                              # command args
] {
    mut args = []

    $args ++= ($namespace | with-flag -n)
    $args ++= ($entrypoint | with-flag --entrypoint)
    if $daemon { $args ++= [-d] } else { $args ++= [--rm -it] }
    $args ++= ($mnt | with-flag -v)
    if ($workdir | is-not-empty) {
        $args ++= [-w $workdir -v $"($env.PWD):($workdir)"]
    }
    $args ++= if ($vols | is-empty) { [] } else { $vols | transpose k v | each {|x| [-v $"(host-path $x.k):($x.v)"]} | flatten }
    $args ++= if ($envs | is-empty) { [] } else { $envs | transpose k v | each {|x| [-e $"($x.k)=($x.v)"]} | flatten }
    $args ++= if ($ports | is-empty) { [] } else { $ports | transpose k v | each {|x| [-p $"($x.k):($x.v)"] } | flatten }
    if $debug {
        $args ++= [--cap-add=SYS_ADMIN --cap-add=SYS_PTRACE --security-opt seccomp=unconfined]
    }
    if $appimage { $args ++= [--device /dev/fuse --security-opt apparmor:unconfined] }
    if $privileged { $args ++= [--privileged] }
    if $appimage { $args ++= [--device /dev/fuse] }
    if $netadmin { $args ++= [--cap-add=NET_ADMIN --device /dev/net/tun] }
    if $with_x {
        $args ++= [ -e $"DISPLAY=($env.DISPLAY)" -v /tmp/.X11-unix:/tmp/.X11-unix ]
    }
    if ($ssh | is-not-empty) {
        let sshkey = cat ([$env.HOME .ssh $ssh] | path join) | split row ' ' | get 1
        $args ++= [-e $"ed25519_($sshuser)=($sshkey)"]
    }
    if ($proxy | is-not-empty) {
        $args ++= [-e $"http_proxy=($proxy)" -e $"https_proxy=($proxy)"]
    }
    if ($join | is-not-empty) {
        let c = $"container:($join)"
        $args ++= [--pid $c --network $c]
        if $env.CONTCTL in ['podman'] { $args ++= [--uts $c --ipc $c] }
    }
    if ($network | is-not-empty) and ($join | is-empty) {
        $args ++= [--network $network]
    }
    $args ++= ($cache | with-flag -v)

    let name = if ($name | is-empty) {
        let img = $image | split row '/' | last | str replace ':' '-'
        let now = date now | format date %m%d%H%M
        $"($img)_($now)"
    } else {
        $name
    }

    if $dry_run {
        echo ([docker run --name $name $args $image $cmd] | flatten | str join ' ')
    } else {
        ^$env.CONTCTL run --name $name ...$args $image ...($cmd | flatten)
    }
}

export alias d = container
export alias dp = container-list
export alias dr = container-create
export alias dcr = container-remove
export alias da = container-attach
export alias dl = container-log
export alias dlt = container-log-trunc
export alias dcp = container-copy-file
export alias dh = container-history
export alias di = image-list
export alias dps = image-push
export alias dpl = image-pull
export alias dsv = image-save
export alias dld = image-load
export alias dt = image-tag
export alias drmi = image-remove
export alias dsp = system-prune
export alias dspall = system-prune-all
export alias dvl = volume-list
export alias dvc = volume-create
export alias dvi = volume-inspect
export alias dvr = volume-remove
export alias dn = containers-network-list
export alias dnc = containers-network-create
export alias dnr = containers-network-remove

export use registry.nu *
export use buildah.nu *

