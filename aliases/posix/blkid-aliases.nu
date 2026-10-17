export def --wrapped blkid [...rest] {
    ^blkid ...$rest|lines|each {split column ':'|update column2 {str replace -a '" ' "\"\n"|from toml}|flatten }|flatten|rename DEVICE|update BLOCK_SIZE {into int}
}
