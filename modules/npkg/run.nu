#####################
###     utils     ###
#####################

let no = {|x| not $x }

def flip [x, ...a] { do $x $in $a }

def record-to-struct [$k $v] {
    $in | transpose $k $v | get 0
}

def is-blank [txt] {
    ($txt | str replace -ra '\s' '') == ''
}

def unindent [] {
    let txt = $in | lines
    let ib = if (is-blank $txt.0) { 1 } else { 0 }
    let ie = if (is-blank ($txt | last)) { -2 } else { -1 }
    let txt = $txt | range $ib..$ie
    let indent = $txt.0 | parse --regex '^(?P<indent>\s*)' | get indent.0 | str length
    $txt
    | each {|s| $s | str substring $indent.. }
    | str join (char newline)
}

def cmd-with-args [tmpl] {
    {|args| do $tmpl ($args | str join ' ') | unindent }
}

def 'str repeat' [n] {
    let o = $in
    mut a = ''
    if $n < 1 { return '' }
    for _ in 1..$n {
        $a = $"($a)($o)"
    }
    $a
}

def log [title=''] {
    let o = $in
    print $"<<<<<< ($title) >>>>>>"
    print ($o | to yaml)
    print $">>>>>> ($title) <<<<<<"
    print $"(char newline)"
}

def 'bits check' [bit] {
    ( $in | bits and  (1 | bits shl $bit) ) > 0
}

def deduplicate [getter] {
    let list = $in
    mut ex = []
    mut rt = []
    for i in $list {
        let n = do $getter $i
        if ($n in $ex | flip $no) {
            $ex ++= $n
            $rt ++= $i
        }
    }
    $rt
}

def is-record [] {
    ($in | describe -d).type == 'record'
}

def os-type [] {
    let info = cat /etc/os-release
    | lines
    | reduce -f {} {|x, acc|
        let a = $x | split row '='
        $acc | upsert $a.0 ($a.1| str replace -a '"' '')
    }
    if 'ID_LIKE' in $info {
        if ($info.ID_LIKE | parse -r '(rhel|fedora|redhat)' | is-empty | flip $no) {
            'redhat'
        } else {
            $info.ID_LIKE
        }
    } else {
        $info.ID
    }
}

######################
###      deps      ###
######################
def calc-dep-require [pkgs comp] {
    let dep = if ($comp.require? | is-empty | flip $no) {
        $pkgs
        | where name in $comp.require
        | each {|y| calc-dep-require $pkgs $y}
        | flatten
    } else {
        []
    }
    $comp | append $dep
}

def calc-dep-use [pkgs comp] {
    let r = if ($comp.require? | is-empty) { [] } else { $comp.require }
    let r = $r | append (if ($comp.use? | is-empty) { [] } else { $comp.use })
    $comp
    | append (
        if ($r | is-empty) {
            []
        } else {
            $pkgs
            | where name in $r
            | each {|y| calc-dep-use $pkgs $y}
            | flatten
        }
    )
}

def sort-deps [cs] {
    let o = $in
    let r = $o
        | where name in $cs
        | each {|y| calc-dep-require $o $y }
        | flatten
        | deduplicate {|y| $y.name }
    let u = $o
        | where name in $cs
        | each {|y| calc-dep-use $o $y }
        | flatten
        | deduplicate {|y| $y.name }
    {
        require: $r
        use: $u
    }
}

def resolve-pkgs [] {
    let o = $in
        | reduce -f {require: [], use: []} {|x, acc|
            mut acc = $acc
            if ($x.require?.include? | is-empty | flip $no) {
                $acc.require = ($acc.require | append $x.require.include)
            }
            if ($x.use?.include? | is-empty | flip $no) {
                $acc.use = ($acc.use | append $x.use.include)
            }
            $acc
        }
    let r = $o.require | deduplicate {|x| $x}
    let u = $o.use | deduplicate {|x| $x}
    {
        require: $r
        use: ($u | filter {|x| $x in $r | flip $no })
    }
}

