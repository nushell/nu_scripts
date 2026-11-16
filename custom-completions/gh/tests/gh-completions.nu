# Run with `nu custom-completions/gh/tests/gh-completions.nu`.
# A fake `gh` on PATH answers the calls the completers make, so no test touches the network.
use std/assert
source ../gh-completions.nu

const FAKE_GH_BODY = r#'
printf "%s|%s\n" "${GH_REPO:-}" "$*" >> "$GH_FAKE_LOG"
case "$*" in
  "alias list") echo "co: pr checkout" ;;
  "extension list") printf "gh stack\tgithub/gh-stack\tv0.0.8\n" ;;
  "config --help") printf '%s\n' 'Settings:' '- `git_protocol`: the protocol `{https | ssh}` (default `https`)' '- `prompt`: toggle prompting `{enabled | disabled}`' '- `editor`: the text editor' ;;
  "pr list --json") printf '%s\n' 'Specify one or more comma-separated fields for `--json`:' '  author' '  number' '  title' >&2; exit 1 ;;
  *"pulls?state=open"*) echo "[{\"number\":12,\"title\":\"Fix it\",\"branch\":\"fix\",\"author\":\"amy\",\"merged\":false},{\"number\":3,\"title\":\"Old\",\"branch\":\"old\",\"author\":\"bo\",\"merged\":false}]" ;;
  *"pulls?state=closed"*) echo "[{\"number\":7,\"title\":\"Shipped\",\"branch\":\"s\",\"author\":\"amy\",\"merged\":true},{\"number\":8,\"title\":\"Dropped\",\"branch\":\"d\",\"author\":\"bo\",\"merged\":false}]" ;;
  *"/labels?"*)
    if [ "$GH_REPO" = "other/repo" ]; then echo "[{\"name\":\"other-label\",\"description\":null}]"
    else echo "[{\"name\":\"bug\",\"description\":\"Broken\"},{\"name\":\"help wanted\",\"description\":null}]"; fi ;;
  *"releases/tags/v1"*) echo "[{\"name\":\"app.tar.gz\",\"size\":2048}]" ;;
  *"user/repos"*) echo "[{\"name\":\"me/tool\",\"description\":\"A tool\"}]" ;;
  *) exit 1 ;;
esac
'#

def with-fake-gh [test: closure] {
    let dir = mktemp -d
    let log = $dir | path join calls.log
    $"#!/bin/sh($FAKE_GH_BODY)" | save ($dir | path join gh)
    ^chmod +x ($dir | path join gh)
    # gh's config (aliases) and data (extensions) directories, read directly by the completer.
    mkdir ($dir | path join config) ($dir | path join data gh extensions gh-stack)
    "aliases:\n    co: pr checkout\n    bugs: issue list --label=bug\n    hi: '!echo hi'\n" | save ($dir | path join config config.yml)
    let original = pwd
    try {
        cd $dir
        let env_vars = {
            PATH: ($env.PATH | prepend $dir), GH_FAKE_LOG: $log
            GH_CONFIG_DIR: ($dir | path join config), XDG_DATA_HOME: ($dir | path join data)
        }
        with-env $env_vars { do $test $log }
        cd $original
        rm -r $dir
    } catch {|error|
        cd $original
        rm -r $dir
        error make $error
    }
}

# Argument completions for `line`, leaving out subcommand names.
def values-of [line: string]: nothing -> list<string> {
    $line | commandline complete --detailed | where kind? != command
    | each {|row| $row.display_override? | default $row.value }
}

def calls [log: string]: nothing -> list<string> {
    if ($log | path exists) { open --raw $log | lines } else { [] }
}

def "top level offers aliases and extensions next to subcommands" [] {
    with-fake-gh {|log|
        let top = values-of 'gh '
        for name in [pr issue repo api co bugs stack] { assert ($name in $top) $name }
        assert equal (values-of 'gh pr li') [list]
        assert ('view' in (values-of 'gh pr '))
        assert equal (values-of 'gh extension remove ') [stack]
        assert equal (calls $log) []
    }
}

def "user aliases complete like the command they stand for" [] {
    with-fake-gh {|log|
        assert equal (values-of 'gh co ') ['12' '3']
        assert ('--state' in (values-of 'gh bugs --st'))
        # A shell alias is never run; it just gets no argument completions.
        assert equal (values-of 'gh hi ') []
    }
}

