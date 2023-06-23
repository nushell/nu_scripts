def "manpages" [] {

    ^man -w
	| str trim
    | split row (char esep)
	| par-each { glob $'($in)/man?' }
	| flatten
	| par-each { ls $in | get name }
    | flatten
	| path basename
	| str replace -s ".gz" ""
}

export extern "man" [
    ...targets: string@"manpages"
]
