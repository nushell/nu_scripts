# A module for storing and accessing previously returned results.
# To activate this module, one should set
# ```nushell
# $env.config.hooks.display_output = {
#   result hook | if (term size).columns >= 100 { table -e } else { table }
# }
# ```

export-env {
    $env.NU_RESULTS = {
        enable: true
        max_items: 10

        # this is a table with columns value, metadata
        results: []
    }
}

def --env trunc [] {
    $env.NU_RESULTS.results = $env.NU_RESULTS.results | last (get-max)
}

# returns the number of stored results
export def count []: nothing -> int { $env.NU_RESULTS.results | length }

# get the currently set maximum number of stored results
export def get-max []: nothing -> int { $env.NU_RESULTS.max_items }

# set the maximum number of stored results
export def --env set-max [
    n: int = 10
] {
    $env.NU_RESULTS.max_items = $n
    trunc
}

# enable result caching
export def --env enable [] { $env.NU_RESULTS.enable = true }

# disable result caching
export def --env disable [] { $env.NU_RESULTS.enable = false }

# check whether result caching is enabled
export def --env is-enabled []: nothing -> bool { $env.NU_RESULTS.enable }

# Hook to be used in `$nu.config.hooks.display_output`.  This must be set to enable the
# functionality of this module.
export def --env hook [
    --keep-empty  # keep empty values. it's not uncommon for external programs to output empty strings
    --keep-null  # keep null values
] {
    # TODO: make it streaming
    let meta = metadata  # run this first to preserve original metadata
    let res = $in
    if (
        (is-enabled) and
        ($keep_null or ($res != null)) and
        ($keep_empty or ($res | is-not-empty))
    ) {
        $env.NU_RESULTS.results = $env.NU_RESULTS.results
        | append [{value: $res, metadata: $meta}]
        trunc
    }
    enable
    $res | metadata set { $meta }
}

# Return all stored previous results.
# This disables storing the output, so if you use it in a pipeline and want to store the
# output, pass the `--keep` flag.
export def --env ls [
    --keep(-k)  # keep the result of this call in the list
] {
    if not $keep { disable }
    $env.NU_RESULTS.results
}
export alias l = ls


# Return a stored result, the very last by default.
# This disables storing the output, so if you use it in a pipeline and want to store the
# output, pass the `--keep` flag.
export def --env main [
    idx: int = -1  # number of previous result, -1 is last
    --long(-l)  # get the entire result record which includes metadata
    --keep(-k)  # keep the result of this call in the list
] {
    if not $keep { disable }
    let idx = if $idx < 0 { (count) + $idx } else { $idx }
    let result = $env.NU_RESULTS.results | get $idx
    if $long { $result } else { $result.value | metadata set { $result.metadata } }
}

# Interactively select previous result.
# This disables storing the output, so if you use it in a pipeline and want to store the
# output, pass the `--keep` flag.
export def --env select [
    --keep(-k)  # keep the result of this call in the list
    --long(-l)  # get the entire result record which includes metadata
] {
    if (count) > 0 {
        let idx = $env.NU_RESULTS.results | reverse
        | input list --index --fuzzy --display value "select result: "
        if $idx != null { main --long=$long --keep=$keep (-1 - $idx) }
    }
}
export alias sel = select

#====================================================================================================
# NOTE:
# lscolors display is dictated by the metadata.
# Most operations do *not* preserve the metadata, so the only way to preserve it is to immediately
# capture it and store it separately.
#===================================================================================================#

#====================================================================================================
# NOTE:
# This does not capture external program stdout because it is a specially handled stream object
# that is not preserved after the `metadata` operation.
# I decided this is maybe not the worst thing in the world.  One way to capture external output
# is to use `complete`
#===================================================================================================#

