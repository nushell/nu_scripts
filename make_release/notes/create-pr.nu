use std log

use completions.nu *
use tools.nu release-notes

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
@example "Create a PR for the next release" $"create-pr ($example_version) \(($current_build_date) + 6wk\)"
export def main [
    version: string@"nu-complete version" # the version of the release
    date: datetime@"nu-complete date next" # the date of the upcoming release
] {
    let repo = ($nu.temp-dir | path join (random uuid))
    let branch = $"release-notes-($version)"

    let blog_path = (
        $repo | path join "blog" $"($date | format date "%Y-%m-%d")-nushell_($version | str replace --all '.' '_').md"
    )

    let title = $"Release notes for `($version)`"
    let body = $"Please add your new features and breaking changes to the release notes
by opening PRs against the `release-notes-($version)` branch.
## TODO
- [ ] PRs that need to land before the release, e.g. [deprecations] or [removals]
- [ ] add the full changelog
- [ ] categorize each PR
- [ ] write all the sections and complete all the `TODO`s

[deprecations]: https://github.com/nushell/nushell/labels/deprecation
[removals]: https://github.com/nushell/nushell/pulls?q=is%3Apr+is%3Aopen+label%3Aremoval-after-deprecation"

    log info "generating release notes"
    let release_note = release-notes $version

    log info $"branch: ($branch)"
    log info $"blog: ($blog_path | path relative-to $repo | path basename)"
    log info $"title: ($title)"

    match (["yes" "no"] | input list --fuzzy "Inspect the release note document? ") {
        "yes" => {
            if $env.EDITOR? == null {
                error make --unspanned {
                    msg: $"(ansi red_bold)$env.EDITOR is not defined(ansi reset)"
                }
            }

            let temp_file = $nu.temp-dir | path join $"(random uuid).md"
            [
                "<!-- WARNING: Changes made to this file are NOT included in the PR -->"
                ""
                $release_note
            ] | to text | save --force $temp_file
            ^$env.EDITOR $temp_file
            rm --recursive --force $temp_file
        },
        "no" | "" | _ => { }
    }

    match (["no" "yes"] | input list --fuzzy "Open release note PR? ") {
        "yes" => { },
        "no" | "" | _ => {
            log warning "aborting."
            return
        }
    }

    log info "setting up nushell.github.io repo"
    ^gh repo clone nushell/nushell.github.io $repo -- --origin nushell --branch main --single-branch --depth 1

    log info "creating release branch"
    ^git -C $repo checkout -b $branch

    log info "writing release note"
    $release_note | save --force $blog_path

    log info "committing release note"
    ^git -C $repo add $blog_path
    ^git -C $repo commit -m $"($title)\n\n($body)"

    log info "pushing release note to nushell"
    ^git -C $repo push nushell $branch

    let out = (do -i { ^gh auth status } | complete)
    if $out.exit_code != 0 {
        clean $repo

        let pr_url = $"https://github.com/nushell/nushell.github.io/compare/($branch)?expand=1"
        error make --unspanned {
            msg: (
                [
                    $out.stderr
                    $"please open the PR manually from a browser (ansi blue_underline)($pr_url)(ansi reset)"
                ] | str join "\n"
            )
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
