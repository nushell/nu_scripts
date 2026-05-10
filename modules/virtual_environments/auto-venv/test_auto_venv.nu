#!/usr/bin/env nu
# Test suite for auto-venv module on nushell 0.108+

use path_extensions.nu
use venv_helpers.nu

export def main [] {
    let test_root = (mktemp -d | path expand)
    mut results = []

    print $"nushell version: (version | get version)"
    print $"test root: ($test_root)"
    print "---"

    # Setup: create mock project structure
    let trigger_name = ".__test-trigger.nu"
    let trigger_src = ($env.FILE_PWD | path join "venvs" "python-venv.nu")

    mkdir ($test_root | path join "project_a" ".venv" "bin")
    mkdir ($test_root | path join "project_a" "sub")
    mkdir ($test_root | path join "project_b")
    mkdir ($test_root | path join "nested" "outer" ".venv" "bin")
    mkdir ($test_root | path join "nested" "outer" "inner" ".venv" "bin")

    ln -sf $trigger_src ($test_root | path join "project_a" $trigger_name)
    ln -sf $trigger_src ($test_root | path join "project_b" $trigger_name)
    ln -sf $trigger_src ($test_root | path join "nested" "outer" $trigger_name)
    ln -sf $trigger_src ($test_root | path join "nested" "outer" "inner" $trigger_name)

    # Test 1: path find-sub locates trigger file
    let result = (path_extensions path find-sub ($test_root | path join "project_a") $trigger_name --type ["symlink", "file"])
    let ok = ($result == ($test_root | path join "project_a" $trigger_name))
    print $"(if $ok { 'PASS' } else { 'FAIL' }): path find-sub finds trigger in project_a"
    $results = ($results | append $ok)

    # Test 2: path find-sub returns null when not found
    let result = (path_extensions path find-sub "/tmp" $trigger_name)
    let ok = ($result | is-empty)
    print $"(if $ok { 'PASS' } else { 'FAIL' }): path find-sub returns null for missing trigger"
    $results = ($results | append $ok)

    # Test 3: path find-sub returns deepest match (last not first)
    let result = (path_extensions path find-sub ($test_root | path join "nested" "outer" "inner") $trigger_name --type ["symlink", "file"])
    let ok = ($result == ($test_root | path join "nested" "outer" "inner" $trigger_name))
    print $"(if $ok { 'PASS' } else { 'FAIL' }): path find-sub returns deepest match"
    if not $ok { print $"  got: ($result)" }
    $results = ($results | append $ok)

    # Test 4: path find-sub finds .venv
    let result = (path_extensions path find-sub ($test_root | path join "project_a") ".venv")
    let ok = ($result | is-empty | not $in)
    print $"(if $ok { 'PASS' } else { 'FAIL' }): path find-sub locates .venv"
    $results = ($results | append $ok)

    # Test 5: path find-sub returns null for .venv in project_b (no .venv there)
    let result = (path_extensions path find-sub ($test_root | path join "project_b") ".venv")
    let ok = ($result | is-empty)
    print $"(if $ok { 'PASS' } else { 'FAIL' }): path find-sub returns null for missing .venv"
    $results = ($results | append $ok)

    # Test 6: venv-is-active returns false when no overlay
    let ok = (not (venv_helpers venv-is-active))
    print $"(if $ok { 'PASS' } else { 'FAIL' }): venv-is-active false with no active overlay"
    $results = ($results | append $ok)

    # Test 7: has-entered-venv condition check
    $env.AUTO_VENV_TRIGGER = $trigger_name
    let ok = (venv_helpers has-entered-venv ($test_root | path join "project_a"))
    print $"(if $ok { 'PASS' } else { 'FAIL' }): has-entered-venv detects trigger in project_a"
    $results = ($results | append $ok)

    # Test 8: has-entered-venv returns false for dir without trigger in ancestry
    let ok = (not (venv_helpers has-entered-venv $test_root))
    print $"(if $ok { 'PASS' } else { 'FAIL' }): has-entered-venv false for dir without trigger in ancestry"
    $results = ($results | append $ok)

    # Test 9: default-hooks does not wrap list in list
    $env.AUTO_VENV_TRIGGER = $trigger_name
    $env.config.hooks.env_change = { PWD: [{|| null}] }
    source-env auto-venv.nu
    let hook_types = ($env.config.hooks.env_change.PWD | each {|h| $h | describe })
    let ok = (not ($hook_types | any {|t| $t starts-with "list<" }))
    print $"(if $ok { 'PASS' } else { 'FAIL' }): no nested list types in PWD hooks"
    if not $ok { print $"  types: ($hook_types)" }
    $results = ($results | append $ok)

    # Test 10: overlay use resolves via NU_LIB_DIRS
    $env.NU_LIB_DIRS = ($env.NU_LIB_DIRS | append ($env.FILE_PWD | path join "venvs"))
    overlay use python-venv.nu as __auto_venv_test
    let ok = ('__auto_venv_test' in (overlay list | where active | get name))
    print $"(if $ok { 'PASS' } else { 'FAIL' }): overlay use resolves via NU_LIB_DIRS"
    overlay hide __auto_venv_test --keep-env [PWD]
    $results = ($results | append $ok)

    # Cleanup
    rm -rf $test_root

    # Summary
    let passed = ($results | where $it | length)
    let failed = ($results | where (not $it) | length)
    print "---"
    print $"Results: ($passed) passed, ($failed) failed"
    if $failed > 0 { exit 1 }
}
