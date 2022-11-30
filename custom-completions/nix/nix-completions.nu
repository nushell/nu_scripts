def "nu-complete nix log-format" [] {
  ['raw', 'internal-json', 'bar', 'bar-with-logs']
}

#a tool for reproducible and declarative configuration management
export extern "nix" [
  --help    #Show usage information.
  --offline    #Disable substituters and consider all previously downloaded files up-to-date.
  --option    #Set the Nix configuration setting name to value (overriding nix.conf).
  --refresh    #Consider all previously downloaded files out-of-date.
  --version    #Show version information.
  --debug    #Set the logging verbosity level to 'debug'.
  --log-format: string@'nu-complete nix log-format'    #Set the format of log output; one of raw, internal-json, bar or bar-with-logs.
  --print-build-logs(-L)    #Print full build logs on standard error.
  --quiet    #Decrease the logging verbosity level.
  --verbose(-v)    #Increase the logging verbosity level.
  --accept-flake-config    #Enable the accept-flake-config setting.
  --access-tokens: string    #Set the access-tokens setting.
  --allow-dirty    #Enable the allow-dirty setting.
  --allow-import-from-derivation    #Enable the allow-import-from-derivation setting.
  --allow-new-privileges    #Enable the allow-new-privileges setting.
  --allow-symlinked-store    #Enable the allow-symlinked-store setting.
  --allow-unsafe-native-code-during-evaluation    #Enable the allow-unsafe-native-code-during-evaluation setting.
  --allowed-impure-host-deps: string    #Set the allowed-impure-host-deps setting.
  --allowed-uris: string    #Set the allowed-uris setting.
  --allowed-users: string    #Set the allowed-users setting.
  --auto-optimise-store    #Enable the auto-optimise-store setting.
  --bash-prompt: string    #Set the bash-prompt setting.
  --bash-prompt-suffix: string    #Set the bash-prompt-suffix setting.
  --build-hook: string    #Set the build-hook setting.
  --build-poll-interval: string    #Set the build-poll-interval setting.
  --build-users-group: string    #Set the build-users-group setting.
  --builders: string    #Set the builders setting.
  --builders-use-substitutes    #Enable the builders-use-substitutes setting.
  --commit-lockfile-summary: string    #Set the commit-lockfile-summary setting.
  --compress-build-log    #Enable the compress-build-log setting.
  --connect-timeout: string    #Set the connect-timeout setting.
  --cores: string    #Set the cores setting.
  --diff-hook: string    #Set the diff-hook setting.
  --download-attempts: string    #Set the download-attempts setting.
  --enforce-determinism    #Enable the enforce-determinism setting.
  --eval-cache    #Enable the eval-cache setting.
  --experimental-features: string    #Set the experimental-features setting.
  --extra-access-tokens: string    #Append to the access-tokens setting.
  --extra-allowed-impure-host-deps: string    #Append to the allowed-impure-host-deps setting.
  --extra-allowed-uris: string    #Append to the allowed-uris setting.
  --extra-allowed-users: string    #Append to the allowed-users setting.
  --extra-experimental-features: string    #Append to the experimental-features setting.
  --extra-extra-platforms: string    #Append to the extra-platforms setting.
  --extra-hashed-mirrors: string    #Append to the hashed-mirrors setting.
  --extra-ignored-acls: string    #Append to the ignored-acls setting.
  --extra-nix-path: string    #Append to the nix-path setting.
  --extra-platforms: string    #Set the extra-platforms setting.
  --extra-plugin-files: string    #Append to the plugin-files setting.
  --extra-sandbox-paths: string    #Append to the sandbox-paths setting.
  --extra-secret-key-files: string    #Append to the secret-key-files setting.
  --extra-substituters: string    #Append to the substituters setting.
  --extra-system-features: string    #Append to the system-features setting.
  --extra-trusted-public-keys: string    #Append to the trusted-public-keys setting.
  --extra-trusted-substituters: string    #Append to the trusted-substituters setting.
  --extra-trusted-users: string    #Append to the trusted-users setting.
  --fallback    #Enable the fallback setting.
  --filter-syscalls    #Enable the filter-syscalls setting.
  --flake-registry: string    #Set the flake-registry setting.
  --fsync-metadata    #Enable the fsync-metadata setting.
  --gc-reserved-space: string    #Set the gc-reserved-space setting.
  --hashed-mirrors: string    #Set the hashed-mirrors setting.
  --http-connections: string    #Set the http-connections setting.
  --http2    #Enable the http2 setting.
  --ignored-acls: string    #Set the ignored-acls setting.
  --impersonate-linux-26    #Enable the impersonate-linux-26 setting.
  --keep-build-log    #Enable the keep-build-log setting.
  --keep-derivations    #Enable the keep-derivations setting.
  --keep-env-derivations    #Enable the keep-env-derivations setting.
  --keep-failed    #Enable the keep-failed setting.
  --keep-going    #Enable the keep-going setting.
  --keep-outputs    #Enable the keep-outputs setting.
  --log-lines: string    #Set the log-lines setting.
  --max-build-log-size: string    #Set the max-build-log-size setting.
  --max-free: string    #Set the max-free setting.
  --max-jobs: string    #Set the max-jobs setting.
  --max-silent-time: string    #Set the max-silent-time setting.
  --min-free: string    #Set the min-free setting.
  --min-free-check-interval: string    #Set the min-free-check-interval setting.
  --nar-buffer-size: string    #Set the nar-buffer-size setting.
  --narinfo-cache-negative-ttl: string    #Set the narinfo-cache-negative-ttl setting.
  --narinfo-cache-positive-ttl: string    #Set the narinfo-cache-positive-ttl setting.
  --netrc-file: string    #Set the netrc-file setting.
  --nix-path: string    #Set the nix-path setting.
  --no-accept-flake-config    #Disable the accept-flake-config setting.
  --no-allow-dirty    #Disable the allow-dirty setting.
  --no-allow-import-from-derivation    #Disable the allow-import-from-derivation setting.
  --no-allow-new-privileges    #Disable the allow-new-privileges setting.
  --no-allow-symlinked-store    #Disable the allow-symlinked-store setting.
  --no-allow-unsafe-native-code-during-evaluation    #Disable the allow-unsafe-native-code-during-evaluation setting.
  --no-auto-optimise-store    #Disable the auto-optimise-store setting.
  --no-builders-use-substitutes    #Disable the builders-use-substitutes setting.
  --no-compress-build-log    #Disable the compress-build-log setting.
  --no-enforce-determinism    #Disable the enforce-determinism setting.
  --no-eval-cache    #Disable the eval-cache setting.
  --no-fallback    #Disable the fallback setting.
  --no-filter-syscalls    #Disable the filter-syscalls setting.
  --no-fsync-metadata    #Disable the fsync-metadata setting.
  --no-http2    #Disable the http2 setting.
  --no-impersonate-linux-26    #Disable the impersonate-linux-26 setting.
  --no-keep-build-log    #Disable the keep-build-log setting.
  --no-keep-derivations    #Disable the keep-derivations setting.
  --no-keep-env-derivations    #Disable the keep-env-derivations setting.
  --no-keep-failed    #Disable the keep-failed setting.
  --no-keep-going    #Disable the keep-going setting.
  --no-keep-outputs    #Disable the keep-outputs setting.
  --no-preallocate-contents    #Disable the preallocate-contents setting.
  --no-print-missing    #Disable the print-missing setting.
  --no-pure-eval    #Disable the pure-eval setting.
  --no-require-sigs    #Disable the require-sigs setting.
  --no-restrict-eval    #Disable the restrict-eval setting.
  --no-run-diff-hook    #Disable the run-diff-hook setting.
  --no-sandbox    #Disable sandboxing.
  --no-sandbox-fallback    #Disable the sandbox-fallback setting.
  --no-show-trace    #Disable the show-trace setting.
  --no-substitute    #Disable the substitute setting.
  --no-sync-before-registering    #Disable the sync-before-registering setting.
  --no-trace-function-calls    #Disable the trace-function-calls setting.
  --no-use-case-hack    #Disable the use-case-hack setting.
  --no-use-registries    #Disable the use-registries setting.
  --no-use-sqlite-wal    #Disable the use-sqlite-wal setting.
  --no-warn-dirty    #Disable the warn-dirty setting.
  --plugin-files: string    #Set the plugin-files setting.
  --post-build-hook: string    #Set the post-build-hook setting.
  --pre-build-hook: string    #Set the pre-build-hook setting.
  --preallocate-contents    #Enable the preallocate-contents setting.
  --print-missing    #Enable the print-missing setting.
  --pure-eval    #Enable the pure-eval setting.
  --relaxed-sandbox    #Enable sandboxing, but allow builds to disable it.
  --repeat: string    #Set the repeat setting.
  --require-sigs    #Enable the require-sigs setting.
  --restrict-eval    #Enable the restrict-eval setting.
  --run-diff-hook    #Enable the run-diff-hook setting.
  --sandbox    #Enable sandboxing.
  --sandbox-build-dir: string    #Set the sandbox-build-dir setting.
  --sandbox-dev-shm-size: string    #Set the sandbox-dev-shm-size setting.
  --sandbox-fallback    #Enable the sandbox-fallback setting.
  --sandbox-paths: string    #Set the sandbox-paths setting.
  --secret-key-files: string    #Set the secret-key-files setting.
  --show-trace    #Enable the show-trace setting.
  --stalled-download-timeout: string    #Set the stalled-download-timeout setting.
  --store: string    #Set the store setting.
  --substitute    #Enable the substitute setting.
  --substituters: string    #Set the substituters setting.
  --sync-before-registering    #Enable the sync-before-registering setting.
  --system: string    #Set the system setting.
  --system-features: string    #Set the system-features setting.
  --tarball-ttl: string    #Set the tarball-ttl setting.
  --timeout: string    #Set the timeout setting.
  --trace-function-calls    #Enable the trace-function-calls setting.
  --trusted-public-keys: string    #Set the trusted-public-keys setting.
  --trusted-substituters: string    #Set the trusted-substituters setting.
  --trusted-users: string    #Set the trusted-users setting.
  --use-case-hack    #Enable the use-case-hack setting.
  --use-registries    #Enable the use-registries setting.
  --use-sqlite-wal    #Enable the use-sqlite-wal setting.
  --user-agent-suffix: string    #Set the user-agent-suffix setting.
  --warn-dirty    #Enable the warn-dirty setting.
  ...args: any
]

