
def ls-hidden [
    --dir(-d):any # The directory you want to list
] {
	ls -a $dir | where { ($it.name | into string | str starts-with '.') }
}
