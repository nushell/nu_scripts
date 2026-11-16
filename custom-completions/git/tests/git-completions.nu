# Run with `nu custom-completions/git/tests/git-completions.nu`.
# Set GIT_EXPECT_CUSTOM_COMPLETIONS=false only on older Nu versions whose engine
# falls back to built-in paths; direct provider assertions still run there.
use std/assert
source ../git-completions.nu
use git-completion-utils *

def with-repo [test: closure] {
  let original = pwd
  let dir = mktemp -d
  try {
    cd $dir
    ^git init -q -b main
    ^git config user.email tests@example.com
    ^git config user.name tests
    ^git config commit.gpgsign false
    ^git config core.hooksPath ($dir | path join disabled-hooks)
    "base" | save base.txt
    ^git add base.txt
    ^git commit -q -m base
    do $test
    cd $original
    rm -r $dir
  } catch {|error|
    cd $original
    rm -r $dir
    error make $error
  }
}

def "changed paths are literal and conflicts are checkoutable" [] {
  with-repo {||
    let names = if $nu.os-info.family == windows {
      ["annual report.md" "dollar $ and [glob].txt"]
    } else {
      ["annual report.md" "dollar $ and [glob].txt" "it's a \"draft\".md" "line\nbreak.txt"]
    }
    for name in $names {
      "original" | save $name
      ^git add -- $name
    }
    ^git commit -q -m paths
    for name in $names { "changed" | save -f $name }
    let changed = get-changed-files
    let checkoutable = get-checkoutable-files
    for name in $names {
      assert ($name in $changed)
      assert ($name in $checkoutable)
    }
    # Every checkout path slot needs a single, quoted Nu argument as its value.
    for line in ['git checkout -- ' 'git checkout main -- ' 'git checkout main ' 'git checkout '] {
      let result = nu-complete git checkout $line {cursor: ($line | str length)}
      let rows = if (($result | describe) | str starts-with 'record') { $result.completions } else { $result }
      for name in $names {
        let matches = $rows | where {|row| $row.display_override? == $name }
        assert equal ($matches | length) 1
        assert equal ($matches.0.value | from nuon) $name
      }
      # Require the custom provider by default so a fallback cannot hide a failure.
      let detailed = $line | commandline complete --detailed
      let custom_rows = $detailed | where {|row| $row.description? == File }
      if ($env.GIT_EXPECT_CUSTOM_COMPLETIONS? | default 'true') == 'true' {
        assert equal ($custom_rows | length) ($names | length)
      }
      for name in $names {
        let matches = $custom_rows | where {|row| $row.display_override? == $name }
        if ($matches | is-not-empty) {
          assert equal ($matches.0.value | from nuon) $name
        }
      }
    }
    let detailed = 'git checkout -- annual' | commandline complete --detailed
    let custom = $detailed | where {|row| $row.display_override? == 'annual report.md' }
    if ($env.GIT_EXPECT_CUSTOM_COMPLETIONS? | default 'true') == 'true' {
      assert equal ($custom | length) 1
    }
    if ($custom | is-not-empty) {
      assert equal ($custom.0.value | from nuon) 'annual report.md'
      assert equal $custom.0.span.start ('git checkout -- ' | str length)
      assert equal $custom.0.span.end ('git checkout -- annual' | str length)
    }

    ^git branch side
    "main" | save -f base.txt
    ^git commit -q -am main
    ^git switch -q side
    "side" | save -f base.txt
    ^git commit -q -am side
    ^git switch -q main
    let merge = (^git merge --no-edit side | complete)
    assert equal $merge.exit_code 1
    assert ("base.txt" in (get-checkoutable-files))
    assert ("base.txt" not-in (get-changed-files))
  }
}

def "add-add conflicts are checkoutable but not ordinary changes" [] {
  with-repo {||
    ^git branch side
    "main" | save both.txt
    ^git add both.txt
    ^git commit -q -m main-add
    ^git switch -q side
    "side" | save both.txt
    ^git add both.txt
    ^git commit -q -m side-add
    ^git switch -q main
    let merge = (^git merge --no-edit side | complete)
    assert equal $merge.exit_code 1
    assert ("both.txt" in (get-checkoutable-files))
    assert ("both.txt" not-in (get-changed-files))
  }
}

