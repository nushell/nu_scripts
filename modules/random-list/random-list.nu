def throw-error [
    error: string
    msg: string
    span: record
] {
    error make {
        msg: $"(ansi red_bold)($error)(ansi reset)"
        label: {
            text: $msg
            start: $span.start
            end: $span.end
        }
    }
}

# Generate a random boolean list.
export def "random-list bool" [
    list_length: int, # A length of the list
    --bias (-b): float = 0.5 # A probability of "true"
] {
    if $bias < 0 or $bias > 1 {
        throw-error "value_error" "must be between 0 and 1" (metadata $bias | get span)
    }
    if $list_length < 0  {
        throw-error "value_error" "must be greater than 0" (metadata $list_length | get span)
    }

    1..$list_length | each {|it|
        random bool --bias $bias
    }
}

# Generate a random char list.
export def "random-list chars" [
    list_length: int, # A length of the list
    --length (-l): int = 5 # A length of the string
] {
    if $list_length < 0  {
        throw-error "value_error" "must be greater than 0" (metadata $list_length | get span)
    }
    if $length < 0  {
        throw-error "value_error" "must be greater than 0" (metadata $length | get span)
    }

    1..$list_length | each {|it|
        random chars --length $length
    }
}

# Generate a random float list.
export def "random-list float" [
    list_length: int, # A length of the list
    --range (-r): range # A range of the value
] {
    if $list_length < 0  {
        throw-error "value_error" "must be greater than 0" (metadata $list_length | get span)
    }

    1..$list_length | each {|it|
        random float $range
    }
}

# Generate a random dice list.
export def "random-list dice" [
    list_length: int, # A length of the list
    --roll-count (-r): int = 6, # A roll count
    --side-count (-s): int = 6 # A side count
] {
    if $list_length < 0  {
        throw-error "value_error" "must be greater than 0" (metadata $list_length | get span)
    }
    if $roll_count < 0  {
        throw-error "value_error" "must be greater than 0" (metadata $roll_count | get span)
    }
    if $side_count < 0  {
        throw-error "value_error" "must be greater than 0" (metadata $side_count | get span)
    }

    1..$list_length | each {|it|
        random dice --dice $roll_count --sides $side_count
    }
}

# Generate a random integer list.
export def "random-list int" [
    list_length: int # A length of the list
    --range (-r): range # A range of the value
] {
    if $list_length < 0  {
        throw-error "value_error" "must be greater than 0" (metadata $list_length | get span)
    }

    1..$list_length | each {|it|
        random int $range
    }
}

# Generate a random uuid list.
export def "random-list uuid" [
    list_length: int # A length of the list
] {
    if $list_length < 0  {
        throw-error "value_error" "must be greater than 0" (metadata $list_length | get span)
    }

    1..$list_length | each {|it|
        random uuid
    }
}
