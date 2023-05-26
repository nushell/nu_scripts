{
    name: fuzzy_history
    modifier: control
    keycode: char_h
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: "commandline (
            history
            | each { |it| $it.command }
            | uniq
            | reverse
            | input list --fuzzy
                $'Please choose a (ansi magenta)command from history(ansi reset):'
        )"
    }
}
