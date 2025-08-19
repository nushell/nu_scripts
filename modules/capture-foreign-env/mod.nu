# Returns a record of changed env variables after running a non-nushell script's contents (passed via stdin), e.g. a bash script you want to "source"
export def main [
  --shell (-s): string = /bin/sh
  # The shell to run the script in
  # (has to support '-c' argument and POSIX 'env', 'echo', 'eval' commands)
  --arguments (-a): list<string> = []
  # Additional command line arguments to pass to the foreign shell
] {
  let script_contents = $in;
  let env_out = with-env { SCRIPT_TO_SOURCE: $script_contents } {
    ^$shell ...$arguments -c `
    env -0
    echo -n '<ENV_CAPTURE_EVAL_FENCE>'
    eval "$SCRIPT_TO_SOURCE"
    echo -n '<ENV_CAPTURE_EVAL_FENCE>'
    env -0 -u _ -u _AST_FEATURES -u SHLVL`
  }
  | split row '<ENV_CAPTURE_EVAL_FENCE>'
  | {
    before: ($in | first | str trim --char (char nul) | split row (char nul))
    after: ($in | last | str trim --char (char nul) | split row (char nul))
  }

  $env_out.after
  | where { |line| $line not-in $env_out.before }
  | parse "{key}={value}"
  | transpose --header-row --as-record
}