def "rename source cannot masquerade as a status record" [] {
  with-repo {||
    let old = '1 .M N... 100644 100644 100644 abcdef abcdef phantom'
    "original" | save $old
    ^git add -- $old
    ^git commit -q -m old-name
    ^git mv -- $old renamed.txt
    let records = ^git status -uno --porcelain=2 -z | split row "\u{0}"
    assert ($records.0 starts-with '2 R.')
    assert equal (get-changed-files) []
    assert equal (get-checkoutable-files) []
  }
}

def "remote rows stay on their own lines" [] {
  with-repo {||
    ^git remote add origin '/tmp/a remote with spaces'
    ^git remote add plain 'https://example.invalid/repo.git'
    let rows = nu-complete git remotes
    assert equal ($rows | length) 2
    assert equal ($rows | get value | sort) [origin plain]
    assert equal ($rows | where value == origin | get 0.description) '/tmp/a remote with spaces'
    assert equal ($rows | where value == plain | get 0.description) 'https://example.invalid/repo.git'
  }
}

def "push delete offers remote names with flags in context" [] {
  with-repo {||
    for ref in [refs/remotes/upstream/main refs/remotes/upstream/feature/a refs/remotes/upstream2/decoy] {
      ^git update-ref $ref HEAD
    }
    ^git symbolic-ref refs/remotes/upstream/HEAD refs/remotes/upstream/main
    for line in ['git push --delete upstream ' 'git push -d upstream ' 'git push --force upstream --delete ' 'git push --push-option value --delete upstream ' 'git push --repo upstream --delete ' 'git push --repo=upstream --delete '] {
      let actual = nu-complete git push $line {cursor: ($line | str length)}
      assert equal ($actual | sort) ['feature/a' 'main']
    }
    let midline = 'git push --delete upstream --force'
    assert equal ((nu-complete git push $midline {cursor: 27}) | sort) ['feature/a' 'main']
    let normal = 'git push --force upstream '
    let actual = nu-complete git push $normal {cursor: ($normal | str length)}
    assert ('main' in $actual)
    assert (':feature/a' in $actual)
    assert (':decoy' not-in $actual)
    # These flags must not turn an option value or a refspec into a remote or --delete.
    for line in [
      'git push --signed upstream '
      'git push --signed=if-asked upstream '
      'git push --repo upstream '
      'git push --repo=upstream '
      'git push --push-option --delete upstream '
      'git push upstream --push-option --delete '
      'git push -- upstream '
      'git push upstream -- --delete '
      'git push --delete --no-delete upstream '
    ] {
      let actual = nu-complete git push $line {cursor: ($line | str length)}
      assert ('main' in $actual)
      assert (':feature/a' in $actual)
      assert ('feature/a' not-in $actual)
    }
  }
}

def "push strips a slash-containing remote name exactly" [] {
  with-repo {||
    ^git remote add team/upstream ../unused-remote
    for ref in [refs/remotes/team/upstream/main refs/remotes/team/upstream/feature/a refs/remotes/team/upstream/foo/HEAD refs/remotes/team/upstream2/decoy] {
      ^git update-ref $ref HEAD
    }
    ^git symbolic-ref refs/remotes/team/upstream/HEAD refs/remotes/team/upstream/main
    let deleted = 'git push --delete team/upstream '
    assert equal ((nu-complete git push $deleted {cursor: ($deleted | str length)}) | sort) ['feature/a' 'foo/HEAD' 'main']
    let normal = 'git push team/upstream '
    let rows = nu-complete git push $normal {cursor: ($normal | str length)}
    assert (':feature/a' in $rows)
    assert (':foo/HEAD' in $rows)
    assert (':decoy' not-in $rows)
  }
}

# The values (or displayed labels) nushell would offer for `line`.
def offered [line: string]: nothing -> list<string> {
  $line | commandline complete --detailed | each {|row| $row.display_override? | default $row.value }
}

