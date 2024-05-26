
export def ls-hidden [
    --dir(-d):any # The directory you want to list
] {
    let dir = if ($dir | is-empty) { "." } else { $dir }
	ls -a $dir | filter { ($in.name | into string | str starts-with '.') }
}
