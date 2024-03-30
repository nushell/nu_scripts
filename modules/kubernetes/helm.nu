use complete.nu *
use utils.nu *
use argx

export def record-to-set-json [value] {
    $value | transpose k v
    | each {|x| $"($x.k)=($x.v | to json -r)"}
    | str join ','
}

def "nu-complete helm list" [context: string, offset: int] {
    let ctx = $context | argx parse
    kgh -n $ctx.namespace? | each {|x| {value: $x.name  description: $x.updated} }
}

def "nu-complete helm charts" [context: string, offset: int] {
    let ctx = $context | argx parse
    let path = $ctx | get _pos.chart?
    let paths = do -i { ls ($"($path)*" | into glob) | each {|x| if $x.type == dir { $"($x.name)/"} else { $x.name }} }
    helm repo list | from ssv -a | rename value description
    | append $paths
}


# helm list and get
export def kgh [
    name?: string@"nu-complete helm list"
    --namespace (-n): string@"nu-complete kube ns"
    --manifest (-m)
    --values(-v)
    --all (-a)
] {
    if ($name | is-empty) {
        let ns = if $all { [--all] } else { $namespace | with-flag -n }
        helm list ...$ns --output json
        | from json
        | update updated {|x|
            $x.updated
            | str substring ..-4
            | into datetime -f '%Y-%m-%d %H:%M:%S.%f %z'
        }
    } else {
        if $manifest {
            helm get manifest $name ...($namespace | with-flag -n)
        } else if $values {
            helm get values $name ...($namespace | with-flag -n)
        } else {
            helm get notes $name ...($namespace | with-flag -n)
        }
    }
}

# helm install or upgrade via values file
export def kah [
    name: string@"nu-complete helm list"
    chart: string@"nu-complete helm charts"
    valuefile: path
    --values (-v): any
    --namespace (-n): string@"nu-complete kube ns"
    --ignore-image (-i) # for kdh
] {
    let update = $name in (
        helm list ...($namespace | with-flag -n) --output json
        | from json | get name
    )
    let act = if $update { [upgrade] } else { [install] }
    let values = if ($values | is-empty) { [] } else { [--set-json (record-to-set-json $values)] }
    helm ...$act $name $chart -f $valuefile ...$values ...($namespace | with-flag -n)
}

# helm diff
export def kdh [
    name: string@"nu-complete helm list"
    chart: string@"nu-complete helm charts"
    valuefile: path
    --values (-v): any
    --namespace (-n): string@"nu-complete kube ns"
    --ignore-image (-i)
    --has-plugin (-h)
] {
    if $has_plugin {
        helm diff $name $chart -f $valuefile ...($namespace | with-flag -n)
    } else {
        let update = $name in (
            helm list ...($namespace | with-flag -n) --output json
            | from json | get name
        )
        if not $update {
            echo "new installation"
            return
        }

        let values = if ($values | is-empty) { [] } else { [--set-json (record-to-set-json $values)] }
        let target = $'/tmp/($chart | path basename).($name).out.yaml'
        helm template --debug $name $chart -f $valuefile ...$values ...($namespace | with-flag -n) | save -f $target
        if $ignore_image {
            do -i { yq -i ea 'del(.spec.template.spec.containers.[].image)' $target }
        }
        kubectl diff -f $target
    }
}

# helm delete
export def kdelh [
    name: string@"nu-complete helm list"
    --namespace (-n): string@"nu-complete kube ns"
] {
    helm uninstall $name ...($namespace | with-flag -n)
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
    let target = $valuefile | split row '.' | range ..-2 | append [out yaml] | str join '.'
    if (not ($target | path exists)) and (([yes no] | input list $'create ($target)?') in [no]) { return }
    helm template --debug $app $chart -f $valuefile ...$values ...($namespace | with-flag -n)
    | save -f $target
}

