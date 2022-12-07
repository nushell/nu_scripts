cd crates

let subcrates_wave_1 = [
    # components
    nu-utils,
    nu-glob,
    nu-term-grid,
    nu-pretty-hex,
    nu-system,
    nu-path,
    nu-json,
    nu-protocol,
    nu-engine,
    nu-table,
    nu-color-config,
    nu-test-support,
    nu-plugin,
    nu-parser,
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
