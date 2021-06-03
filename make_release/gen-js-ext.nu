def gen_keywords [] {
    let cmds = (help commands | where description != '' | get name | str collect '|')
    let var_with_dash_or_under_regex = "(([a-zA-Z]+[\\-_]){1,}[a-zA-Z]+\\s)"
    let preamble = "\\b("
    let postamble = ")\\b"
    $'"match": "($var_with_dash_or_under_regex)|($preamble)($cmds)($postamble)",'
}
$"Generating keywords(char nl)"
gen_keywords
char nl
char nl

def gen_sub_keywords [] {
    let sub_cmds = (help commands | get subcommands | insert base { get name | split column ' ' base sub} | flatten | reject name description)
    let preamble = "\\b("
    let postamble = ")\\b"
    let cmds = (for x in $sub_cmds {
        $"($x.base)\\s($x.sub)"
    } | str collect '|')
    $'"match": "($preamble)($cmds)($postamble)",'
}
$"Generating sub keywords(char nl)"
gen_sub_keywords
char nl