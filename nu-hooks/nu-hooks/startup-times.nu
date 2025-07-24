alias startup-times = main

# A hook for logging startup times
@example "Setting it up is simple, calling the command adds the hook automatically" { startup-times }
@example "Setting it up with a custom path" {
    $env.config.hooks.pre_prompt ++= (startup-times "~/startup-times.tsv")
}
export def --env main [
    file: path = ($nu.data-dir | path join "startup-times.tsv"), # the file to log the startup times
]: nothing -> nothing {
    $env.config.hooks.pre_prompt = [
        {
            remove: true
            code: {
                let version = (version)
                let times = {
                    date: (date now)
                    time: $nu.startup-time
                    build: $version.build_rust_channel
                    allocator: $version.allocator
                    version: $version.version
                    commit: $version.commit_hash
                    build_time: $version.build_time
                }

                if not ($file | path exists) {
                    mkdir ($file | path dirname)
                    $times | to tsv | save $file
                } else {
                    $times | to tsv --noheaders | save --append $file
                }

                # Remove self
                $env.config.hooks.pre_prompt = $env.config.hooks.pre_prompt
                | where not (try { $it.remove == true } catch { false })
            }
        }
    ]
}
