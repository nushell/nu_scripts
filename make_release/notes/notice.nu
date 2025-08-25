# Add an entry to the "notices" field of a PR
export def add-notice [type: string, message: string]: record -> record {
    upsert notices {
        append {type: $type, message: $message}
    }
}

# Print all of the notices associated with a PR
export def display-notices []: table -> nothing {
    let prs = $in
    let types = [
        [type, color, rank];
        [info, (ansi default), 0]
        [warning, (ansi yellow), 1]
        [error, (ansi red), 2]
    ]

    $prs
    | flatten -a notices
    | group-by --to-table type? message?
    | sort-by {|i| $types | where type == $i.type | only rank } message
    | each {|e|
        let color = $types | where type == $e.type | only color
        print $"($color)PRs with ($e.message):"
        $e.items | each { format-pr | print $"- ($in)" }
        print ""
    }
    print -n (ansi reset)
}
