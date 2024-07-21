#!/usr/bin/env nu

use std log

def open-pr [
    repo: path
    remote: string
    pr: record<
        branch: string
        title: string
        body: string
    >
] {
    cd $repo
    gh repo set-default $remote

    log info "mock up pr"
    (
        gh pr create
            --head $pr.branch
            --base main
            --title $pr.title
            --body $pr.body
            --draft
    )
}

def clean [repo: path] {
    log info "removing the repo"
    rm -rf $repo
}

# open the release note PR interactively
#
# # Example
#     [this PR](https://github.com/nushell/nushell.github.io/pull/916) has been created with the script
#     > ./make_release/release-note/create-pr 0.81 2023-06-06
def main [
    version: string # the version of the release, e.g. `0.80`
    date: datetime # the date of the upcoming release, e.g. `2023-05-16`
] {
    let repo = ($nu.temp-path | path join (random uuid))
    let branch = $"release-notes-($version)"

    let blog_path = (
        $repo | path join "blog" $"($date | format date "%Y-%m-%d")-nushell_($version | str replace --all '.' '_').md"
    )

    let title = $"Release notes for `($version)`"
    let body = $"Please add your new features and breaking changes to the release notes
by opening PRs against the `release-notes-($version)` branch.

## TODO
- [ ] look at interesting contributions
- [ ] write all the sections
- [ ] order the sections by interest
- [ ] add the breaking changes
- [ ] detail the breaking changes
- [ ] add the full changelog
- [ ] complete all the `TODO`s inside the release note
- [ ] ... \(PRs that need to land before the release, e.g. [deprecations]\(https://github.com/nushell/nushell/labels/deprecation\) or [removals]\(https://github.com/nushell/nushell/pulls?q=is%3Apr+is%3Aopen+label%3Aremoval-after-deprecation\)\)"

    log info "creating release note from template"
    let release_note = $env.CURRENT_FILE
        | path dirname
        | path join "template.md"
        | open
        | str replace --all "{{VERSION}}" $version

    log info $"branch: ($branch)"
    log info $"blog: ($blog_path | str replace $repo "" | path split | skip 1 | path join)"
    log info $"title: ($title)"

    match (["yes" "no"] | input list --fuzzy "Inspect the release note document? ") {
        "yes" => {
            if $env.EDITOR? == null {
                error make --unspanned {
                    msg: $"(ansi red_bold)$env.EDITOR is not defined(ansi reset)"
                }
            }

            let temp_file = $nu.temp-path | path join $"(random uuid).md"
            $release_note | save --force $temp_file
            ^$env.EDITOR $temp_file
            rm --recursive --force $temp_file
        },
        "no" | "" | _ => {},
    }

    match (["no" "yes"] | input list --fuzzy "Open release note PR? ") {
        "yes" => {},
        "no" | "" | _ => {
            log warning "aborting."
            return
        },
    }

    log info "setting up nushell.github.io repo"
    git clone https://github.com/nushell/nushell.github.io $repo --origin nushell --branch main --single-branch
    git -C $repo remote set-url nushell --push git@github.com:nushell/nushell.github.io.git

    log info "creating release branch"
    git -C $repo checkout -b $branch

    log info "writing release note"
    $release_note | save --force $blog_path

    log info "committing release note"
    git -C $repo add $blog_path
    git -C $repo commit -m $"($title)\n\n($body)"

    log info "pushing release note to nushell"
    git -C $repo push nushell $branch

    let out = (do -i { gh auth status } | complete)
    if $out.exit_code != 0 {
        clean $repo

        let pr_url = $"https://github.com/nushell/nushell.github.io/compare/($branch)?expand=1"
        error make --unspanned {
            msg: ([
                $out.stderr
                $"please open the PR manually from a browser (ansi blue_underline)($pr_url)(ansi reset)"
            ] | str join "\n")
        }
    }

    log info "opening pull request"
    open-pr $repo nushell/nushell.github.io {
        branch: $"nushell:($branch)"
        title: $title
        body: $body
    }

    clean $repo
}
