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

def "nu-complete ssh-host" [] {
    let files = [
        '/etc/ssh/ssh_config',
        '~/.ssh/config'
    ] | filter { |file| $file | path exists } 

    $files | each { |file|
        let lines = $file | open | lines | str trim

        mut result = []
        for $line in $lines {
            let data = $line | parse  --regex '^Host\s+(?<host>.+)'
            if ($data | is-not-empty) {
                $result = ($result | append { 'value': ($data.host | first), 'description': "" })
                continue;
            }
            let data = $line | parse --regex '^HostName\s+(?<hostname>.+)'
            if ($data | is-not-empty) {
                let last = $result | last | update 'description' ($data.hostname | first)
                $result = ($result | drop | append $last)
            }
        }
        $result
    } | flatten
}