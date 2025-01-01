use path
use std/assert

#[test]
def path_replace_extension [] {
    let new_path = "ab.txt" | path replace-extension "rs"
    assert equal $new_path "ab.rs"

    let new_path = "ab.txt" | path replace-extension ".rs"
    assert equal $new_path "ab.rs"
}

#[test]
def path_replace_extension_for_list [] {
    let new_path = ["ab.txt", "cd.exe"] | path replace-extension "rs"
    assert equal $new_path ["ab.rs", "cd.rs"]


    let new_path = ["ab.txt", "cd.exe"] | path replace-extension ".rs"
    assert equal $new_path ["ab.rs", "cd.rs"]
}
