# List any directory that does not follow a SemVer naming pattern
# For example
# - 1.0.1 is a valid directory name.
# - yeah_whatever_linter is not a valid directory name.
def ls-incorrect-dirs [] {
    ls | where type == 'Dir' and name != 'scripts'| match -v name '(\d+\.){2,}\d$'
}
let incorrect_count = (ls-incorrect-dirs | length);
if $incorrect_count > 0 {
#   echo `The following directories are named incorrectly: {{(char newline)}}`
  $"The following directories are named incorrectly: (char newline)"
	ls-incorrect-dirs
	exit 1
} {
	exit 0
}
