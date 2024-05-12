# Increment the minor version for any package.json in the current directory with `nu_plugin_inc` (eigenrick — 08/16/2020)
ls -f */package.json | each {|it| open $it.name | inc version --minor | to json --indent 2 | save --raw --force $it.name }