def "undeclared flags are offered by the positional completers" [] {
  with-repo {||
    # Optional-value and attached-value options are not declared on the externs.
    assert ('--color=always' in (offered 'git log --color='))
    assert ('--pretty=oneline' in (offered 'git log --pre'))
    assert ('-Xtheirs' in (offered 'git merge -X'))
    assert ('-uno' in (offered 'git status -u'))
    assert ('--force-with-lease' in (offered 'git push --force-w'))
    # Negations only show up once the user starts typing one.
    assert ('--no-verify' in (offered 'git commit --no-'))
    assert ('--no-amend' in (offered 'git commit --no-'))
    assert ('--no-amend' not-in (offered 'git commit --am'))
    # Multi-word externs resolve to their own table.
    assert ('--stat' in (offered 'git stash show --st'))
  }
}

def "file completers follow the index and the current directory" [] {
  with-repo {||
    mkdir sub
    "s" | save sub/inner.txt
    ^git add sub/inner.txt
    ^git commit -q -m sub
    "changed" | save -f base.txt
    "new" | save untracked.txt
    "staged" | save -f sub/inner.txt
    ^git add sub/inner.txt
    assert equal (offered 'git add ' | sort) [base.txt untracked.txt]
    assert equal (offered 'git restore ') [base.txt]
    assert equal (offered 'git restore --staged ') [sub/inner.txt]
    assert equal (offered 'git clean ') [untracked.txt]
    assert equal (offered 'git commit -- ' | sort) [base.txt sub/inner.txt]
    assert ('sub/inner.txt' in (offered 'git diff --cached '))
    assert ('base.txt' not-in (offered 'git diff --cached '))
    cd sub
    assert equal (offered 'git add ' | sort) [../base.txt ../untracked.txt]
    assert equal (offered 'git restore --staged ') [inner.txt]
  }
}

def "revision arguments complete in the right slots" [] {
  with-repo {||
    ^git branch feature
    ^git tag v1.0
    ^git remote add origin https://example.invalid/repo.git
    for ref in [refs/remotes/origin/main refs/remotes/origin/topic] { ^git update-ref $ref HEAD }
    assert equal (offered 'git pull origin ' | sort) [main topic]
    assert equal (offered 'git fetch origin ' | sort) [main topic]
    assert equal (offered 'git branch -d ' | sort) [feature main]
    # A new branch's start point, and the commit after --contains/--merged, are revisions.
    for line in ['git branch new ' 'git branch --contains ' 'git tag v2 ' 'git tag --points-at '] {
      let rows = offered $line
      assert ('origin/topic' in $rows) $line
      assert ('v1.0' in $rows) $line
    }
    assert equal (offered 'git tag -d ') [v1.0]
    assert ('v1.0' in (offered 'git log '))
    # Paths take over after `--`, and when no revision matches the typed prefix: the completer
    # returns null so nushell falls back to its own path completion.
    assert equal (nu-complete git refs or paths {text: ''} {command: ['git log' '--' '']}) null
    assert equal (nu-complete git refs or paths {text: 'ba'} {command: ['git log' 'ba']}) null
    assert ((nu-complete git refs or paths {text: 'fe'} {command: ['git log' 'fe']}) != null)
  }
}

def "subcommand completion lists commands, not concept guides" [] {
  let rows = nu-complete git subcommands | get value
  assert ('add' in $rows)
  assert ('attributes' not-in $rows)
  assert ('gitignore' not-in $rows)
}

def "completers are silent outside a repository" [] {
  let file = $env.FILE_PWD | path dirname | path join git-completions.nu
  let dir = mktemp -d
  let completers = [
    'nu-complete git refs' 'nu-complete git commits' 'nu-complete git add' 'nu-complete git restore'
    'nu-complete git diff' 'nu-complete git stash-list' 'nu-complete git tags' 'nu-complete git remotes'
    'nu-complete git worktrees' 'nu-complete git submodules' 'nu-complete git local branches'
    'nu-complete git mergable sources' 'nu-complete git reflog entries' 'nu-complete git config sections'
  ]
  let script = $completers | each {|c| $"($c) | ignore" } | str join "\n"
  let result = do { cd $dir; ^$nu.current-exe --no-config-file -c $"source '($file)'\n($script)" } | complete
  rm -r $dir
  assert equal $result.exit_code 0
  assert equal $result.stderr ''
}

