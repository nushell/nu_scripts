# This script requires that `tokei` be installed and available!

# Count lines of code in a project.
def "loc" [
    ...rest # args to pass to tokei
] {
    tokei -o json $rest |
    from json |
    pivot |
    rename lang lines |
    insert files { get lines.reports | length } |
    select lang files lines.code lines.comments lines.blanks
}
