def "nu-complete gradlew" [] {
    ./gradlew tasks
    | lines 
    | parse --regex '(?P<value>[a-zA-Z]+) - (?P<description>.+)'
}


export extern "./gradlew" [
    task?: string@"nu-complete gradlew"
    --help(-h)                      # Shows this help message.
]