# Clone all

Do you want to automate cloning a list repos into a folder? This script is for you!

## Requirements:
- [`gh` cli](https://github.com/cli/cli)

## How to use it

Load the script:

- if you have cloned the repo before:

```nushell env.nu
source ~/your/directory/to/nu_scripts/modules/clone-all/clone-all.nu
```

or if you have the file, and you want it to use in a nushell session:

```nushell
use clone-all.nu *
# and it's ready to use in the current prompt!
```

Then, create a list of github routes to repositories `ORGANIZATION_NAME/REPO`
like this:

```nu
let list_of_repos = [
    "nushell/nushell"
    "nushell/nu_scripts"
    "nushell/vscode-nushell-lang"
]
```

And then you need to pass that variable and a destination folder

```nu
clone all $list_of_repos $"($env.home)/other-repos/nu_repos"
```

## Tips

I (@AucaCoyan) use it for cloning both org repos and my forks

```nushell
let nushell_repos = [
    "nushell/nushell"
    "nushell/nu_scripts"
    "nushell/vscode-nushell-lang"
]

clone all $nushell_repos $"($env.home)/other-repos/nu"

let nushell_forks = [
    "AucaCoyan/nushell"
    "AucaCoyan/nu_scripts"
    "AucaCoyan/vscode-nushell-lang"
]

clone all $nushell_forks $"($env.home)/repos"
```

and do that with every gh org (work or open source!)
