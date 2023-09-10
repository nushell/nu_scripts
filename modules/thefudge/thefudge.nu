# Provides "fuck" interface for thefuck
def fudge [] = {
    thefuck (history | last 1 | get command.0)
}

export-env {
    $env.TF_ALIAS = fudge
    $env.PYTHONIOENCODING = utf-8
}

export def main [] = {
    fudge
}
