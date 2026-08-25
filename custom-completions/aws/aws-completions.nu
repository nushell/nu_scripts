def complete-commands [
    context: string
] {
    with-env {COMP_LINE: $context} {
        let completer = if ((which aws_completer | is-empty) and ("/usr/libexec/aws_completer" | path exists)) {
            "/usr/libexec/aws_completer"
        } else {
            "aws_completer"
        }
        ^$completer
        | lines
        | each {|x| $"($x) "}
    }
}

export extern "aws" [
    ...command: string@complete-commands
]
