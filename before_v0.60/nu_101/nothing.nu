# This checks the -f switch to see if it was supplied
# and tests the new $nothing variable
def nada [
    --flat(-f)
] {
    if $flat == $nothing {
        echo $true
    } {
        echo $false
    }
}

# This shows an alternate way to check for nothing
def nada2 [
    --flat(-f)
] {
    let flat = ($flat | empty?)

    if $flat {
        echo $true
    } {
        echo $false
    }
}