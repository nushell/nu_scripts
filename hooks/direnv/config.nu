## To enable direnv in nushell we must run code in the context of the current shell - i.e it cannot be within a block and it needs to run as a "code" string as per https://github.com/nushell/nushell/pull/5982 (so you must run nushell 0.66 or later). That way it works as if you'd typed in and run the code directly in your shell.
## Direnv knows what to do otherwise and will export the env to load (or unload) based on what is in your current environment so this is all that is needed with some checks for empty strings, defaulting then to an empty table so that load-env is always happy.

let-env config = {
  hooks: {
    pre_prompt: [{
      code: "
        let direnv = (direnv export json | from json)
        let direnv = if ($direnv | length) == 1 { $direnv } else { {} }
        $direnv | load-env
      "
    }]
  }
}
