let dir = (pwd)
let file = [ $dir, "git-aliases.nu"] | path join
print $file

# we download the file from github
http get https://raw.githubusercontent.com/nushell/nu_scripts/25514da84d4249ecebdb74c3a23c7184fcc76f50/aliases/git/git-aliases.nu
| save "git-aliases.nu" --force

let result_nu_check = http get https://raw.githubusercontent.com/nushell/nu_scripts/25514da84d4249ecebdb74c3a23c7184fcc76f50/aliases/git/git-aliases.nu
| nu-check
print $"nu-check says `git-aliases.nu` is: ($result_nu_check)\n"

print "... but nu --ide-check says it has no errors, only hints"
nu --ide-check 10 $"($file)" | to text  | ['[', $in, ']'] | str join | from json