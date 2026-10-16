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

changed paths are literal and conflicts are checkoutable
add-add conflicts are checkoutable but not ordinary changes
rename source cannot masquerade as a status record
