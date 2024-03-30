# kubernetes to docker-compose
export def kube-compose [--without-service(-s)] {
    let a = $in
    let dpl = $a | where kind == 'Deployment'
    mut dpl_svc = {}
    mut svc = {}
    if not $without_service {
        let svcs = $a | where kind == 'Service'
        for s in $svcs {
            for d in $dpl {
                let dl = $d.metadata.labels?
                let ss = $s.spec.selector?
                mut p = true
                for x in ($ss | transpose k v) {
                    if (not ($x.k in $dl)) or (($dl | get $x.k) != $x.v) {
                        $p = false
                        break
                    }
                }
                if $p {
                    let dn = $d.metadata.name
                    let dv = if $dn in $dpl_svc {
                        $dpl_svc | get $dn
                    } else { [] }
                    $dpl_svc = ($dpl_svc | upsert $dn ($dv | append $s.metadata.name))
                }
            }
        }
        $svc = ($svcs
        | reduce -f {} {|i, a|
            $a | upsert $i.metadata.name $i.spec.ports
        })
    }
    let dpl_svc = $dpl_svc
    let svc = $svc

    let cm = $a | where kind == 'ConfigMap'
    | reduce -f {} {|i,a|
        let p = ['.kcmp', 'ConfigMap', $i.metadata.name] | path join
        mkdir $p
        for f in ($i.data | transpose k v) {
            $f.v | save -f ([$p $f.k] | path join)
        }
        $a | insert $i.metadata.name $p
    }
    let sec = $a | where kind == 'Secret'
    | reduce -f {} {|i,a|
        let p = ['.kcmp', 'Secret', $i.metadata.name] | path join
        mkdir $p
        for f in ($i.data | transpose k v) {
            $f.v | decode base64 | save -f ([$p $f.k] | path join)
        }
        $a | insert $i.metadata.name $p
    }
    let pv = $a | where kind == 'PersistentVolume'
    | reduce -f {} {|i,a| $a | insert $i.metadata.name $i.spec.local?.path? }
    let pvc = $a | where kind == 'PersistentVolumeClaim'
    | reduce -f {} {|i,a| $a | insert $i.metadata.name ($pv | get $i.spec.volumeName) }

    let services = $dpl
    | each {|x|
        let d = $x.metadata.name
        let s = if not $without_service {
            $dpl_svc
            | get $d
            | each {|z| $svc | get $z}
            | flatten
            | each {|z| [$z.port $z.targetPort] }
        }

        let v = $x.spec.template.spec.volumes?
        | reduce -f {} {|i,a|
            $a | insert $i.name $i
        }

        $x.spec.template.spec.containers?
        | default []
        | each {|y|
            let ca = $y.securityContext?.capabilities?.add?
            let cd = $y.securityContext?.capabilities?.drop?
            let v = $y.volumeMounts?
            | default []
            | each {|z|
                let sp = $z.subPath? | default ''
                let s = $v | get $z.name
                let s = if ($s.hostPath? | is-not-empty) {
                    $s.hostPath.path
                } else if ($s.path? | is-not-empty) {
                    $s.path
                } else if ($s.persistentVolumeClaim?.claimName? | is-not-empty) {
                    $pvc | get $s.persistentVolumeClaim.claimName
                } else if ($s.configMap?.name? | is-not-empty) {
                    ['.'
                    ($cm | get $s.configMap.name)
                    $sp
                    ] | path join
                } else if ($s.secret?.secretName? | is-not-empty) {
                    ['.'
                    ($sec | get $s.secret.secretName)
                    $sp
                    ] | path join
                } else {
                    $s
                }
                let m = [$z.mountPath $sp] | path join
                $"($s):($m)"
            }
            let s = if $without_service {
                $y.ports? | default [] | each {|x| $"($x.containerPort):($x.containerPort)"}
            } else {
                $s | each {|x|
                    if ($x.1 | find -r '[^0-9]' | is-empty) {
                        $"($x.0):($x.1)"
                    } else {
                        mut p = ''
                        for i in ($y.ports? | default []) {
                            if $i.name == $x.1 {
                                $p = $i.containerPort
                                break
                            }
                        }
                        $"($x.0):($p)"
                    }
                }
            }

            {
                name: $"($d)_($y.name)"
                image: $y.image
                environment: ($y.env? | reduce -f {} {|i,a| $a | insert $i.name $i.value?})
                ports: $s
                entrypoint: $y.command?
                command: $y.args?
                cap_add: $ca
                cap_drop: $cd
                volumes: $v
            }
            | transpose k v
            | reduce -f {} {|i,a|
                if ($i.v | is-empty) {
                    $a
                } else {
                    $a | insert $i.k $i.v
                }
            }
        }
    }
    | flatten
    | reduce -f {} {|i,a|
        $a | insert $i.name ($i | reject name)
    }

    { version: '3.8', services: $services}
    | to yaml
}
