# Written by Genna

# Manage sources of packages
extern "winget source" [
    --help(-?): bool # Display the help for this command
]

# Windows Package Manager
extern winget [
    --version(-v): bool, # Display the version of the tool
    --info: bool, # Display general info of the tool
    --help(-?): bool, # Display the help for this command
]
