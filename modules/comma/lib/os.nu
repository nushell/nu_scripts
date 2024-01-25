export def distro [] {
    match $nu.os-info.name {
        'linux' => {
            let info = cat /etc/os-release
            | lines
            | reduce -f {} {|x, acc|
                let a = $x | split row '='
                $acc | upsert $a.0 ($a.1| str replace -a '"' '')
            }
            if 'ID_LIKE' in $info {
                if not ($info.ID_LIKE | parse -r '(rhel|fedora|redhat)' | is-empty) {
                    'redhat'
                } else {
                    $info.ID_LIKE
                }
            } else {
                $info.ID
            }
        }
        _ => {
            $nu.os-info.name
        }
    }
}
