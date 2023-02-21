cd crates

let subcrates_wave_1 = [
    # components
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
    nu-command,
]

let subcrates_wave_3 = [
    nu-cli,

    # plugins
    nu_plugin_query,
    nu_plugin_inc,
    nu_plugin_gstat,
    nu_plugin_formats,
]

# Recent versions of cargo verify the upload of your crate 
# So no need to `sleep` anymore.

for subcrate in $subcrates_wave_1 {
    cd $subcrate
    cargo publish
    # sleep 1min
    cd ..
}

for subcrate in $subcrates_wave_2 {
    cd $subcrate
    # due to build.rs in `nu-command`
    cargo publish --no-verify
    # sleep 1min
    cd ..
}

for subcrate in $subcrates_wave_3 {
    cd $subcrate
    cargo publish
    # sleep 1min
    cd ..
}

cd ..

cargo publish
