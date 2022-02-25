cd crates

let first-wave = [nu-path, nu-ansi-term, nu-pretty-hex, nu-source, nu-errors, nu-protocol, nu-value-ext, nu-test-support, nu-table, nu-data, nu-parser, nu-plugin, nu-stream, nu-engine, nu-json, nu-serde]

echo $first-wave | each { enter $it; cargo publish; exit; sleep 1min }

let second-wave = [nu-command, nu-completion, nu-cli]

echo $second-wave | each { enter $it; cargo publish --no-verify; exit; sleep 1min }

ls nu_plugin_* | each { enter $it.name; cargo publish; exit }

sleep 1min

cd ..

cargo publish
