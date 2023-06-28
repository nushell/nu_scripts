use std log

let subcrates_wave_1 = [
    nu-glob,
    nu-json,
    nu-path,
    nu-pretty-hex,
    nu-system,
    nu-utils,
    nu-term-grid,
    nu-test-support,
    nu-protocol,
    nu-engine,
    nu-plugin,
    nu-color-config,
    nu-parser,
    nu-table,
    nu-explore,
]

let subcrates_wave_2 = [
    nu-cmd-base,
    nu-cmd-lang,
    nu-cmd-dataframe,
    nu-cmd-extra,
    nu-command,
]

let subcrates_wave_3 = [
    nu-cli,
    nu-std,

    nu_plugin_query,
    nu_plugin_inc,
    nu_plugin_gstat,
    nu_plugin_formats,
]

log warning "publishing the first wave of crates"
for subcrate in $subcrates_wave_1 {
    cargo publish --manifest-path ("crates" | path join $subcrate "Cargo.toml")
}

log warning "publishing the second wave of crates"
for subcrate in $subcrates_wave_2 {
    # due to build.rs in `nu-command`
    cargo publish --manifest-path ("crates" | path join $subcrate "Cargo.toml") --no-verify
}

log warning "publishing the third wave of crates"
for subcrate in $subcrates_wave_3 {
    cargo publish --manifest-path ("crates" | path join $subcrate "Cargo.toml")
}

cargo publish
