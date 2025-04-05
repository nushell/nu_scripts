# nu-version: 0.102.0

export extern "ssh" [
    destination?: string@"nu-complete ssh-host"
    -4            # Forces ssh to use IPv4 addresses only.
    -6            # Forces ssh to use IPv6 addresses only.
    -A            # Enables forwarding of connections from an authentication agent such as ssh-agent(1).
    -a            # Disables forwarding of the authentication agent connection.
    -B: string    # bind_interface
    -b: string    # bind_address
    -C            # Requests compression of all data
    -c: string    # cipher_spec
    -D            # [bind_address:]port
    -E: string    # log_file
    -e            # escape_char
    -F: string    # configfile
    -f            # Requests ssh to go to background just before command execution.
    -G            # Causes ssh to print its configuration after evaluating Host and Match blocks and exit.
    -g            # Allows remote hosts to connect to local forwarded ports
    -I: string    # pkcs11
    -i: string    # identity_file
    -J: string    # destination
    -K            # Enables GSSAPI-based authentication and forwarding(delegation) of GSSAPI credentials to the server.
    -k            # Disables forwarding (delegation) of GSSAPI credentials to the server.
    -L: string    # [bind_address:]port:host:hostport / [bind_address:]port:remote_socket / local_socket:host:hostport / local_socket:remote_socket
    -l: string    # login_name
    -M            # Places the ssh client into “master” mode for connection sharing.
    -m: string    # mac_spec
    -N            # Do not execute a remote command.
    -n            # Redirects stdin from /dev/null (5) for details.
    -O: string    # ctl_cmd
    -o: string    # option
]

module ssh-completion-utils {
    def extract-host []: list<string> -> record<name: string, addr: string> {
        # Host is a list of lines, like:
        # ╭───┬──────────────────────────────╮
        # │ 0 │ Host quanweb                 │
        # │ 1 │     User quan                │
        # │ 2 │     Hostname quan.hoabinh.vn │
        # │ 3 │     # ProxyJump farmb-omz    │
        # │ 4 │                              │
        # ╰───┴──────────────────────────────╯
        let host = $in
        let $first_line = try { $host | first | str trim } catch { null }
        # Don't accept blocks like "Host *"
        if ($first_line | is-empty) or '*' in $first_line {
            null
        } else {
            let name = $first_line |  split row -r '\s+' | get 1
            # May not contain hostname
            match ($host | slice 1.. | find -ir '^\s*Hostname\s') {
                [] => null,
                $addr => { name: $name, addr: ($addr | str trim | split row -n 2 -r '\s+' | get 1) }
            }
        }
    }

    # Process a SSH config file
    export def process []: string -> record<hosts: list<record<name: string, addr: string>>, includes: list<string>> {
        let lines = $in | lines
        # Get 'Include' lines
        let include_lines = $lines | find -n -ir '^Include\s' | str trim | each { $in | split row -n 2 -r '\s+' | get 1 | str trim -c '"'}
        # Find "Host" blocks
        let marks = $lines | enumerate | find -n -ir '^Host\s'
        let mark_indices = $marks | get index | append ($lines | length)
        let hosts = $mark_indices | window 2 | each {|w| $lines | slice $w.0..<($w.1) }
        {
            hosts: ($hosts | each { $in | extract-host }),
            includes: $include_lines
        }
    }

}


def "nu-complete ssh-host" [] {
    let files = [
        '/etc/ssh/ssh_config',
        '~/.ssh/config'
    ] | filter {|file| $file | path exists }

    use ssh-completion-utils process

    let first_result = $files | par-each {|file|
        let folder = $file | path expand | path dirname
        mut r = $file | open --raw | process
        $r.includes = $r.includes | each {|f| $folder | path join $f }
        $r
    } | reduce {|it| merge deep $it --strategy=append }

    let $includes: list<string> = $first_result.includes | each {|f|
        if '*' in $f {
            glob $f
        } else if ($f | path exists) {
            [$f]
        } else []
    } | flatten

    # Process include files
    let included_hosts = (if ($includes | is-empty) { [] } else {
        let second_result = $includes | par-each {|p| $p | open --raw | process } | reduce {|it| merge deep $it --strategy=append }
        $second_result.hosts
    })

    let hosts = $first_result.hosts ++ $included_hosts
    $hosts | each { {value: $in.name, description: $in.addr } }
}
