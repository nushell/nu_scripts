def "nu-complete dotnet" [prefix: string] {
    ^dotnet complete $"($prefix)" | lines 
}

export extern "dotnet" [
    ...command: string@"nu-complete dotnet"
]
