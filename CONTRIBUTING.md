# Contributing to nu_scripts

Thanks for your interest in contributing to nu_scripts!

## Getting Started

1. **Fork** the repository on GitHub.
2. **Clone** your fork locally.
3. Create a **new branch** for your changes.

## Development Tools

We provide a `toolkit.nu` module to help with development and validation. You can load it in your shell:

```nu
use toolkit.nu
```

### validating your changes

Before submitting a Pull Request, please run the `check pr` command. This ensures your changes meet our standards and pass all tests.

```nu
toolkit check pr
```

By default, this command acts on **changed files only** (files different from `origin/main`).

### Linting

You can run the linter separately if needed:

```nu
toolkit lint
```

#### check options

Both `check pr` and `lint` support the following flags:

- `--full`: Check **all** files in the repository, not just changed ones.
- `--and-exit`: Exit with a non-zero exit code if errors are found (useful for CI scripts).

## Testing

While `toolkit check pr` performs linting, it does not currently run logic tests (`toolkit test` is not yet implemented).

If your contribution involves complex logic (e.g., parsing helpers, new modules), we encourage you to create a test script to verify it. You can use the standard library's `std/assert` module for this.

**Note**: Functions and aliases in `.nu` files are not added to the global namespace unless explicitly `source`d or `use`d, so adding test files is safe.

Example `modules/my_feature/tests/test_my_feature.nu`:
```nu
use std/assert
use ../my_feature.nu

#[test]
def "feature works as expected" [] {
    assert equal (my_feature "input") "expected output"
}
```

You can run these tests manually:
```nu
nu modules/my_feature/tests/test_my_feature.nu
```

## Submitting a Pull Request

1. Push your changes to your fork.
2. Open a Pull Request against the `main` branch of `nushell/nu_scripts`.
3. Ensure the CI checks pass.
