`std-rfc` is the root directory for modules and commands under consideration for the Nushell [Standard Library](https://www.nushell.sh/book/standard_library.html).

As a part of the the larger nu_scripts mono-repo, users may find it more convenient (and efficient) to checkout `std-rfc` separately.

This can be done in Nushell using:

```nushell
let spec = {
  repo: 'https://github.com/nushell/nu_scripts'
  sparse_dir: 'stdlib-candidate/std-rfc'
  branch: 'main'
}

# Change to the parent directory location before running
let install_dir = './nu_scripts'

mkdir $install_dir
git -C $install_dir init
git -C $install_dir remote add origin $spec.repo
git -C $install_dir sparse-checkout set --no-cone --sparse-index $spec.sparse_dir
git -C $install_dir fetch --depth 1 --filter=blob:none origin $spec.branch
git -C $install_dir checkout $spec.branch
```

Then imported using:

```nushell
use ./nu_scripts/stdlib-candidate/std-rfc/<module>
# or
use ./nu_scripts/stdlib-candidate/std-rfc/<module> *
```

A sparse git checkout like the one above requires the full parent path from the repository, but you can symlink the `std-rfc` directory to a more convenient location if you prefer.
