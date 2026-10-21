# Convert from contents of /proc/cpuinfo to structured data
export def "from cpuinfo" [] {
    lines
    | split list ''
    | each {
        split column ':'
        | str trim
        | str replace -a ' ' '_' column0
        | transpose -r -d
        | update flags { split row ' ' }
        | update bugs { split row ' ' }
    }
}