#build a derivation or fetch a store path
export extern "nix build" [
  --dry-run    #Show what this command would do without doing it.
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --no-link    #Do not create symlinks to the build results.
  --out-link(-o)    #path
  --profile    #The profile to update.
  --rebuild    #Rebuild an already built package and compare the result to the existing store paths.
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#run a bash shell that provides the build environment of a derivation
export extern "nix develop" [
  --build    #Run the build phase.
  --check    #Run the check phase.
  --command(-c)    #command args
  --configure    #Run the configure phase.
  --ignore-environment(-i)    #Clear the entire environment (except those specified with --keep).
  --install    #Run the install phase.
  --installcheck    #Run the installcheck phase.
  --keep(-k)    #name
  --phase    #The stdenv phase to run (e.g. build or configure).
  --profile    #The profile to update.
  --redirect    #Redirect a store path to a mutable location.
  --unpack    #Run the unpack phase.
  --unset(-u)    #name
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#manage Nix flakes
export extern "nix flake" [
  ...args: any                              # Arguments to be passed to your program
]

#copy a flake and all its inputs to a store
export extern "nix flake archive" [
  --dry-run    #Show what this command would do without doing it.
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --to    #URI of the destination Nix store
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  ...args: any                              # Arguments to be passed to your program
]

#check whether the flake evaluates and run its tests
export extern "nix flake check" [
  --no-build    #Do not build checks. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  ...args: any                              # Arguments to be passed to your program
]

#clone flake repository
export extern "nix flake clone" [
  --dest(-f)    #path
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  ...args: any                              # Arguments to be passed to your program
]

#show flake metadata
export extern "nix flake info" [
  --json    #Produce output in JSON format, suitable for consumption by another program. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  ...args: any                              # Arguments to be passed to your program
]

#create a flake in the current directory from a template
export extern "nix flake init" [
  --template(-t)    #template
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  ...args: any                              # Arguments to be passed to your program
]

#create missing lock file entries
export extern "nix flake lock" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  ...args: any                              # Arguments to be passed to your program
]

#show flake metadata
export extern "nix flake metadata" [
  --json    #Produce output in JSON format, suitable for consumption by another program. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  ...args: any                              # Arguments to be passed to your program
]

#create a flake in the specified directory from a template
export extern "nix flake new" [
  --template(-t)    #template
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  ...args: any                              # Arguments to be passed to your program
]

#download the source tree denoted by a flake reference into the Nix
export extern "nix flake prefetch" [
  --json    #Produce output in JSON format, suitable for consumption by another program. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  ...args: any                              # Arguments to be passed to your program
]

#show the outputs provided by a flake
export extern "nix flake show" [
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --legacy    #Show the contents of the legacyPackages output.
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  ...args: any                              # Arguments to be passed to your program
]

#update flake lock file 
export extern "nix flake update" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  ...args: any                              # Arguments to be passed to your program
]

