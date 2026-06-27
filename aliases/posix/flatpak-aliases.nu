extern def --wrapped "flatpak list" [...rest] {
    ^flatpak list ...$rest|from tsv -n --no-infer|rename name package version branch origin installation
}