# Externs must not change what git receives: undeclared options and quoted values pass through
# exactly as they would without the completions loaded.
def "command lines reach git unchanged" [] {
  if $nu.os-info.family == windows { return }
  let file = $env.FILE_PWD | path dirname | path join git-completions.nu
  let bin = mktemp -d
  "#!/bin/sh\nfor a in \"$@\"; do printf '[%s]\\n' \"$a\"; done\n" | save ($bin | path join git)
  chmod +x ($bin | path join git)
  let lines = [
    'git log --pretty=format:"%h %s" -S"two words"'
    'git merge -Xtheirs feature'
    'git push --force-with-lease=main:abc origin main'
    'git status -uno'
    'git log -n5 -U3'
    'git config set core.bare false'
    'git -c user.name="A B" commit -m x'
    'git branch --merged'
    'git commit --help'
    'git log --exclude=refs/* --all'
    # Aliases and external commands must not pick up git's global short options.
    'git st -v'
    'git co -p f'
    'git lfs -v'
  ]
  let run = {|source, line| with-env {PATH: ($env.PATH | prepend $bin)} { ^$nu.current-exe --no-config-file -c $"($source)($line)" | complete } }
  for line in $lines {
    let raw = do $run '' $line
    let ext = do $run $"source '($file)'\n" $line
    assert equal $ext.exit_code 0 $line
    assert equal $ext.stdout $raw.stdout $line
  }
  rm -r $bin
}

def "git aliases complete like the command they stand for" [] {
  with-repo {||
    ^git branch feature
    ^git config alias.co checkout
    ^git config alias.st 'status -uno'
    ^git config alias.c2 co
    ^git config alias.sh-co '!f() { git checkout "$@"; }; f'
    ^git config alias.boom '!touch boom-ran.txt'
    "changed" | save -f base.txt
    for line in ['git co ' 'git c2 ' 'git sh-co ' 'git --no-pager co '] {
      assert ('feature' in (offered $line)) $line
    }
    assert equal (offered 'git co -- ') [base.txt]
    assert ('--ours' in (offered 'git co --ou'))
    assert ('-uno' in (offered 'git st -u'))
    assert ('co' in (nu-complete git subcommands | get value))
    # A shell alias is never run to find its completions.
    offered 'git boom ' | ignore
    offered 'git boom -' | ignore
    assert not ('boom-ran.txt' | path exists)
    # `-C` makes completions come from that directory.
    mkdir sub
    "new" | save sub/new.txt
    assert equal (offered 'git -C sub add ' | sort) [../base.txt new.txt]
  }
}

# Completing a flag runs `git <command> -h`; every command that can happen to must answer with
# its usage and leave the repository alone (GIT_NO_HELP lists the ones that do not).
def "every help the completer runs prints usage and changes nothing" [] {
  with-repo {||
    "stash me" | save -f base.txt
    ^git stash -q
    "dirty" | save -f base.txt
    let state = {||
      [(^git count-objects -v) (^git stash list) (^git status --porcelain) (^git for-each-ref)] | str join "\n--\n"
    }
    let hand = $GIT_OPTIONS | lines | where $it != '' | each { split row "\t" | first } | uniq
    let subs = $GIT_SUBCOMMANDS | lines | where $it != '' | each { split row "\t" | first }
    let keys = $GIT_BUILTINS | append $subs | append [range-diff]
      | where {|k| ($k | split row ' ' | first) in $GIT_BUILTINS and $k not-in $hand and $k not-in $GIT_NO_HELP }
    let home = mktemp -d
    with-env {HOME: $home, XDG_CONFIG_HOME: ($home | path join .config), GIT_CONFIG_NOSYSTEM: '1', GIT_CONFIG_GLOBAL: ($home | path join .gitconfig)} {
      for key in $keys {
        let words = match $key { stash => [stash push], config => [config '--get'], _ => ($key | split row ' ') }
        let before = do $state
        let result = '' | ^git ...$words -h | complete
        assert equal (do $state) $before $key
        # Some subcommands refuse to run outside their mode (a non-sparse worktree) instead.
        assert ((($result.stdout + $result.stderr) =~ '(?m)^\s*usage: ') or $result.exit_code == 128) $key
      }
    }
    rm -r $home
  }
}

