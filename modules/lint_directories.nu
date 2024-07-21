# List any directory that does not follow a SemVer naming pattern
# For example
# - 1.0.1 is a valid directory name.
# - yeah_whatever_linter is not a valid directory name.
def ls-incorrect-dirs [] {
    ls | where type == dir and name != 'scripts' | find --invert --regex '(\d+\.){2,}\d$' --columns [name]
}
let incorrect_count = (ls-incorrect-dirs | length);
if $incorrect_count > 0 {
    print $"The following directories are named incorrectly: (char newline)"
    print (ls-incorrect-dirs)
    exit 1

} else {
    exit 0
}
