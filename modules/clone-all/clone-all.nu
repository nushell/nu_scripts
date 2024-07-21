# grabs the repo name of a github (ORG/repo) string
# 
# for example 
# grab repo name "organization/my_special_repo" 
# returns "myspecial_repo" 

# Grabs the repo name of a github (ORG/repo) string
def "grab repo name" [ghrepo: string]: [string -> string] {
    $ghrepo | split column "/" | get column2 | last
}

# Generic fn to clone all repos of one organization into a specific folder
# 
# # Parameters
# `list_of_repos` is a list of <ORG/REPO> from github
#   for example:
# ```nu
# let list_of_repos = [
#     "nushell/nushell"
#     "nushell/nu_scripts"
#     "nushell/vscode-nushell-lang"
# ]
#
# and destination is the location where those repos are cloned
# $ use clone-all.nu *
# $ clone all ['nushell/nu_scripts'] /home/my-dir/
# equals
# gh repo clone nushell/nu_scripts /home/my-dir/nu_scripts
# (note that it doesn't create the organization folder)

# Clones all the `list_of_repos` into `destination` folder
export def "clone all" [list_of_repos: list<string>, destination: path] {
        print $" creating ($destination) folder"
        mkdir $destination
        
        for $repo in $list_of_repos {
            let repo_name = grab repo name $repo
            let single_repo_dir = $"($destination)/($repo_name)"
            if ($single_repo_dir | path exists) {
                print $"\n repo ($single_repo_dir) exists, skipping"
                continue
            } else {
                print $"\n cloning ($repo)"
                gh repo clone $repo $single_repo_dir
            }
        }
}
