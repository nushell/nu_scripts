
### So in this case you have to pass in a parameter
### Any parameter you type will work
### If you don't type a parameter you get an error
###
### The syntax for this is
### noflag hola
###

def noflag [x] {
  echo $x
}

### The syntax for this is
### flag -f
### flag --flag

### If you type anything else it does not work
### For example
### flag -flag
### flag -f=hola
### flag -f hola
### flag -f = hola

def flag [
  --flag(-f)
] {
  echo $flag
}
