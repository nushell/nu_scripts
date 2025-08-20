# Clean up a PR title
export def clean-title []: string -> string {
    # remove any prefixes and capitalize
    str replace -r '^[^\s]+: ' ""
    | str trim
    | str capitalize
}

# Check if the release notes section was left empty
export def is-empty-keyword []: string -> bool {
    str downcase | $in in ["", "n/a", "nothing", "none", "nan"]
}

# Format a PR nicely, including a link
export def format-pr []: record -> string {
    let pr = $in
    let text = $"#($pr.number): ($pr.title)"
    $pr.url | ansi link -t $text
}

# Escape > and <
export def escape-tag [] {
    str replace -a ">" "&gt;"
    | str replace -a "<" "&lt;"
}

# Create a markdown link
export def md-link [text: string, link: string] {
    $"[($text)]\(($link)\)"
}

# Get a link to a PR
export def pr-link []: record -> string {
    md-link $"#($in.number)" $in.url
}
