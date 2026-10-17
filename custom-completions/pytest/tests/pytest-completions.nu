# Run with `nu custom-completions/pytest/tests/pytest-completions.nu`.
use std/assert
source ../pytest-completions.nu

assert equal (nu-complete --log-file-mode) ["w", "a"]
assert equal (nu-complete --assert) ["plain", "rewrite"]

assert equal ('pytest --log-file-mode ' | commandline complete --detailed | get value | sort) ["a", "w"]
assert equal ('pytest --assert ' | commandline complete --detailed | get value | sort) ["plain", "rewrite"]
