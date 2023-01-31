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
    nu_plugin_gstat
]

for subcrate in $subcrates_wave_1 {
    cd $subcrate
    cargo publish
    sleep 1min
    cd ..
}

for subcrate in $subcrates_wave_2 {
    cd $subcrate
    cargo publish --no-verify
    sleep 1min
    cd ..
}

for subcrate in $subcrates_wave_3 {
    cd $subcrate
    cargo publish
    sleep 1min
    cd ..
}

cd ..

cargo publish
