# setup a hook that will log startup times
#
# # Example
# ```nushell
# $env.config.hooks.env_change.PWD = (
#     $env.config.hooks.env_change.PWD | append (
#         use nu-hooks/startup-times.nu;
#         startup-times setup
#     )
# )
# ```
export def setup [
    dir: path = $nu.data-dir, # the path where to store the "startup times" file
]: [ nothing -> closure ] {
    {|before, _|
        if $before == null {
            let file = $dir | path join "startup-times.nuon"
            if not ($file | path exists) {
                mkdir ($file | path dirname)
                touch $file
            }

            let version = (version)

            # NOTE: this binding is required as per
            # https://github.com/nushell/nushell/pull/12601#issuecomment-2069167555
            let startup_times = open $file | append {
                date: (date now)
                time: $nu.startup-time
                build: $version.build_rust_channel
                allocator: $version.allocator
                version: $version.version
                commit: $version.commit_hash
                build_time: $version.build_time
            }
            $startup_times | save --force $file
        }
    }
}
