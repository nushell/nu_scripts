export def agree [
    prompt
    --default-not (-n)
] {
    let prompt = if ($prompt | str ends-with '!') {
        $'(ansi red)($prompt)(ansi reset)'
    } else {
        $'($prompt)'
    }
    (if $default_not { [no yes] } else { [yes no] } | input list $prompt) == 'yes'
}

export def tips [ msg ] {
    print -e $"(ansi light_gray)($msg)(ansi reset)"
}

export def --wrapped with-flag [...flag] {
    if ($in | is-empty) { [] } else { [...$flag $in] }
}

