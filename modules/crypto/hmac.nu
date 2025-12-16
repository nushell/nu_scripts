
# HMAC-SHA256 implementation
#
# This is a message authentication algorithm,
# using a shared secret key this allows two peers to validate that the message wasn't tampered with.
# Used for example for issuing JWT tokens.
@example "generate a message authentication code" {
    "The quick brown fox jumps over the lazy dog" 
    | hmac sha256 --key "key" 
    | encode hex
} --result "F7BC83F430538424B13298E6AA6FB143EF4D59A14946175997479DBC2D1A3CD8"
export def "sha256" [--key: oneof<binary, string>]: oneof<string, binary> -> binary {
    let message = $in | into binary
    let key = $key | into binary

    const block_size = 64

    let key_len = ($key | length)
    let key = match $key_len {
        64 => $key,
        65.. => ($key | hash sha256 --binary),
        _ => {bytes build $key (1..($block_size - $key_len) | each {0x[00]} | bytes collect)} 
    }

    let i_key = $key | bits xor ((1..$block_size) | each {0x[36]} | bytes collect)
    let o_key = $key | bits xor ((1..$block_size) | each {0x[5c]} | bytes collect)
    
    bytes build $i_key $message 
    | hash sha256 --binary
    | bytes build $o_key $in
    | hash sha256 --binary
}
