# From @eggcaker .. over on Discord

# Returns the type of its input. Use -f for full description.
def typeof [ --full(-f) ] {
    describe | if not $full { split row '<' | get 0 } else { $in }
}