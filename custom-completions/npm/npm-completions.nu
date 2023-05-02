def "nu-complete npm" [] {
  ^npm -l
  |lines
  |find 'Run "'
  |str trim
  |split column -c ' '
  |get column4
  |str replace '"' ''
}

export extern "npm" [
  command?: string@"nu-complete npm"
]

def "nu-complete npm run" [] {
  open ./package.json
  |get scripts
  |columns
}

export extern "npm run" [
  command?: string@"nu-complete npm run"
  --workspace(-w)
  --include-workspace-root
  --if-present
  --ignore-scripts
  --script-shell
]
