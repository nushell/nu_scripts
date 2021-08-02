def venv [name] {
	let venv-path = ($name | path expand)
	let venv-bin-path = ([$venv-path "bin"] | path join)
	let old-path = ($nu.path | str collect (path-sep))
	let new-path = ($nu.path | prepend $venv-bin-path | str collect (path-sep))
	[[name, value];
	 [PATH $new-path]
	 [VENV_OLD_PATH $old-path]
	 [VIRTUAL_ENV $venv-path]]
}

def windows? [] {
    (sys).host.name == "Windows"
}

def path-sep [] {
    if (windows?) { ";" } { ":" }
}

