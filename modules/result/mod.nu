# A module for storing and accessing previously returned results.
# To activate this module, one should set
# `env.config.hooks.display_output = { result hook }`

export-env {
    $env.NU_RESULTS = {
        enable: true
        max_items: 10

        # this is a table with columns value, metadata
        results: []
    }
}

def display [
    meta: record = {}
] {
    # the metadata *MUST* be set *FIRST* since the output of `table` is just a string
    if $meta.source? == ls { metadata set --datasource-ls } else {}
    | if (term size).columns >= 100 { table -e } else { table }
}

def --env trunc [] {
    $env.NU_RESULTS.results = ($env.NU_RESULTS.results | last ((get-max) - 1))
}

def horrible-dircolors-hack [] {
    let obj = $in
    let desc = $in | describe 
}

# enable result caching
export def --env enable [] { $env.NU_RESULTS.enable = true }

# disable result caching
export def --env disable [] { $env.NU_RESULTS.enable = false }

# check whether result caching is enabled
export def --env is-enabled [] { $env.NU_RESULTS.enable }

# Hook to be used in `$nu.config.hooks.display_output`.  This must be set to enable the
# functionality of this module.
export def --env hook [
    --keep-empty  # keep empty values. it's not uncommon for external programs to output empty strings
    --keep-null  # keep null values
] {
    let meta = metadata  # run this first to preserve original metadata
    let res = $in
    trunc
    if (
        (is-enabled) and
        ($keep_null or ($res != null)) and
        ($keep_empty or ($res | is-not-empty))
    ) {
        $env.NU_RESULTS.results = $env.NU_RESULTS.results
        | append [{value: $res, metadata: $meta}]
    }
    enable
    $res | display $meta
}

# returns the number of stored results
export def count [] { $env.NU_RESULTS.results | length }

# get the currently set maximum number of stored results
export def get-max [] { $env.NU_RESULTS.max_items }

# set the maximum number of stored results
export def --env set-max [
    n: int = 10
] {
    trunc
    $env.NU_RESULTS.max_items = $n
}


# Return all stored previous results.
# This disables storing the output, so if you use it in a pipeline and want to store the
# output, pass the `--keep` flag.
export def --env ls [
    --keep(-k)  # keep the result of this call in the list
    --metadata  # return a table preserving the metadata
] {
    if not $keep { disable }
    if $metadata {
        $env.NU_RESULTS.results
    } else {
        $env.NU_RESULTS.results | get value
    }
}
export alias l = ls


# Return a stored result, the very last by default.
# This disables storing the output, so if you use it in a pipeline and want to store the
# output, pass the `--keep` flag.
export def --env main [
    idx: int = -1  # number of previous result, -1 is last
    --keep(-k)  # keep the result of this call in the list
] {
    if not $keep { disable }
    # it's safer not to error because it seems to not enable in some cases
    try {
        $env.NU_RESULTS.results | get ((count) + $idx) | get value
    } catch {|err|
        print $"(ansi grey)\(invalid result fetch\)(ansi reset)"
    }
}

# get the display string for the entry
def get-display [
    idx: int = -1
] {
    let rec = $env.NU_RESULTS.results | get ((count) + $idx)
    $rec.value | display $rec.metadata
}

# Interactively select previous result. Prettier with sk plugin.
# This disables storing the output, so if you use it in a pipeline and want to store the
# output, pass the `--keep` flag.
export def --env select [
    --keep(-k)  # keep the result of this call in the list
    --preview-pos: string = up  # up down left right
    --preview-size: string = '80%'  # height of sk preview window
    --height: string = '40%'  # height of sk selection window
] {
    (-1)..(0 - (count)) | each {}  # convert to list
    | if 'skim' in (plugin list | get name) {
        let binds = {k: up, j: down}
        let lay = $preview_pos ++ ":" ++ $preview_size
        $in | (
            sk -p { get-display $in } --bind=$binds
            --preview-window=$lay --select-1 --exit-0 --height=$height
        ) | main $in
    } else {
        each { main $in } | input list        
    }
}
export alias sel = select

#====================================================================================================
# NOTE:
# lscolors display is dictated by the metadata.
# Most operations do *not* preserve the metadata, so the only way to preserve it is to immediately
# capture it and store it separately.
#===================================================================================================#
