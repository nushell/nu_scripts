
### How to run nu_deps.nu

```rust
cd <your nushell repo>
nu nu_deps.nu
```

## The release note
> **Note**  
> the scripts have been written in such a way they can be run from anywhere

### Inspect the merged PRs to write changelogs
```nu
./make_release/release-note/list-merged-prs nushell/nushell
```

### Complete the previous release note
1. paste the output of
```nu
./make_release/release-note/get-full-changelog
```
to the "*Full changelog*" section.

2. paste the output of
```nu
./make_release/release-note/list-merged-prs nushell/nushell --label breaking-change --pretty --no-author
```
to the "*Breaking changes*" section.

### Create the release note PR on the website after the release
see
```nu
./make_release/release-note/create-pr --help
```
