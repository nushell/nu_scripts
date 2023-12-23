$env.comma_scope = {|_|{
    created: '{{time}}'
    computed: {$_.cpu:{|a, s| $'($s.created)($a)' }}
    say: {|s| print $'(ansi $_.settings.theme.info)($s)(ansi reset)' }
    quick: {$_.flt:{|a, s| do $s.say 'run a `quick` filter' }}
    slow: {$_.flt:{|a, s|
        do $s.say 'run a `slow` filter'
        sleep 1sec
        do $s.say 'filter need to be declared'
        sleep 1sec
        $'($s.computed)<($a)>'
    }}
}}

$env.comma = {|_|{
    created: {|a, s| $s.computed }
    inspect: {|a, s| {index: $_, scope: $s, args: $a} | table -e }
    test: {
        $_.sub: {
            batch: { 'created; inspect' | do $_.batch }
            watch: {
                $_.act: {|a, s| $s | get $_.wth }
                $_.cmp: {ls *.json | get name}
                $_.dsc: 'inspect watch context'
                $_.wth: {
                    glob: '*'
                    op: ['Write', 'Create']
                    postpone: true
                }
            }
            open_file: {
                $_.act: {|a, s| open $a.0 }
                $_.cmp: {ls | get name}
                $_.dsc: 'open a file'
                $_.flt: ['slow']
            }
            ping: {
                $_.act: {|a, s| ping -c 2 localhost }
                $_.wth: {
                    interval: 2sec
                    clear: true
                }
            }
        }
        $_.dsc: 'run test'
        $_.flt: ['quick']
    }
}}
