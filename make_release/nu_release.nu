use std log

export def main [] {
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
        nu-plugin-test-support
        nu-std,
        nu-table,
        nu-cmd-base,
    ]

    # This crate has a `build.rs` file and thus needs `--no-verify`
    let subcrates_wave_2 = [
        nu-cmd-lang,
    ]

    let subcrates_wave_3 = [
        nu-command,
        nu-explore,
        nu-cli,
        nu-cmd-dataframe,
        nu-cmd-extra,
        nu-lsp,

        nu_plugin_query,
        nu_plugin_inc,
        nu_plugin_gstat,
        nu_plugin_formats,
    ]

    log warning "starting publish"

    log warning "publishing the first wave of crates"
    for crate in $subcrates_wave_1 {
        cargo publish -p $crate
    }

    log warning "publishing the second wave of crates"
    for crate in $subcrates_wave_2 {
        cargo publish -p $crate --no-verify
    }

    log warning "publishing the third wave of crates"
    for crate in $subcrates_wave_3 {
        cargo publish -p $crate
    }

    cargo publish
}
