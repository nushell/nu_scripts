#!/usr/bin/env -S nu --stdin

export def "parse zellij-sessions" [] {
    $in | parse -r '(?P<name>.*?) \[Created (?P<created>.+) ago](?: \()?(?P<state>.+?(?= |\))?'
}

export def "filter active-sessions" [] {
    $in 
    | where { |session|
            $session.state =~ "EXITED"
        }
}   

export def "zellij-delete" [] {
    $in | each { |session|
            $session.name | ansi strip | ^zellij delete-session $in
    }
}

export def "zellij-cleanup" [] {
    ^zellij list-sessions | parse zellij-sessions | filter active-sessions | zellij-delete
}