cd crates

let first-wave = [nu-system, nu-term-grid, nu-path, nu-ansi-term, nu-pretty-hex, nu-json, nu-protocol, nu-engine, nu-plugin, nu-table, nu-color-config, 
nu-parser, nu-test-support, nu-cli]

echo $first-wave | each { |cratedir| enter $cratedir; cargo publish; exit; sleep 1min }

let second-wave = [nu-command]

echo $second-wave | each { |cratedir| enter $cratedir; cargo publish --no-verify; exit; sleep 1min }

ls nu_plugin_* | each { |plugin| enter $plugin.name; cargo publish; exit }

sleep 1min

cd ..

cargo publish
