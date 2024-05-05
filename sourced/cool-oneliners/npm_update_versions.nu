# Increment the minor version for any package.json in the current directory (eigenrick — 08/16/2020)
ls */package.json | each { open $it.name | inc version --minor | to json --pretty 2 | save --raw }
