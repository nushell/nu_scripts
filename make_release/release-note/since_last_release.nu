#!/usr/bin/env nu

def main [] {
    let list_merged_prs_script = (
        $env.CURRENT_FILE | path dirname | path join "list-merged-prs"
    )

    let changelogs = [
        [title repo];

        [Nushell nushell/nushell]
        [Extension nushell/vscode-nushell-lang]
        [Documentation nushell/nushell.github.io]
        [Nu_Scripts nushell/nu_scripts]
        [Reedline reedline]
    ]

    $changelogs | each {|changelog|
        [
            $"## ($changelog.title)"
            (^$list_merged_prs_script $changelog.repo --pretty)
        ] | str join "\n"
    }
    | str join "\n\n"
}
