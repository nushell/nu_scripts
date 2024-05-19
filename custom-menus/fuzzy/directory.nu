{
    name: fuzzy_dir
    modifier: control
    keycode: char_s
    mode: [emacs, vi_normal, vi_insert]
    event: {
        send: executehostcommand
        cmd: "commandline edit --append (
            ls **/*
            | where type == dir
            | get name
            | input list --fuzzy
                $'Please choose a (ansi magenta)directory(ansi reset) to (ansi cyan_underline)insert(ansi reset):'
        )"
    }
}
