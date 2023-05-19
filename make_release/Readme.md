
### How to run nu_deps.nu

```rust
cd <your nushell repo>
nu nu_deps.nu
```

### Create the release note PR on the website
```nu
./make_release/create-website-release-note-pr <version> <date>
```
e.g.
```nu
./make_release/create-website-release-note-pr 0.80 2023-05-16
```
