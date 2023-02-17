let dictionary = [
  'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S',
  'T', 'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l',
  'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', '0', '1', '2', '3', '4',
  '5', '6', '7', '8', '9', '+', '/'
]

let padding_char = '='

def base64_encode [input: string] {
  mut result = ""
  mut counter = 0
  mut left_carry = 0

  if ($input | is-empty) {
    error make {msg: "input is empty"}
  }

  for char in ($input | split chars) {
    let char_bin = ($char | into binary)
    let char_int = ($char_bin | into int)

    if $counter mod 3 == 0 {
      let index = ($char_int bit-shr 2)
      $result += ($dictionary | get $index)
      $left_carry = ($char_int bit-and 0x3)
    } else if $counter mod 3 == 1 {
      let index = (($left_carry bit-shl 4) bit-or ($char_int bit-shr 4))
      $result += ($dictionary | get $index)
      $left_carry = ($char_int bit-and 0xF)
    } else if $counter mod 3 == 2 {
      mut index = (($left_carry bit-shl 2) bit-or ($char_int bit-shr 6))
      $result += ($dictionary | get $index)
      $index = ($char_int bit-and 0x3F)
      $result += ($dictionary | get $index)
    }

    $counter += 1
  }

  if $counter != 0 {
    if $counter mod 3 == 1 {
      $result += ($dictionary | get ($left_carry bit-shl 4))
      $result += $padding_char
      $result += $padding_char
    } else if $counter mod 3 == 2 {
      $result += ($dictionary | get ($left_carry bit-shl 2))
      $result += $padding_char
    }
  }

  $result
}

# Test Cases
# base64_encode "nushell", "bnVzaGVsbA=="
# base64_encode "hello", "aGVsbG8="
# base64_encode "world", "d29ybGQ="
# base64_encode "now is the time for all good mean to come to the aid of their country", "bm93IGlzIHRoZSB0aW1lIGZvciBhbGwgZ29vZCBtZWFuIHRvIGNvbWUgdG8gdGhlIGFpZCBvZiB0aGVpciBjb3VudHJ5
# base64_encode "crab", "Y3JhYg=="
# base64_encode "the brown fox jump over the lazy dog!"), "dGhlIGJyb3duIGZveCBqdW1wIG92ZXIgdGhlIGxhenkgZG9nIQ=="
# base64_encode "", error
# base64_encode "a", "YQ=="