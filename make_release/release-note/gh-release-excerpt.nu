#!/usr/bin/env nu


# Prepare the GitHub release text
def main [
    versionname: string # The version we release now
    bloglink: string # The link to the blogpost
    date?: datetime  # the date of the last release (default to 6 weeks ago, excluded)
] {
    let date = (
        if $date == null { (date now) - 6wk + 1day } else { $date }
        | format date "%Y-%m-%d"
    )

    let repo = "nushell/nushell"
    let query = $"merged:>($date)"

    let prs = (
        gh --repo $repo pr list
            --state merged
            --limit (inf | into int)
            --json author
            --search $query
        | from json
        | update author { get login }
    )

    let authors = $prs.author | uniq | sort -i

    let author_string = ($authors | each {|name| $"@($name)"} | str join ", " )

    let release_text = [
        $"This is the ($versionname) release of Nushell. You can learn more about this release here: ($bloglink)",
        "",
        "For convenience, we are providing full builds for Windows, Linux, and macOS. Be sure you have the requirements to enable all capabilities: https://www.nushell.sh/book/installation.html#dependencies", 
        "",
        $"This release was made possible by PR contributions from ($author_string)"
    ]

    $release_text | str join "\n"
}
