# Provides "fuck" interface for thefuck
def fuck [] = {
    thefuck (history | last 1 | get command.0)
}

export-env {
    $env.TF_ALIAS = fuck
    $env.PYTHONIOENCODING = utf-8
}

export def main [] = {
    fuck
}
