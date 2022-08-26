#diacritics map for Polish but the function is universal provided diacritics_map contains mappings for specific language

# Usage: (remove-diacritics 'Zażółć gęślą jaźń') == Zazolc gesla jazn

def remove-diacritics [
    arg: string
] {
    let diacritics_map = {
    "Ą": "A",
    "ą": "a",
    "Ć": "C",
    "ć": "c",
    "Ę": "E",
    "ę": "e",
    "Ł": "L",
    "ł": "l",
    "Ń": "N",
    "ń": "n",
    "Ó": "O",
    "ó": "o",
    "Ś": "S",
    "ś": "s",
    "Ż": "Z",
    "ż": "z",
    "Ź": "Z",
    "ź": "z"
}
    $arg
    |split chars
    |each {|char|
        $diacritics_map
        |get -i -s $char
        |default $char
    }
    |str collect ''
}
