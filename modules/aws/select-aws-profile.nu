# This alias lets you choose your aws environment variables with ease.
#
# Dependencies:
#   * fzf
#
# Installation:
#   1. store in ~/.config/nushell/select-aws-profile.nu
#   2. add to your config.nu: `use ~/.config/nushell/select-aws-profile.nu *`
#
# Usage:
#   select-aws-profile
export def --env main [] {
    hide AWS_REGION

    do {
        let creds = open ($env.HOME + "/.aws/credentials") | from toml
        let selected_profile = $creds
            | transpose name creds
            | get name
            | str join "\n"
            | fzf

        if $selected_profile != "" {
            let out = {
                AWS_PROFILE: $selected_profile,
                AWS_ACCESS_KEY_ID: ($creds | get $selected_profile | get "aws_access_key_id"),
                AWS_SECRET_ACCESS_KEY: ($creds | get $selected_profile | get "aws_secret_access_key"),
            }

            let region = ($creds | get $selected_profile | get -i "region")
            if $region != null {
                $out | insert AWS_REGION $region
            } else {
                $out
            }
        }
    } | load-env

    {
        AWS_PROFILE: $env.AWS_PROFILE,
        AWS_ACCESS_KEY_ID: $env.AWS_ACCESS_KEY_ID,
        AWS_SECRET_ACCESS_KEY: $env.AWS_SECRET_ACCESS_KEY,
        AWS_REGION: $env.AWS_REGION
    }
}