def resolve-def [defs require --os-type:string] {
    mut os = []
    mut recipe = []
    mut pip = []
    mut npm = []
    mut cargo = []
    mut stack = []
    mut go = []
    let require = if ($require | is-empty) { [] } else { $require }
    for p in $require {
        if ($p | is-record) {
            for i in ($p | transpose k v) {
                match $i.k {
                    'pip' => { $pip ++= $i.v }
                    'npm' => { $npm ++= $i.v }
                    'cargo' => { $cargo ++= $i.v }
                    'stack' => { $stack ++= $i.v }
                    'go' => { $go ++= $i.v }
                }
                if $i.k == $os_type {
                    $os ++= $i.v
                }
            }
        } else if ($p in $defs) {
            $recipe ++= $p
        } else {
            $os ++= $p
        }
    }
    {
        os: $os
        recipe: $recipe
        pip: $pip
        npm: $npm
        cargo: $cargo
        stack: $stack
        go: $go
    }
}

def merge-actions [defs --os-type:string] {
    let d = $in
    {
        require: (resolve-def $defs $d.require --os-type $os_type)
        use: (resolve-def $defs $d.use --os-type $os_type)
    }
}


######################
###      acts      ###
######################
def resolve-filename [version] {
    $in | str replace -a '%v' $version
}

def resolve-tar-filter [filter target version] {
    if ($filter | is-empty) { [] } else {
        $filter
        | each {|x|
            if ($x | describe -d | get type) == 'record' {
                let tf = $x.file | resolve-filename $version
                let fn = $tf | split row '/' | last
                let nf = $x.rename | resolve-filename $version
                [$tf $'($target)/($fn)' $'($target)/($nf)']
            } else {
                [($x | resolve-filename $version)]
            }
        }
    }
}

def resolve-zip-filter [filter target version strip] {
    let nl = (char newline)
    let strip = if ($strip | is-empty) { 0 } else { $strip }
    if ($filter | is-empty) { '' } else {
        $filter
        | each {|x|
            if ($x | describe -d | get type) == 'record' {
                $"mv ${temp_dir}/($x.file) ($target)/($x.rename)"
            } else {
                let f = $x | resolve-filename $version
                let t = $f | split row '/' | range $strip.. | str join '/'
                $"mv ${temp_dir}/($f) ($target)/($t)"
            }
        }
        | str join $nl
    }
}

def resolve-unzip [getter ctx] {
    let gtt = $getter.0
    let gtd = $getter.1
    let trg = [$ctx.target $ctx.wrap?]
        | filter {|x| $x | is-empty | flip $no }
        | path join
    let fmt = if ($ctx.format? | is-empty | flip $no) { $ctx.format } else {
        let fn = $ctx.file | split row '.'
        let zf = $fn | last
        if ($fn | range (-2..-2) | get 0) == 'tar' {
            $"tar.($zf)"
        } else {
            $zf
        }
    }
    let decmp = match $fmt {
        'tar.gz'  => $"tar zxf"
        'tar.zst' => $"zstd -d -T0 | tar xf"
        'tar.bz2' => $"tar jxf"
        'tar.xz'  => $"tar Jxf"
        'gz'      => $"gzip -d"
        'zst'     => $"zstd -d"
        'bz2'     => $"bzip2 -d"
        'xz'      => $"xz -d"
        'zip'     => $"unzip"
        _ => "(!unknown format)"
    }
    if ($fmt | str starts-with 'tar.') {
        let s = if ($ctx.strip? | is-empty) { '' } else {
            $"--strip-components=($ctx.strip)"
        }
        let f = (resolve-tar-filter $ctx.filter? $trg $ctx.version?)
            | reduce -f {fs: [], mv: []} {|x, acc|
                let acc = if ($x.0? | is-empty) { $acc } else {
                    $acc | update fs ($acc.fs | append $x.0?)
                }
                let acc = if ($x.1? | is-empty) { $acc } else {
                    $acc | update mv ($acc.mv | append $"mv ($x.1) ($x.2)")
                }
                $acc
            }
        let u = [$gtt '|' $decmp '-' $s '-C' $trg ($f.fs | str join ' ')]
        | filter {|x| $x | is-empty | flip $no }
        | str join ' '
        [$'mkdir -p ($trg)' $u] | append $f.mv |
        | filter {|x| $x | is-empty | flip $no }
    } else if $fmt == 'zip' {
        let f = (resolve-zip-filter $ctx.filter? $trg $ctx.version? $ctx.strip?)
        [ 'opwd=${PWD}'
          $'mkdir -p ($trg)'
          'temp_dir=$(mktemp -d)'
          'cd ${temp_dir}'
          $'($gtd)'
          $'($decmp) ($ctx.file)'
          (if $f == '' {
            $'mv ${temp_dir}/* ($ctx.target)'
          } else {
            $f
          })
          'cd ${opwd}'
          'rm -rf ${temp_dir}'
        ]
    } else {
        let n = if ($ctx.filter? | is-empty) { $ctx.name } else { $ctx.filter | first }
        let t = [$trg $n] | path join
        [
          $'mkdir -p ($trg)'
            $"($gtt) | ($decmp) > ($t)"
        ]
    }
    | str join (char newline)
}

