$env.comma_vars = {
    computed: {|a, e| $'($e.created)($a)' }
    created: '2023-12-20{3}23:46:07'
}

$env.comma = {
    created: {|a, e| $e.computed }
    hello: {
        $env.comm.act: {|args, vars| print $'hello ($args)' }
        $env.comm.dsc: 'hello (x)'
        $env.comm.cmp: {|args, vars| $args}
    }
    open: {
        $env.comm.sub: {
            any: {
                $env.comm.act: {|a, e| open $a.0}
                $env.comm.cmp: {ls | get name}
                $env.comm.dsc: 'open a file'
            }
            json: {
                $env.comm.act: {|a, e| open $a.0}
                $env.comm.cmp: {ls *.json | get name}
                $env.comm.dsc: 'open a json file'
            }
        }
        $env.comm.dsc: 'open a file'
    }
}
