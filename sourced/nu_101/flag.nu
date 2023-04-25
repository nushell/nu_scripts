
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

# Write out the flags you entered
def flag_details [myint: int, mystring: string] {
  echo "myint is " $myint | str join
  echo "mystring is " $mystring | str join
}

# Get the data passed into the flags
def get_flag [
    --test_int(-i): int # The test intlocation
    --test_string(-s): string # The test string
    ] {
    let is_int_empty = ($test_int == $nothing)
    let is_string_empty = ($test_string == $nothing)

    let no_int_no_string = ($is_int_empty == true and $is_string_empty == true)
    let no_int_with_string = ($is_int_empty == true and $is_string_empty == false)
    let with_int_no_string = ($is_int_empty == false and $is_string_empty == true)
    let with_int_with_string = ($is_int_empty == false and $is_string_empty == false)

    echo 'no int and no string ' $no_int_no_string | str join
    echo 'no int with string ' $no_int_with_string | str join
    echo 'with int and no string ' $with_int_no_string | str join
    echo 'with int and with string ' $with_int_with_string | str join

    if $no_int_no_string {
        (flag_details 1 "blue")
    } else if $no_int_with_string {
        (flag_details 1 $test_string)
    } else if $with_int_no_string {
        (flag_details $test_int "blue")
    } else if $with_int_with_string {
        (flag_details $test_int $test_string)
    }


}

# To run this call
# > get_flag
# it will default to int 1 and string blue
# > get_flag -i 2
# This changes to int 2 and string blue
# > get_flag -i 3 -s green
# This changes to int 3 and string green
