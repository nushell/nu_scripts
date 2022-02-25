### Docker

This directory contains few simple scripts to simplify docker workflow in nushell

### Deployment

source the scripts in startup section of your `config.toml` file

### Usage
* docker.nu - Wrapper around regular docker command, returns a formatted nushell table
* compose.nu - Finds compose files of all running containers and then stops them via `docker-compose down`

### Notes
* Both commands assume the user is a mamber of `docker` group, if that is not the case prepend the commands with `sudo`

* docker.nu should be sourced before compose.nu in your `config.toml` file as the latter uses the former