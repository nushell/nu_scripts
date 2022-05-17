# something like this in $nu.env-path

rm completions.nu

source parse-help.nu

cargo --help | parse-help | build-string ($in | make-completion cargo) "\n\n" | save --append $"completions.nu"
nu --help | parse-help | build-string ($in | make-completion nu) "\n\n" | save --append $"completions.nu"
bat --help | parse-help | build-string ($in | make-completion bat) "\n\n" | save --append $"completions.nu"

# source this file in $nu.config-path

source completions.nu
