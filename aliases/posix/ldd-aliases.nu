export def ldd [...rest] {
    ^ldd ...$rest|parse --regex "\\s*(?P<lib>\\S+?) => (?P<path>\\S+?) \\((?P<addr>\\S+?)\\)"|update addr {|| into int }
}
