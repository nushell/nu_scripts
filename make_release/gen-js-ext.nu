def gen_keywords [] {
    let cmds = (scope commands
                | where is_extern == false
                and is_custom == false
                and category !~ deprecated
                and ($it.name | str contains -n ' ')
                | get name
                | str join '|')

    let var_with_dash_or_under_regex = '(([a-zA-Z]+[\\-_]){1,}[a-zA-Z]+\\s)'
    let preamble = '\\b('
    let postamble = ')\\b'
    $'"match": "($var_with_dash_or_under_regex)|($preamble)($cmds)($postamble)",'
}
print $"Generating keywords(char nl)"
print (gen_keywords)
print (char nl)
print (char nl)

def gen_sub_keywords [] {
    let sub_cmds = (scope commands
                    | where is_extern == false
                    and is_custom == false
                    and category !~ deprecated
                    and ($it.name | str contains ' ')
                    | get name)

    let preamble = '\\b('
    let postamble = ')\\b'
    let cmds = ($sub_cmds | each {|x|
        let parts = ($x | split row ' ')
        $'($parts.0)\\s($parts.1)'
    } | str join '|')
    $'"match": "($preamble)($cmds)($postamble)",'
}
print $"Generating sub keywords(char nl)"
print (gen_sub_keywords)
print (char nl)

def gen_keywords_alphabetically [] {
    let alphabet = [a b c d e f g h i j k l m n o p q r s t u v w x y z]
    let cmds = (scope commands
                | where is_extern == false
                and is_custom == false
                and category !~ deprecated
                and ($it.name | str contains -n ' ')
                | get name)

    let preamble = '\\b('
    let postamble = ')\\b'


    $alphabet | each {|alpha|
        let letter_cmds = ($cmds | each {|cmd|
            if ($cmd | str starts-with $alpha) {
                $cmd
            } else {
                null
            }
        } | str join '|')
        if ($letter_cmds | str trim | str length) > 0 {
            $'"match": "($preamble)($letter_cmds)($postamble)",'
        }
    } | str join "\n"
}

print "Generating keywords alphabetically\n"
print (gen_keywords_alphabetically)
print (char nl)

def gen_sub_keywords_alphabetically [] {
    let alphabet = [a b c d e f g h i j k l m n o p q r s t u v w x y z]
    let sub_cmds = (scope commands |
                    | where is_extern == false
                    and is_custom == false
                    and category !~ deprecated
                    and ($it.name | str contains ' ')
                    | get name)

    let preamble = '\\b('
    let postamble = ')\\b'


    $alphabet | each {|alpha|
        let letter_cmds = ($sub_cmds | each {|cmd|
            if ($cmd | str starts-with $alpha) {
                let parts = ($cmd | split row ' ')
                $'($parts.0)\\s($parts.1)'
            } else {
                null
            }
        } | str join '|')
        if ($letter_cmds | str trim | str length) > 0 {
            $'"match": "($preamble)($letter_cmds)($postamble)",'
        }
    } | str join "\n"
}

print "Generating sub keywords alphabetically\n"
print (gen_sub_keywords_alphabetically)
print (char nl)
