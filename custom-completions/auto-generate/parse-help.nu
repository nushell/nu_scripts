

# parses a input string in --help format and returns a table of parsed flags
def parse-help [] {
    # help format  '        -s,                      --long                   <format>                 description   '
    $in | parse -r '\s\s+(?:-(?P<short>\w)[,\s]+)?(?:--(?P<long>[\w-]+))\s*(?:<(?P<format>.*)>)?\s*(?P<description>.*)?'
}

# takes a table of parsed help commands in format [short? long format? description]
def make-completion [command_name: string] {
    build-string "extern \"" $command_name "\" [\n" ($in | each { |it|
        build-string "\t--" $it.long (if ($it.short | is-empty) == false {
            build-string "(-" $it.short ")"
        }) (if ($it.description | is-empty) == false {
            build-string "\t\t# " $it.description
        })
    } | str join "\n") "\n\t...args\n]"
}

module tests {
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
            [h help '' 'Display this help message']
            ['' stdin '' 'redirect the stdin']
            [l login '' 'start as a login shell']
            [i interactive '' 'start as an interactive shell']
            [v version '' 'print the version']
            [p perf '' 'start and print performance metrics during startup']
            ['' testbin 'String' 'run internal test binary']
            [c commands 'String' 'run the given commands and then exit']
            ['' config 'String' 'start with an alternate config file']
            ['' env-config 'String' 'start with an alternate environment config file']
            ['' log-level 'String' 'log level for performance logs']
            ['t' threads 'Int' 'threads to use for parallel commands']
    ]

        let result = (nu --help | parse-help)

        if $result == $expect {
            "passed"
        } else {
            $result
        }
    }

    export def run-tests [] {
        [
            [test result];
            ['cargo' (do { test-cargo })]
            ['nu' (do { test-nu })]
        ]
    }
}
