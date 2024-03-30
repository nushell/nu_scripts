export def ensure-cache-by-lines [cache path action] {
    let ls = do -i { open $path | lines | length }
    if ($ls | is-empty) { return false }
    let lc = do -i { open $cache | get lines}
    if not (($cache | path exists) and ($lc | is-not-empty) and ($ls == $lc)) {
        mkdir ($cache | path dirname)
        {
            lines: $ls
            payload: (do $action)
        } | save -f $cache
    }
    (open $cache).payload
}

export def normalize-column-names [ ] {
    let i = $in
    let cols = $i | columns
    mut t = $i
    for c in $cols {
        $t = ($t | rename -c {$c: ($c | str downcase | str replace ' ' '_')})
    }
    $t
}

export def --wrapped with-flag [...flag] {
    if ($in | is-empty) { [] } else { [...$flag $in] }
}

export def `kcache flush` [] {
    rm -rf ~/.cache/nu-complete/k8s/
    nu-complete kube ctx
    rm -rf ~/.cache/nu-complete/k8s-api-resources/
}

export def kube-shortnames [] {
    kubectl api-resources | from ssv -a
    | where SHORTNAMES != ''
    | reduce -f {} {|i,a|
        $i.SHORTNAMES
        | split row ','
        | reduce -f {} {|j,b|
            $b | insert $j $i.NAME
        }
        | merge $a
    }
}

export def parse_cellpath [path] {
    $path | split row '.' | each {|x|
        if ($x | find --regex "^[0-9]+$" | is-empty) {
            $x
        } else {
            $x | into int
        }
    }
}

export def get_cellpath [record path] {
    $path | reduce -f $record {|it, acc| $acc | get $it }
}

export def set_cellpath [record path value] {
    if ($path | length) > 1 {
        $record | upsert ($path | first) {|it|
            set_cellpath ($it | get ($path | first)) ($path | range 1..) $value
        }
    } else {
        $record | upsert ($path | last) $value
    }
}

export def upsert_row [table col mask id value] {
    # let value = ($mask | reduce -f $value {|it, acc|
    #     let path = (parse_cellpath $it)
    #     set_cellpath $value $path (get_cellpath $table $path)
    # })
    if $id in ($table | get $col) {
        $table | each {|x|
            if ($x | get $col) == $id {
                $value
            } else {
                $x
            }
        }
    } else {
        $table | append $value
    }
}

