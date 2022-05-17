

def parse-help [] {
    $in | lines | parse -r '^\s+(?:-(?P<short>\w)[,\s]+)?(?:--(?P<long>[^\s]+))\s*(?:<(?P<format>.*)>)?\s*(?P<description>.*)?$'
}

def test-cargo [] {
    let expect = [
        [short long format description];
        [V version '' 'Print version info and exit']
        ['' list '' 'List installed commands']
        ['' explain 'CODE' 'Run `rustc --explain CODE`']
        [v verbose '' 'Use verbose output (-vv very verbose/build.rs output)']
        [q quiet '' 'Do not print cargo log messages']
        ['' color 'WHEN' 'Coloring: auto, always, never']
        ['' frozen '' 'Require Cargo.lock and cache are up to date']
        ['' locked '' 'Require Cargo.lock is up to date']
        ['' offline '' 'Run without accessing the network']
        ['' config 'KEY=VALUE' 'Override a configuration value (unstable)']
        [h help '' 'Print help information']
]

    let result = (cargo --help | parse-help)

    if $result == $expect {
        "passed"
    } else {
        $result
    }
}

def test-nu [] {
    let expect = [
        [short long format description];
        [h help '' '']
        ['' stdin '' '']
        [l login '' '']
        [i interactive '' '']
        [v version '' '']
        [p perf '' '']
        ['' testbin 'String' '']
        ['c' commands 'String' '']
        ['' config 'String' '']
        ['' env-config 'String' '']
        ['' log-level 'String' '']
        ['t' threads 'Int' '']
]

    let result = (nu --help | parse-help)

    if $result == $expect {
        "passed"
    } else {
        $result
    }
}

def run-tests [] {
    [
        [test result];
        ['cargo' (do { test-cargo })]
        ['nu' (do { test-nu })]
    ]
}