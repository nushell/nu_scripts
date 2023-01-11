#!/usr/env/bin nu

def get-target-dependencies [] {
    let target = ($in | get -i target)

    mut res = []

    if ($target | is-empty) {
        return $res
    }

    for col in ($target | columns) {
        let deps = ($target | get -i $col | get -i dependencies)
        if not ($deps | is-empty) {
            $res ++= ($deps | columns)
        }
    }

    $res
}

# Gather dependencies for each Nushell crate
export def nu-deps [] {
    let second_wave = [ 'nu-command' ]
    let third_wave = [ 'nu-cli' ]

    ls crates/nu-*/Cargo.toml | get name | each {|toml|
        let crate = ($toml | path dirname | path basename)
        let data = open $toml

        if not (($crate in $second_wave) or ($crate in $third_wave)) {
            mut deps = []
            $deps ++= ($data | get -i 'dependencies' | default {} | columns)
            $deps ++= ($data | get -i 'dev-dependencies' | default {} | columns)
            $deps ++= ($data | get-target-dependencies)
            let $deps = ($deps
                | where ($it | str starts-with 'nu-')
                | where not ($it == 'nu-ansi-term'))

            {
                'crate': $crate
                'dependencies': $deps
            }
        }
    }
}

def main [] {
    let deps = nu-deps

    mut list = []

    while ($list | length) < ($deps | length) {
        for row in $deps {
            mut nsubdeps = 0
            for sub_dep in $row.dependencies {
                if not ($sub_dep in $list) {
                    $nsubdeps += 1
                }
            }

            if ($nsubdeps == 0) and ($row.crate not-in $list) {
                $list ++= [$row.crate]
            }
        }
    }

    $list | table -e
}
