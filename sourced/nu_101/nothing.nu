# This checks the -f switch to see if it was supplied
# and tests the new $nothing variable
def nada [
    flat?
] {
    if $flat == null {
        true
    } else {
        false
    }
}

# This shows an alternate way to check for nothing
def nada2 [
    flat?
] {
    let flat = ($flat | is-empty)

    if $flat {
        true
    } else {
        false
    }
}