def resolve-download-filename [ctx] {
    let ver = $ctx.version
    let fn = $ctx.filename?
    let url = $ctx.url | resolve-filename $ver
    let file = if ($fn | is-empty) {  $url | split row '/' | last } else { $fn }
    let file = $file | resolve-filename $ver
    { url: $url, file: $file }
}

def gen-download [ctx] {
    let cache = $ctx.cache?
    let target = $ctx.target?
    if ($ctx.url? | is-empty) {
        [$"# ($ctx.name) [not found]"]
    } else {
        let x = resolve-download-filename $ctx
        let f = if ($cache | is-empty) {
            [$"curl -sSL ($x.url)" $"curl -sSLo ($x.file) ($x.url)"]
        } else {
            let f = [$cache $x.file] | path join
            if ($cache | find -r '^https?://' | is-empty) {
                [$"cat ($f)" $"cp ($f) ($x.file)"]
            } else {
                [$"curl -sSL ($f)" $"curl -sSLo ($x.file) ($f)"]
            }
        }
        let cx = $ctx | merge {file: $x.file, cache: $cache, target: $target}
        [$"### download ($ctx.name)" (resolve-unzip $f $cx)]
    }
}

def gen-git [$ctx] {
    [$"### git ($ctx.name)"
     $"pwd; opwd=${PWD}"
     $"git clone --depth=2 ($ctx.url) ($ctx.target)"
     $"cd ($ctx.target)"
     "git log -1 --date=iso"
     "cd ${opwd}; pwd"
    ]
}

def gen-shell [it sep] {
    let c = $it.cmd | str join $sep
    let c = if ($it.runner? | is-empty) { $c } else { $"($it.runner) '($c)'" }
    [$"### shell ($it.name)"
     $"pwd; opwd=${PWD}; cd ($it.workdir)"
     $c
     "cd ${opwd}; pwd"
    ]
}

def resolve-recipe [ctx name] {
    let vs = $ctx.data.versions
    let version = if $name in $vs { $vs | get $name } else { "" }
    let install = ($ctx.defs | get $name).install?
    let install = if ($install | is-empty) { [] } else { $install }
    $install
    | each {|x|
        let r = $x | record-to-struct type data
        let d = if ($r.data? | is-empty) { {} } else { $r.data }
        {
            cache: $ctx.cache?
            target: $ctx.target?
        }
        | merge $d
        | merge {
            type: $r.type
            name: $name
            version: $version
        }
    }
}

def gen-recipe-env [ctx] {
    $ctx.arg
    | reduce -f [] {|i, acc|
        let e = ($ctx.defs | get $i).env?
        if ($e | is-empty) { $acc } else {
            let es = $e
            | transpose k v
            | each {|x|
                if ($x.k | str starts-with '+') {
                    let n = $x.k | str substring 1..
                    [
                    $"export ($n)=($x.v):${($n)}"
                    $"echo '($n)=($x.v):${($n)}' >> /etc/environment"
                    ]
                } else {
                    [
                    $"export ($x.k)=($x.v)"
                    $"echo '($x.k)=($x.v)' >> /etc/environment"
                    ]
                }
            }
            $acc | append $es
        }
    }
    | flatten
    | str join (char newline)
}

def gen-recipe [ctx] {
    $ctx.arg
    | each {|i| resolve-recipe $ctx $i }
    | flatten
    | each {|i|
        match $i.type {
            download => {
                gen-download $i
            }
            git => {
                gen-git $i
            }
            shell => {
                gen-shell $i (char newline)
            }
            exec => {
                gen-shell $i ' '
            }
        }
        | str join (char newline)
    }
    | str join (char newline)
}

