# nu-version: 0.102.0

module lftp-completion-utils {
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

    export def get-ssh-sites []: nothing -> table<value: string, description: string> {
      let files = [
          '/etc/ssh/ssh_config',
          '~/.ssh/config'
      ] | filter {|file| $file | path exists }


      let first_result: record<hosts: list<record<name: string, addr: string>>, includes: list<string>> = $files | par-each {|file|
          let folder = $file | path expand | path dirname
          let r = $file | open --raw | process
          $r | update includes { each {|f| $folder | path join $f } }
      } | reduce {|it| merge deep $it --strategy=append }

      let $includes: list<string> = $first_result.includes | each {|f|
          if '*' in $f {
              glob $f
          } else if ($f | path exists) {
              [$f]
          } else []
      } | flatten

      # Process include files
      let included_hosts: list<record<name: string, addr: string>> = (if ($includes | is-empty) { [] } else {
          let second_result = $includes | par-each {|p| $p | open --raw | process } | reduce {|it| merge deep $it --strategy=append }
          $second_result.hosts
      })

      let hosts = $first_result.hosts ++ $included_hosts
      $hosts | each {|h| [$"sftp://($h.name)" $"fish://($h.name)"] | wrap value | insert description $h.addr } | flatten
    }

    export def get-bookmark-sites []: nothing -> table<value: string, description: string> {
      const FILE_PATH = '~/.local/share/lftp/bookmarks' | path expand
      let sites = try { open --raw $FILE_PATH | lines } catch { [] }
        | split column -n 2 -r \s+ value description
      $sites | update value { $"bm:($in)" }
    }
}


def "nu-complete lftp-site" [] {
  use lftp-completion-utils get-ssh-sites
  use lftp-completion-utils get-bookmark-sites
  get-ssh-sites | append (get-bookmark-sites)
}

export extern 'lftp' [
  -c: string                             # Execute the commands and exit
  -d                                     # Switch on debugging mode
  -e: string                             # Execute the command just after selecting
  -p: int                                # Use the port for connection
  -u: string                             # Use the user/password for authentication
  --norc                                 # Don't execute rc files from the home directory
  --help                                 # Print the help and exit
  --version                              # Print lftp version and exit
  site?: string@"nu-complete lftp-site"  # Host name, URL or bookmark name
]
