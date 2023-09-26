# This file contains an example nushell prompt, making use of the async-git-prompt module.
use async-git-prompt.nu *

def prompt-concat [parts: table] {
    $parts
    | where (not ($it.text | is-empty))
    | each { |it| $"($it.color)($it.text)" }
    | str join ' '
}

def prompt-git-branch [] {
    do -i { git rev-parse --abbrev-ref HEAD | str trim -r}
}

def prompt-create-left-prompt [] {
    let pwd = ($env.PWD | str replace $env.HOME '~')
    prompt-concat [
        [text color];
        [pwd (ansi green_bold)]
        [(prompt-git-branch)  (ansi blue_bold)]
        [(async-git-prompt-string) (ansi green_bold)]
    ]
}

def prompt-create-right-prompt [] {
    null
}

$env.PROMPT_COMMAND = { prompt-create-left-prompt }
$env.PROMPT_COMMAND_RIGHT = { prompt-create-right-prompt }
$env.PROMPT_INDICATOR = { $" (ansi green_bold)〉" }
