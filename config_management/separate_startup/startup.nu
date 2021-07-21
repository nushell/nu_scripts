def "config edit" [
    --editor (-e): string   # Use a different editor (default is `$nu.env.EDITOR`)
] { let editor = (if $editor != "" { $editor } { $nu.env.EDITOR }); ^$editor (config path) }
def "startup" [] { help startup }
def "startup path" [] { config path | path dirname | append startup.nu | path join }
def "startup edit" [
    --editor (-e): string   # Use a different editor (default is `$nu.env.EDITOR`)
] { let editor = (if $editor != "" { $editor } { $nu.env.EDITOR }); ^$editor (startup path) }