# Some options only parse as `--opt=value` (revision.c, rev-parse); a fake git cannot tell, so
# run the real one through the externs and compare with a plain external call.
def "real git accepts what the externs pass" [] {
  let file = $env.FILE_PWD | path dirname | path join git-completions.nu
  with-repo {||
    let lines = [
      'git log -1 --format=%s'
      'git log -1 --min-parents=0 --format=%h'
      'git log -1 --date=iso --pretty=format:%ad'
      'git log --max-count 1 --oneline'
      'git rev-parse --since=2024-01-01T00:00:00+0000'
      'git rev-parse --default HEAD'
      'git --list-cmds=main'
    ]
    for line in $lines {
      let raw = ^$nu.current-exe --no-config-file -c $line | complete
      let ext = ^$nu.current-exe --no-config-file -c $"source '($file)'\n($line)" | complete
      assert equal $ext.exit_code $raw.exit_code $line
      assert equal $ext.stdout $raw.stdout $line
    }
  }
}

def "values follow the command, aliases and option values" [] {
  with-repo {||
    ^git branch feature
    ^git tag v1.0
    # A per-command null means no values: commit --date takes a date, not a format.
    assert equal (offered 'git commit --date=') []
    assert ('--date=iso' in (offered 'git log --date='))
    assert equal (offered 'git remote add --track ') []
    # Shell parameters in a `!` alias are not arguments.
    ^git config alias.co2 '!git checkout "$@"'
    ^git config alias.sw '!git switch $1'
    assert ('feature' in (offered 'git co2 '))
    assert ('feature' in (offered 'git sw '))
    # An option value before the subcommand is skipped.
    assert ('user.name' in (offered 'git config -f x.cfg get user.'))
    assert ('v1.0' in (offered 'git notes --ref foo add '))
    # ...and before a positional: `msg` is the message, the tag name comes next.
    assert equal (offered 'git tag -m msg ') [v1.0]
    # A command without an argument table falls back to path completion.
    assert equal (nu-complete git {text: ''} {command: [git checkout-index '']}) null
    # Boolean config keys can be written without a value.
    "[custom]\n\tflag\n" | save --append .git/config
    assert ('custom.flag' in ((nu-complete git config keys).completions.value))
  }
}

match ($env.GIT_COMPLETION_CASE? | default all) {
  changed => {
    changed paths are literal and conflicts are checkoutable
    add-add conflicts are checkoutable but not ordinary changes
    rename source cannot masquerade as a status record
  }
  remotes => { remote rows stay on their own lines }
  push => {
    push delete offers remote names with flags in context
    push strips a slash-containing remote name exactly
  }
  flags => {
    undeclared flags are offered by the positional completers
    command lines reach git unchanged
    real git accepts what the externs pass
  }
  files => { file completers follow the index and the current directory }
  aliases => { git aliases complete like the command they stand for }
  help => { every help the completer runs prints usage and changes nothing }
  refs => { revision arguments complete in the right slots }
  values => { values follow the command, aliases and option values }
  basics => {
    subcommand completion lists commands, not concept guides
    completers are silent outside a repository
  }
  all => {
    changed paths are literal and conflicts are checkoutable
    add-add conflicts are checkoutable but not ordinary changes
    rename source cannot masquerade as a status record
    remote rows stay on their own lines
    push delete offers remote names with flags in context
    push strips a slash-containing remote name exactly
    undeclared flags are offered by the positional completers
    file completers follow the index and the current directory
    revision arguments complete in the right slots
    subcommand completion lists commands, not concept guides
    completers are silent outside a repository
    command lines reach git unchanged
    real git accepts what the externs pass
    git aliases complete like the command they stand for
    every help the completer runs prints usage and changes nothing
    values follow the command, aliases and option values
  }
}
