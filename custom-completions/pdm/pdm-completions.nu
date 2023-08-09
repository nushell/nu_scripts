def "nu-complete pdm export-file-format" [] {
    [pipfile, poetry, flit, setuppy, requirements]
}

def "nu-complete pdm cache-types" [] {
    [hashes,http,wheels,metadata,packages]
}

def "nu-complete pdm cache-commands" [] {
    [list, clear, remove, info]
}

def "nu-complete pdm self-commands" [] {
    [list, add, remove, update]
}

def "nu-complete pdm venv-commands" [] {
    [create, list, remove, activate, purge]
}

def "nu-complete pdm current-groups" [] {
    let ng1 = try {(open pyproject.toml | get tool.pdm.dev-dependencies | columns)} catch {[]}
    let ng2 = try {(open pyproject.toml | get project.optional-dependencies | columns)} catch {[]}
    [] | append $ng1 | append $ng2
}

def "nu-complete pdm current-scripts" [] {
    try {(open pyproject.toml | get tool.pdm.scripts | columns)} catch {[]}
}

export extern "pdm add"  [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --lockfile(-L): path
    --save-compatible
    --save-wildcard,
    --save-exact
    --save-minimum
    --update-reuse
    --update-eager
    --update-all
    --pre
    --prerelease
    --unconstrained(-u)
    --dry-run
    --venv: string
    --skip(-k)
    --dev(-d)
    --group(-G): string@"nu-complete pdm current-groups"
    --no-sync
    --editable (-e)
    --no-editable
    --no-self
    --fail-fast(-x)
    --no-isolation
]


export extern "pdm build" [
    --verbose(-v)
    --project(-p): path
    --no-isolation
    --skip(-k)
    --no-sdist
    --no-wheel
    --dest(-d): string
    --no-clean
    --config-setting(-C): string

]

export extern "pdm config" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --local(-l)
    --delete(-d)
    --edit(-e)
]

export extern "pdm cache" [
    --verbose(-v)
    command?: string@"nu-complete pdm cache-commands"
]

export extern "pdm cache list" [
    --verbose(-v)
]

export extern "pdm cache clear" [
    --verbose(-v)
    ...targets: string@"nu-complete pdm cache-types"
]

export extern "pdm cache remove" [
    --verbose(-v)
]

export extern "pdm cache info" [
    --verbose(-v)
]

export extern "pdm export" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --lockfile(-L): path
    --format: string@"nu-complete pdm export-file-format"
    --without-hashes
    --output(-o): string
    --pyproject
    --expandvars
    --group(-G): string@"nu-complete pdm current-groups"
    --no-default
    --dev(-d)
    --prod
]

export extern "pdm fix" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --dry-run
]

export extern "pdm import" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --dev(-d)
    --group(-G): string@"nu-complete pdm current-groups"
    --format: string@"nu-complete pdm export-file-format"
]

export extern "pdm info" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --python
    --where
    --packages
    --env
    --json
]

export extern "pdm init" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --skip(-k)
    --copier
    --cookiecutter
    --non-interactive(-n)
    --python: string
    --backend: string
    --lib
    template?: path
    ...generator_args: string
]


export extern "pdm install" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --dry-run
    --lockfile(-L): path
    --skip(-k)
    --venv: string
    --no-lock
    --check
    --plugins
    --group(-G): string@"nu-complete pdm current-groups"
    --no-default
    --dev(-d)
    --prod
    --no-editable
    --no-self
    --fail-fast(-x)
    --no-isolation
]

export extern "pdm list" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --venv: string
    --freeze
    --graph
    --reverse(-r)
    --resolve
    --fields: string
    --sort: string
    --csv
    --json
    --markdown
    --include: string
    --exclude: string
]

export extern "pdm lock" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --lockfile(-L): path
    --no-isolation
    --skip(-k)
    --refresh
    --check
    --no-cross-platform
    --static-urls
    --no-static-urls
    --group(-G): string@"nu-complete pdm current-groups"
    --no-default
    --dev(-d)
    --prod
]

export extern "pdm publish" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --skip(-k)
    --repository(-r): string
    --username(-u): string
    --password(-P): string
    --sign(-S)
    --identity(-i): string
    --comment(-c): string
    --no-build
    --no-very-ssl
    --ca-certs: path
]

export extern "pdm remove" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --dry-run
    --lockfile(-L): path
    --skip(-k)
    --venv: string
    --dev(-d)
    --group(-G): string@"nu-complete pdm current-groups"
    --no-sync
    --no-editable
    --no-self
    --fail-fast(-x)
    --no-isolation
]

export extern "pdm run" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --skip(-k)
    --venv: string
    --list(-l)
    --json(-j)
    --site-packages(-s)
    script: string@"nu-complete pdm current-scripts"
    ...args: string
]

export extern "pdm search" [
    --verbose(-v)
]

export extern "pdm self" [
    --verbose(-v)
    command?: string@"nu-complete pdm self-commands"
]

export extern "pdm self list" [
    --verbose(-v)
    --plugins
]

export extern "pdm self add" [
    --verbose(-v)
    --pip-args: string
    ...packages: string
]

export extern "pdm self remove" [
    --verbose(-v)
    --pip-args: string
    --yes(-y)
    ...packages: string
]

export extern "pdm self update" [
    --verbose(-v)
    --pip-args: string
    --head
    --pre
]

export extern "pdm show" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --venv: string
    --name
    --version
    --summary
    --license
    --platform
    --keywords
    package?: string
]

export extern "pdm sync" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --dry-run
    --lockfile(-L): path
    --skip(-k)
    --venv: string
    --clean
    --only-keep
    --reinstall(-r)
    --group(-G): string@"nu-complete pdm current-groups"
    --no-default
    --dev(-d)
    --prod
    --no-editable
    --no-self
    --fail-fast(-x)
    --no-isolation
]

export extern "pdm update" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --lockfile(-L): path
    --save-compatible
    --save-wildcard,
    --save-exact
    --save-minimum
    --update-reuse
    --update-eager
    --update-all
    --pre
    --prerelease
    --unconstrained(-u)
    --dry-run
    --venv: string
    --skip(-k)
    --dev(-d)
    --group(-G): string@"nu-complete pdm current-groups"
    --no-sync
    --editable (-e)
    --no-editable
    --no-self
    --fail-fast(-x)
    --no-isolation
]

export extern "pdm use" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --skip(-k)
    --first(-f)
    --ignore-remembered(-i)
    --venv: string
    python?: string
]

export extern "pdm venv" [
    --verbose(-v)
    --global(-g)
    --project(-p): path
    --skip(-k)
    --first(-f)
    --ignore-remembered(-i)
    --venv: string
    --python: string
    command?: string@"nu-complete pdm venv-commands"
]

export extern "pdm venv create" [
    --verbose(-v)
    --force(-f)
    --name(-n): string
    --with-pip
    --with: string
    python: string
    ...venv_args: string
]

export extern "pdm venv list" [
    --verbose(-v)
]

export extern "pdm venv remove" [
    --verbose(-v)
    --yes(-y)
    env: string
]

export extern "pdm venv activate" [
    --verbose(-v)
    env: string
]

export extern "pdm venv purge" [
    --verbose(-v)
    --force(-f)
    --interactive(-i)
]