def complete-commands [
    context: string
] {
    with-env {COMP_LINE: $context} {
        aws_completer
        | lines
        | each {|x| $"($x) "}
    }
}

export extern "aws" [
    ...command: string@complete-commands
]
