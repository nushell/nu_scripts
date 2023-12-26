$env.comma_scope = {|_|{
    created: '{{time}}'
    computed: {$_.computed:{|a, s| $'($s.created)($a)' }}
    say: {|s| print $'(ansi $_.settings.theme.info)($s)(ansi reset)' }
    quick: {$_.filter:{|a, s| do $s.say 'run a `quick` filter' }}
    slow: {$_.filter:{|a, s|
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
                $_.action: {|a, s| $s | get $_.watch }
                $_.completion: {ls *.json | get name}
                $_.desc: 'inspect watch context'
                $_.watch: {
                    glob: '*'
                    op: ['Write', 'Create']
                    postpone: true
                }
            }
            open_file: {
                $_.action: {|a, s| open $a.0 }
                $_.completion: {ls | get name}
                $_.desc: 'open a file'
                $_.filter: ['slow']
            }
            ping: {
                $_.action: {|a, s| ping -c 2 localhost }
                $_.watch: {
                    interval: 2sec
                    clear: true
                }
            }
        }
        $_.desc: 'run test'
        $_.filter: ['quick']
    }
}}