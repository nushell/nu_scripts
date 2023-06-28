cd crates

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

for subcrate in $subcrates_wave_1 {
    cd $subcrate
    cargo publish
    cd ..
}

for subcrate in $subcrates_wave_2 {
    cd $subcrate
    # due to build.rs in `nu-command`
    cargo publish --no-verify
    cd ..
}

for subcrate in $subcrates_wave_3 {
    cd $subcrate
    cargo publish
    cd ..
}

cd ..

cargo publish