def "pull requests are completed by state" [] {
    with-fake-gh {|log|
        assert equal (values-of 'gh pr view ') ['12' '3']
        assert equal (values-of 'gh pr reopen ') ['8']
        assert equal (values-of 'gh pr revert ') ['7']
        # A command alias resolves to the command it stands for.
        assert equal (values-of 'gh pr co ') ['12' '3']
        let detailed = 'gh pr view ' | commandline complete --detailed
        assert equal $detailed.0.description 'Fix it [fix] by amy'
    }
}

def "flag names never reach the network" [] {
    with-fake-gh {|log|
        let values = values-of 'gh pr view --'
        for flag in [--repo --json --web --comments --help] { assert ($flag in $values) $flag }
        assert ('-w' in (values-of 'gh pr view -'))
        assert equal (calls $log) []
    }
}

def "the second slot follows the first" [] {
    with-fake-gh {|log|
        assert equal (values-of 'gh release delete-asset v1 ') ['app.tar.gz']
        assert equal (values-of 'gh config set prompt ') ['enabled' 'disabled']
        assert equal (values-of 'gh config get ') ['git_protocol' 'prompt' 'editor']
    }
}

def "labels follow --repo and quote names with spaces" [] {
    with-fake-gh {|log|
        let rows = 'gh issue list --label ' | commandline complete --detailed
        assert equal ($rows | where value == bug | length) 1
        let spaced = $rows | where display_override? == 'help wanted'
        assert equal ($spaced.0.value | from nuon) 'help wanted'
        let multi = 'gh issue list --label bug,he' | commandline complete --detailed
        assert equal ($multi.0.value | from nuon) 'bug,help wanted'
        assert equal (values-of 'gh issue list -R other/repo --label ') ['other-label']
        assert equal (values-of 'gh issue list --repo=other/repo --label ') ['other-label']
        assert ((calls $log) | any {|call| $call starts-with 'other/repo|' })
    }
}

def "json fields come from gh and accept comma lists" [] {
    with-fake-gh {|log|
        assert equal (values-of 'gh pr list --json ') ['author' 'number' 'title']
        assert equal (values-of 'gh pr list --json number,ti') ['number,title']
    }
}

def "static values come from the help text" [] {
    with-fake-gh {|log|
        assert equal (values-of 'gh issue list --state ' | sort) ['all' 'closed' 'open']
        let reasons = 'gh issue close 1 --reason ' | commandline complete --detailed
        let planned = $reasons | where display_override? == 'not planned'
        assert equal ($planned.0.value | from nuon) 'not planned'
        assert equal (values-of 'gh completion --shell ' | sort) ['bash' 'fish' 'powershell' 'zsh']
    }
}

def "failures and flag values stay quiet" [] {
    with-fake-gh {|log|
        # The fake gh fails for issues, as gh does outside a repository or offline.
        assert equal (values-of 'gh issue view ') []
        # A value with nothing to suggest (`-L <count>`) gets no suggestions.
        assert equal (values-of 'gh pr list -L ') []
    }
}

def "arguments reach gh exactly as typed" [] {
    with-fake-gh {|log|
        let printer = '#!/bin/sh
for a in "$@"; do printf "%s\n" "$a"; done
'
        $printer | save -f gh
        ^chmod +x gh
        assert equal (gh release edit v1.0 --draft=false | lines) [release edit v1.0 --draft=false]
        assert equal (gh api x -f body='Hi there' | lines) [api x -f 'body=Hi there']
        assert equal (gh workflow view 0451 | lines) [workflow view '0451']
        let n = 5
        assert equal (gh pr view $n -R o/r | lines) [pr view '5' -R o/r]
        assert equal (gh pr list -L5 | lines) [pr list -L5]
        assert equal (gh release download v1 --pattern=*.tar.gz | lines) [release download v1 '--pattern=*.tar.gz']
        assert equal (gh co -p 12 | lines) [co -p '12']
    }
}

if $nu.os-info.family == windows {
    print 'skipped: the fake gh is a POSIX shell script'
} else {
    top level offers aliases and extensions next to subcommands
    user aliases complete like the command they stand for
    pull requests are completed by state
    flag names never reach the network
    the second slot follows the first
    labels follow --repo and quote names with spaces
    json fields come from gh and accept comma lists
    static values come from the help text
    failures and flag values stay quiet
    arguments reach gh exactly as typed
}