#####################
###     setup     ###
#####################
def make-acts [] {
    let default = {
        setup:    {|p| $'echo start'}
        teardown: {|p| $'echo stop'}
        cargo:    {|p| $'cargo install ($p)'}
        stack:    {|p| $'stack install ($p)'}
        go:       {|p| $'go install ($p)'}
        pip:      {|p| $'pip3 install --no-cache-dir ($p)'}
        npm:      {|p| $'npm install --location=global ($p)'}
    }
    let diff = {
        debian: {
            setup:    {|p| $'apt update; apt upgrade'}
            install:  {|p| $'apt install -y --no-install-recommends ($p)'}
            pip:      {|p| $'pip3 install --break-system-packages --no-cache-dir ($p)'}
            clean:    {|p| $'apt remove -y ($p)'}
            teardown: {|p| $'
                apt-get autoremove -y
                apt-get clean -y
                rm -rf /var/lib/apt/lists/*
            '}

        }
        arch: {
            setup:    {|p| $'pacman -Syu'}
            install:  {|p| $'pacman -S ($p)'}
            clean:    {|p| $'pacman -R ($p)'}
            teardown: {|p| $'rm -rf /var/cache/pacman/pkg'}
        }
        alpine: {
            install:  {|p| $'apk add ($p)'}
            clean:    {|p| $'apk del ($p)'}
        }
        redhat: {
            setup:    {|p| $'yum update; yum upgrade'}
            install:  {|p| $'yum install ($p)'}
            clean:    {|p| $'yum remove ($p)'}
            teardown: {|p| $'yum clean all'}
        }
    }
    {|os, act|
        $default | merge ($diff | get $os) | get $act
    }
}

def gen-cmd [ctx] {
    if $ctx.act == 'recipe' {
        [
            (gen-recipe-env $ctx)
            (gen-recipe $ctx)
        ] | str join (char newline)
    } else {
        do (cmd-with-args (do $ctx.actions $ctx.os $ctx.act)) $ctx.arg
    }
}

def run-with-level [ctx] {
    let cmd = (gen-cmd $ctx)
    if $ctx.dry_run {
        print $"#################### ($ctx.act) ####################"
        print $cmd
    } else {
        let sep = '#' | str repeat 80
        print $sep
        print $cmd
        print $sep
        sh -c $"set -eux; ($cmd)"
    }
}

def run [ctx] {
    let a = (make-acts)
    if $ctx.can_ignore {
        if ($ctx.arg | is-empty | flip $no) {
            run-with-level ($ctx | merge {actions: $a})
        }
    } else {
        run-with-level ($ctx | merge {actions: $a})
    }
}

def setup [
    defs
    data
    --os-type:  string
    --target:   string
    --cache:    string
    --dry-run:  bool
    --clean:    bool
] {
    let o = $in
    let d = {
        os: $os_type
        dry_run: $dry_run
        defs: $defs
        data: $data
        target: $target
        cache: $cache
        can_ignore: true
        act: null
        arg: null
    }
    run ($d | upsert act setup    | upsert can_ignore false)
    run ($d | upsert act install  | upsert arg ($o.require.os? | append $o.use.os?))
    run ($d | upsert act recipe   | upsert arg $o.require.recipe?)
    run ($d | upsert act pip      | upsert arg $o.require.pip?)
    run ($d | upsert act npm      | upsert arg $o.require.npm?)
    run ($d | upsert act cargo    | upsert arg $o.require.cargo?)
    run ($d | upsert act stack    | upsert arg $o.require.stack?)
    run ($d | upsert act go       | upsert arg $o.require.go?)
    if $clean {
        run ($d | upsert act clean    | upsert arg $o.use.os?)
        run ($d | upsert act teardown | upsert can_ignore false)
    }
}

#####################
###    version    ###
#####################
def extract [input act arg?] {
    match $act {
        from-json => {
            $input | from json
        }
        prefix => {
            $"($arg)($input)"
        }
        index => {
            $input | get $arg
        }
        field => {
            if ($arg | is-empty) {
                $input
            } else {
                if $arg in $input {
                    $input | get $arg
                } else {
                    null
                }
            }
        }
        trim => {
            $input | str trim
        }
        regexp => {
            $input | parse -r $arg | get 0?.capture0?
        }
        only-nums => {
            $input | parse -r '(?P<v>[0-9\.\-]+)' | get 0?.v?
        }
        github => {
            let ex = [
                {field: 'tag_name'}
                {trim: null }
                {only-nums: null} ]
            run-extractors ($input | from json) $ex
        }
    }
}

def run-extractors [input extractors] {
    $extractors
    | reduce -f $input {|x, acc|
        let r = $x | record-to-struct k v
        extract $acc $r.k $r.v
    }
}

def update-version [manifest] {
    mut data = {}
    for item in ($manifest | transpose k v) {
        let i = $item.v?
        print $'==> ($item.k)'
        let url = $i.version?.url?
        let ext = $i.version?.extract
        if ($url | is-empty | flip $no) {
            let ver = (run-extractors (curl -sSL $url) $ext)
            print $ver
            $data = ($data | upsert $item.k $ver)
        }
    }
    $data
}

#####################
###    download   ###
#####################
def download-recipe [defs versions --cache:string] {
    mkdir /tmp/npkg
    let ctx = {
        defs: $defs
        data: { versions: $versions }
        cache: $cache
    }
    for y in ($defs | columns | each {|x| resolve-recipe $ctx $x }) {
        for i in $y {
            if $i.type == 'download' {
                if ($i.url? | is-empty) {
                    print $'# ($i.name)'
                } else {
                    let x = resolve-download-filename $i
                    print $'# download ($x.file)'
                    let t = [$cache $x.file] | filter {|x| $x | is-empty | flip $no } | path join
                    if ($cache | find -r '^https?://' | is-empty) {
                        wget -c ($x.url) -O ($t)
                    } else {
                        let lt = ['/tmp/npkg' $x.file] | path join
                        wget -c ($x.url) -O ($lt)
                        curl -T ($lt) ($t)
                    }
                }
            }
        }
    }
    rm -rf /tmp/npkg
}

#####################
###      main     ###
#####################
export def main [
    --dry-run
    --clean
    --cache: string
    --target: string = '/usr/local'
    ...args:string@compos
] {
    let debug = if ($env.DEBUG? | is-empty) { 0 } else { $env.DEBUG | into int }
    print $"#===> $env.DEBUG = ($env.DEBUG?)"
    let act = $args.0
    let needs = $args | range 1.. | prepend default
    let manifest = open $"($env.FILE_PWD)/manifest.yml"
    let data = open $"($env.FILE_PWD)/data.yml"
    let ostype = (os-type)
    let pkgs = $manifest.pkgs | sort-deps $needs
    if ($debug | bits check 0) { $pkgs | log 'sort-deps' }
    let pkgs = $pkgs | resolve-pkgs
    if ($debug | bits check 1) { $pkgs | log 'resolve-pkgs' }
    let acts = $pkgs | merge-actions $manifest.defs --os-type $ostype
    if ($debug | bits check 2) { $acts | log 'merge-actions' }
    match $act {
        setup => {
            $pkgs
            | merge-actions $manifest.defs --os-type $ostype
            | setup $manifest.defs $data --os-type $ostype --target $target --dry-run $dry_run --clean $clean
        }
        gensh => {
            let ostype = if ($args.1? | is-empty) { $ostype } else { $args.1 }
            $pkgs
            | merge-actions $manifest.defs --os-type $ostype
            | setup $manifest.defs $data --os-type $ostype --target $target --dry-run true --clean $clean --cache $cache
        }
        update => {
            let x = (update-version $manifest.defs)
            $data
            | upsert versions ($data.versions | merge $x)
            | to yaml
            | save -f $"($env.FILE_PWD)/data.yml"
        }
        download => {
            download-recipe $manifest.defs $data.versions --cache $cache
        }
        debug => {
            $manifest.pkgs | sort-deps1 $needs | log
        }
        _ => {
            echo $manifest | to json
        }

    }
}

def compos [context: string, offset: int] {
    let pkgs = open $"($env.PWD)/manifest.yml" | get pkgs | get name
    [$context $offset] | completion-generator from tree [
        { value: gensh, description: 'gen sh -c', next: (
            [debian arch alpine redhat] | each {|x| { value: $x, next: $pkgs } }
        ) }
        { value: build, description: 'Dockerfile' }
        { value: update, description: 'versions' }
        { value: download, description: 'assets' }
    ]
}
