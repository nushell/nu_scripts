const TYPES = [
    [type, color, rank];
    [info, (ansi default), 0]
    [warning, (ansi yellow), 1]
    [error, (ansi red), 2]
]

# Add an entry to the "notices" field of a PR
export def add-notice [type: string, message: string]: record -> record {
    upsert notices {
        append {type: $type, message: $message}
    }
}

export def group-notices []: table -> table {
    let prs = $in

    $prs
    | flatten -a notices
    | group-by --to-table type? message?
    | sort-by {|i| $TYPES | where type == $i.type | only rank } message
}

# Print all of the notices associated with a PR
export def display-notices []: table -> nothing {
    group-notices
    | each {|e|
        let color = $TYPES | where type == $e.type | only color
        let number = $e.items | length
        print $"($color)($number) PR\(s\) with ($e.message):"
        $e.items | each { format-pr | print $"- ($in)" }
        print ""
    }
    print -n (ansi reset)
}
