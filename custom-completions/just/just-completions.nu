
# official completion from `just --completion nushell`
def get-recipes [] {
    let just_json = (^just --unstable --dump --dump-format json | from json)
    [
        ...(
            $just_json.recipes
            | transpose recipe data
            | flatten
        )
        ...(
            $just_json.modules
            | transpose "module" data
            | flatten
            | select "module" recipes
            | each {|row|
                $row.recipes | items {|k, v|
                    {
                        recipe: ($"($row.module)::($k)" | str replace --regex '::default$' '')
                        ...$v
                    }
            }}
            | flatten
        )
    ]
    | where {|recipe| not $recipe.private }
}

def "nu-complete just" [] {
    get-recipes
        | select recipe doc parameters
        | each {|recipe|
            let name = $recipe.recipe
            mut desc = $recipe.doc | default " "
            for $p in $recipe.parameters {
              if ($p.default | is-empty) {
                  $desc += $" [(ansi blue)($p.name)(ansi reset)]"
              } else {
                  $desc += $" [(ansi blue)($p.name)='($p.default)'(ansi reset)]"
              }
            }
            { value: $name description: ($desc | str trim) }
        }
}

def "nu-complete args" [context:string,offset:int] {
    let r = ($context | split row ' ')
    let name = $r.1
    # First two are 'just' and name, minus one because `get-just-args` is zero-indexed
    let position = ($r | length) - 3

    get-just-arg $name $position
}

# Provides argument of recipe $name at position $positions.
def get-just-arg [name:string,position:int] {
    let recipes = (
        get-recipes
            | where {|r| $r.name == $name }
            | get parameters
            | flatten)
    let len = $recipes | length
    if $position > ($recipes | length) {
        [[value description]; ["" "No more args"]]
    } else {
        $recipes
            | get $position
            | each {|recipe|
                let name = $recipe.name
                if not ($recipe.default | is-empty) {
                    [[value description];
                        [$recipe.default $"'($name)' (ansi green)\(default\)(ansi reset)"]
                        ["" $name]]
                } else {
                    # Need two empty different values
                    # Otherwise they get filtered and empty value gets inserted automatically
                    [[value description];
                        [null $"'($name)'"]
                        [' '  $"'($name)'"]]
                }
          }
    }
}

# Variables and Assignments are apparently the same thing...
def "nu-complete just assignments" [] {
    ^just --dump --dump-format json
        | from json
        | get assignments
        | transpose name value
        | each {|x| {
            value: $x.name,
            description: $"Current value: '($x.value.value)'"
        }}
}

# Just: A Command Runner. A handy way to save and run project-specific commands.
export extern "just" [
    recipe?:string@"nu-complete just"               # Recipe to execute
    --changelog                                     # Print changelog
    --check                                         # Run `--fmt` in 'check' mode. Exits with 0 if justfile is formatted correctly. Exits with 1 and prints a diff if formatting is required.
    --choose                                        # Select one or more recipes to run using a binary chooser. If `--chooser` is not passed the chooser defaults to the value of $JUST_CHOOSER, falling back to `fzf`
    --clear-shell-args                              # Clear shell arguments
    --dry-run(-n)                                   # Print what just would do without doing it
    --dump                                          # Print justfile
    --edit(-e)                                      # Edit justfile with editor given by $VISUAL or $EDITOR, falling back to `vim`
    --evaluate                                      # Evaluate and print all variables. If a variable name is given as an argument, only print that variable's value.
    --explain                                       # Print recipe doc comment before running it
    --fmt                                           # Format and overwrite justfile
    --global-justfile(-g)                           # Use global justfile
    --groups                                        # List recipe groups
    --highlight                                     # Highlight echoed recipe lines in bold
    --init                                          # Initialize new justfile in project root
    --list(-l)                                      # List available recipes and their arguments
    --man                                           # Print man page
    --no-aliases                                    # Don't show aliases in list
    --no-deps                                       # Don't run recipe dependencies
    --no-dotenv                                     # Don't load `.env` file
    --no-highlight                                  # Don't highlight echoed recipe lines in bold
    --one                                           # Forbid multiple recipes from being invoked on the command line
    --quiet(-q)                                     # Suppress all output
    --shell-command                                 # Invoke <COMMAND> with the shell used to run recipe lines and backticks
    --summary                                       # List names of available recipes
    --tempdir:glob                                  # Save temporary files to <TEMPDIR>.
    --timestamp                                     # Print recipe command timestamps
    --timestamp-format:string                       # Timestamp format string
    --unsorted(-u)                                  # Return list and summary entries in source order
    --unstable                                      # Enable unstable features
    --variables                                     # List names of variables
    --verbose(-v)                                   # Use verbose output
    --yes                                           # Automatically confirm all recipes.
    --help(-h)                                      # Print help information
    --version(-V)                                   # Print version information

    --alias-style:string@"nu-complete just al-st"   # Set list command alias display style
    --chooser:string                                # Override binary invoked by `--choose`
    --color:string@"nu-complete just color-when"    # Print colorful output [default: auto]  [possible values: auto, always, never]
    --command(-c):string                            # Run an arbitrary command with the working directory, `.env`, overrides, and exports set
    --command-color:string@"nu-complete just color" # Echo recipe lines in <COMMAND-COLOR> [possible values: black, blue, cyan, green, purple, red, yellow]
    --completions:string@"nu-complete just shells"  # Print shell completion script for <SHELL> [possible values: zsh, bash, fish, powershell, elvish, nushell]
    --dotenv-filename:glob                          # Search for environment file named <DOTENV-FILENAME> instead of `.env`
    --dotenv-path(-E):glob                          # Load <DOTENV-PATH> as environment file instead of searching for one
    --dump-format:string@"nu-complete just format"  # Dump justfile as <FORMAT> [default: just]  [possible values: just, json]
    --justfile(-f):glob                             # Use <JUSTFILE> as justfile
    --list-heading:string                           # Print <TEXT> before list
    --list-prefix:string                            # Print <TEXT> before each list item
    --list-submodules                               # List recipes in submodules
    --set:string@"nu-complete just assignments"     # Override <VARIABLE> with <VALUE>
    --shell:string@"nu-complete just shells"        # Invoke <SHELL> to run recipes
    --shell-arg:string                              # Invoke shell with <SHELL-ARG> as an argument
    --show(-s):string@"nu-complete just"            # Show information about <RECIPE>
    --working-directory(-d):glob                    # Use <WORKING-DIRECTORY> as working directory. --justfile must also be set
]

def "nu-complete just al-st" [] {
    [ "left", "right", "separate" ]
}

def "nu-complete just format" [] {
    [ "just", "json" ]
}

# Shells as listed in `--completions`
def "nu-complete just shells" [] {
    [ "zsh", "bash", "fish", "powershell", "elvish", "nushell" ]
}

# Color outputs as listed in `--color`
def "nu-complete just color-when" [] {
    [ "auto", "always", "never" ]
}

# Colors as listed in `--command-color`
def "nu-complete just color" [] {
    [ "black", "blue", "cyan", "green", "purple", "red", "yellow" ]
}