#show help about nix or a particular subcommand
export extern "nix help" [
  ...args: any                              # Arguments to be passed to your program
]

#manage Nix profiles
export extern "nix profile" [
  ...args: any                              # Arguments to be passed to your program
]

#show the closure difference between each version of a profile
export extern "nix profile diff-closures" [
  --profile    #The profile to update.
  ...args: any                              # Arguments to be passed to your program
]

#show all versions of a profile
export extern "nix profile history" [
  --profile    #The profile to update. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  ...args: any                              # Arguments to be passed to your program
]

#install a package into a profile
export extern "nix profile install" [
  --profile    #The profile to update. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#list installed packages
export extern "nix profile list" [
  --profile    #The profile to update. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  ...args: any                              # Arguments to be passed to your program
]

#remove packages from a profile
export extern "nix profile remove" [
  --profile    #The profile to update. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  ...args: any                              # Arguments to be passed to your program
]

#roll back to the previous version or a specified version of a
export extern "nix profile rollback" [
  --dry-run    #Show what this command would do without doing it.
  --profile    #The profile to update.
  --to    #The profile version to roll back to.
  ...args: any                              # Arguments to be passed to your program
]

#upgrade packages using their most recent flake
export extern "nix profile upgrade" [
  --profile    #The profile to update. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#delete non-current versions of a profile 
export extern "nix profile wipe-history" [
  --dry-run    #Show what this command would do without doing it.
  --older-than    #Delete versions older than the specified age. age must be in the format Nd, where N denotes
  --profile    #The profile to update.
  ...args: any                              # Arguments to be passed to your program
]

#start an interactive environment for evaluating Nix expressions
export extern "nix repl" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  ...args: any                              # Arguments to be passed to your program
]

#run a Nix application
export extern "nix run" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#search for packages
export extern "nix search" [
  --json    #Produce output in JSON format, suitable for consumption by another program. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#run a shell in which the specified packages are available 
export extern "nix shell" [
  --command(-c)    #command args
  --ignore-environment(-i)    #Clear the entire environment (except those specified with --keep).
  --keep(-k)    #name
  --unset(-u)    #name
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#bundle an application so that it works outside of the Nix store
export extern "nix bundle" [
  --bundler    #Use a custom bundler instead of the default (github:NixOS/bundlers).
  --out-link(-o)    #path
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#copy paths between Nix stores
export extern "nix copy" [
  --from    #URL of the source Nix store.
  --no-check-sigs    #Do not require that paths are signed by trusted keys.
  --substitute-on-destination(-s)    #Whether to try substitutes on the destination store (only supported by SSH stores).
  --to    #URL of the destination Nix store.
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --no-recursive    #Apply operation to specified paths only.
  ...args: any                              # Arguments to be passed to your program
]

#open the Nix expression of a Nix package in $EDITOR
export extern "nix edit" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#evaluate a Nix expression
export extern "nix eval" [
  --apply    #Apply the function expr to each argument.
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --raw    #Print strings without quotes or escaping.
  --read-only    #Do not instantiate each evaluated derivation. This improves performance, but can cause
  --write-to    #Write a string or attrset of strings to path.
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#reformat your code in the standard style
export extern "nix fmt" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#show the build log of the specified packages or paths, if available
export extern "nix log" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#query information about store paths
export extern "nix path-info" [
  --closure-size(-S)    #Print the sum of the sizes of the NAR serialisations of the closure of each path.
  --human-readable(-h)    #With -s and -S, print sizes in a human-friendly format such as 5.67G.
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --sigs    #Show signatures.
  --size(-s)    #Print the size of the NAR serialisation of each path.
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --recursive(-r)    #Apply operation to closure of the specified paths.
  ...args: any                              # Arguments to be passed to your program
]

#manage the flake registry
export extern "nix registry" [
  ...args: any                              # Arguments to be passed to your program
]

#add/replace flake in user flake registry
export extern "nix registry add" [
  --registry    #The registry to operate on. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  ...args: any                              # Arguments to be passed to your program
]

#list available Nix flakes
export extern "nix registry list" [
  ...args: any                              # Arguments to be passed to your program
]

#pin a flake to its current version or to the current version of a flake
export extern "nix registry pin" [
  --registry    #The registry to operate on. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  ...args: any                              # Arguments to be passed to your program
]

#remove flake from user flake registry 
export extern "nix registry remove" [
  --registry    #The registry to operate on.
  ...args: any                              # Arguments to be passed to your program
]

#show why a package has another package in its closure 
export extern "nix why-depends" [
  --all(-a)    #Show all edges in the dependency graph leading from package to dependency, rather than just
  --precise    #For each edge in the dependency graph, show the files in the parent that cause the
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#daemon to perform store operations on behalf of non-root clients
export extern "nix daemon" [
  ...args: any                              # Arguments to be passed to your program
]

#show registered store types and their available options
export extern "nix describe-stores" [
  --json    #Produce output in JSON format, suitable for consumption by another program.
  ...args: any                              # Arguments to be passed to your program
]

#compute and convert cryptographic hashes
export extern "nix hash" [
  ...args: any                              # Arguments to be passed to your program
]

#print cryptographic hash of a regular file
export extern "nix hash file" [
  --base16    #Print the hash in base-16 format.
  --base32    #Print the hash in base-32 (Nix-specific) format.
  --base64    #Print the hash in base-64 format.
  --sri    #Print the hash in SRI format.
  --type    #hash algorithm ('md5', 'sha1', 'sha256', or 'sha512')
  ...args: any                              # Arguments to be passed to your program
]

#print cryptographic hash of the NAR serialisation of a path
export extern "nix hash path" [
  --base16    #Print the hash in base-16 format.
  --base32    #Print the hash in base-32 (Nix-specific) format.
  --base64    #Print the hash in base-64 format.
  --sri    #Print the hash in SRI format.
  --type    #hash algorithm ('md5', 'sha1', 'sha256', or 'sha512')
  ...args: any                              # Arguments to be passed to your program
]

#convert a hash to base-16 representation
export extern "nix hash to-base16" [
  --type    #hash algorithm ('md5', 'sha1', 'sha256', or 'sha512'). Optional as can also be gotten from
  ...args: any                              # Arguments to be passed to your program
]

#convert a hash to base-32 representation
export extern "nix hash to-base32" [
  --type    #hash algorithm ('md5', 'sha1', 'sha256', or 'sha512'). Optional as can also be gotten from
  ...args: any                              # Arguments to be passed to your program
]

#convert a hash to base-64 representation
export extern "nix hash to-base64" [
  --type    #hash algorithm ('md5', 'sha1', 'sha256', or 'sha512'). Optional as can also be gotten from
  ...args: any                              # Arguments to be passed to your program
]

#convert a hash to SRI representation
export extern "nix hash to-sri" [
  --type    #hash algorithm ('md5', 'sha1', 'sha256', or 'sha512'). Optional as can also be gotten from
  ...args: any                              # Arguments to be passed to your program
]

#generate and convert Nix signing keys
export extern "nix key" [
  ...args: any                              # Arguments to be passed to your program
]

#generate a public key for verifying store paths from a
export extern "nix key convert-secret-to-public" [
  ...args: any                              # Arguments to be passed to your program
]

#generate a secret key for signing store paths
export extern "nix key generate-secret" [
  --key-name    #Identifier of the key (e.g. cache.example.org-1).
  ...args: any                              # Arguments to be passed to your program
]

#create or inspect NAR files
export extern "nix nar" [
  ...args: any                              # Arguments to be passed to your program
]

#print the contents of a file inside a NAR file on stdout
export extern "nix nar cat" [
  ...args: any                              # Arguments to be passed to your program
]

#serialise a path to stdout in NAR format
export extern "nix nar dump-path" [
  ...args: any                              # Arguments to be passed to your program
]

#show information about a path inside a NAR file 
export extern "nix nar ls" [
  --directory(-d)    #Show directories rather than their contents.
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --long(-l)    #Show detailed file information.
  --recursive(-R)    #List subdirectories recursively.
  ...args: any                              # Arguments to be passed to your program
]

#print shell code that can be sourced by bash to reproduce the build
export extern "nix print-dev-env" [
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --profile    #The profile to update.
  --redirect    #Redirect a store path to a mutable location.
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#manipulate a Nix realisation
export extern "nix realisation" [
  ...args: any                              # Arguments to be passed to your program
]

#query information about one or several realisations
export extern "nix realisation info" [
  --json    #Produce output in JSON format, suitable for consumption by another program. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --recursive(-r)    #Apply operation to closure of the specified paths.
  ...args: any                              # Arguments to be passed to your program
]

#show the Nix configuration
export extern "nix show-config" [
  --json    #Produce output in JSON format, suitable for consumption by another program.
  ...args: any                              # Arguments to be passed to your program
]

#show the contents of a store derivation
export extern "nix show-derivation" [
  --recursive(-r)    #Include the dependencies of the specified derivations. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#manipulate a Nix store 
export extern "nix store" [
  ...args: any                              # Arguments to be passed to your program
]

#add a regular file to the Nix store
export extern "nix store add-file" [
  --dry-run    #Show what this command would do without doing it.
  --name(-n)    #name
  ...args: any                              # Arguments to be passed to your program
]

#add a path to the Nix store
export extern "nix store add-path" [
  --dry-run    #Show what this command would do without doing it.
  --name(-n)    #name
  ...args: any                              # Arguments to be passed to your program
]

#print the contents of a file in the Nix store on stdout
export extern "nix store cat" [
  ...args: any                              # Arguments to be passed to your program
]

#copy store path signatures from substituters
export extern "nix store copy-sigs" [
  --substituter(-s)    #store-uri
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --recursive(-r)    #Apply operation to closure of the specified paths.
  ...args: any                              # Arguments to be passed to your program
]

#delete paths from the Nix store
export extern "nix store delete" [
  --ignore-liveness    #Do not check whether the paths are reachable from a root. 
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --recursive(-r)    #Apply operation to closure of the specified paths.
  ...args: any                              # Arguments to be passed to your program
]

#show what packages and versions were added and removed between
export extern "nix store diff-closures" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#serialise a store path to stdout in NAR format
export extern "nix store dump-path" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --recursive(-r)    #Apply operation to closure of the specified paths.
  ...args: any                              # Arguments to be passed to your program
]

#perform garbage collection on a Nix store
export extern "nix store gc" [
  --dry-run    #Show what this command would do without doing it.
  --max    #Stop after freeing n bytes of disk space.
  ...args: any                              # Arguments to be passed to your program
]

#show information about a path in the Nix store
export extern "nix store ls" [
  --directory(-d)    #Show directories rather than their contents.
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --long(-l)    #Show detailed file information.
  --recursive(-R)    #List subdirectories recursively.
  ...args: any                              # Arguments to be passed to your program
]

#rewrite a path or closure to content-addressed form
export extern "nix store make-content-addressed" [
  --from    #URL of the source Nix store.
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --to    #URL of the destination Nix store.
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --recursive(-r)    #Apply operation to closure of the specified paths.
  ...args: any                              # Arguments to be passed to your program
]

#replace identical files in the store by hard links
export extern "nix store optimise" [
  ...args: any                              # Arguments to be passed to your program
]

#test whether a store can be accessed
export extern "nix store ping" [
  ...args: any                              # Arguments to be passed to your program
]

#download a file into the Nix store
export extern "nix store prefetch-file" [
  --executable    #Make the resulting file executable. Note that this causes the resulting hash to be a NAR
  --expected-hash    #The expected hash of the file.
  --hash-type    #hash algorithm ('md5', 'sha1', 'sha256', or 'sha512')
  --json    #Produce output in JSON format, suitable for consumption by another program.
  --name    #Override the name component of the resulting store path. It defaults to the base name of 
  ...args: any                              # Arguments to be passed to your program
]

#repair store paths
export extern "nix store repair" [
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --recursive(-r)    #Apply operation to closure of the specified paths.
  ...args: any                              # Arguments to be passed to your program
]

#sign store paths
export extern "nix store sign" [
  --key-file(-k)    #file
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --recursive(-r)    #Apply operation to closure of the specified paths.
  ...args: any                              # Arguments to be passed to your program
]

#verify the integrity of store paths 
export extern "nix store verify" [
  --no-contents    #Do not verify the contents of each store path.
  --no-trust    #Do not verify whether each store path is trusted.
  --sigs-needed(-n)    #n
  --substituter(-s)    #store-uri
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --all    #Apply the operation to every store path.
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  --recursive(-r)    #Apply operation to closure of the specified paths.
  ...args: any                              # Arguments to be passed to your program
]

#copy build logs between Nix stores
export extern "nix store copy-log" [
  --from    #URL of the source Nix store.
  --to    #URL of the destination Nix store.
  --arg    #Pass the value expr as the argument name to Nix functions.
  --argstr    #Pass the string string as the argument name to Nix functions.
  --eval-store    #The Nix store to use for evaluations.
  --impure    #Allow access to mutable paths and repositories.
  --include(-I)    #path
  --override-flake    #Override the flake registries, redirecting original-ref to resolved-ref.
  --commit-lock-file    #Commit changes to the flake's lock file.
  --inputs-from    #Use the inputs of the specified flake as registry entries.
  --no-registries    #Don't allow lookups in the flake registries. This option is deprecated; use 
  --no-update-lock-file    #Do not allow any updates to the flake's lock file.
  --no-write-lock-file    #Do not write the flake's newly generated lock file.
  --override-input    #Override a specific flake input (e.g. dwarffs/nixpkgs). This implies --no-write-lock-file.
  --recreate-lock-file    #Recreate the flake's lock file from scratch.
  --update-input    #Update a specific flake input (ignoring its previous entry in the lock file).
  --derivation    #Operate on the store derivation rather than its outputs.
  --expr    #Interpret installables as attribute paths relative to the Nix expression expr.
  --file(-f)    #file
  ...args: any                              # Arguments to be passed to your program
]

#check your system for potential problems and print a PASS or FAIL for each
export extern "nix doctor" [
  ...args: any                              # Arguments to be passed to your program
]

#upgrade Nix to the latest stable version 
export extern "nix upgrade-nix" [
  --dry-run    #Show what this command would do without doing it.
  --nix-store-paths-url    #The URL of the file that contains the store paths of the latest Nix release.
  --profile(-p)    #profile-dir
  ...args: any                              # Arguments to be passed to your program
]
