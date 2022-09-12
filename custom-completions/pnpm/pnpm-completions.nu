export extern "pnpm" [
  command?: string@"nu-complete pnpm"
  --version(-v)
  --help(-h)
]
def "nu-complete pnpm" [] {
  ^pnpm
  | lines
  | drop nth (0..4)
  | where -b {|$it| $it !~ '^\s{20,}' && $it !~ '^\w+'}
  | each { str trim }
  | parse -r '^(?:(?<shortcmd>\w+),)?\s*(?<cmd>\w+-?\s?\w*)'
  | get shortcmd cmd
  | flatten
  | each {str trim}
  | where {|$it| $it != ''}
}

def "nu-complete pnpm run" [] {
  open ./package.json
  |get scripts
  |columns
}

export extern "pnpm run" [
  command: string@"nu-complete pnpm run"
  --parallel
  --recursive(-r)
  --no-color
  --stream
  --aggregate-output
  --filter(-F)
]