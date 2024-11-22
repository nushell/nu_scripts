# Botmaker-CLI

The [Botmaker-cli](https://www.npmjs.com/package/@botmaker.org/botmaker-cli) comes from
a package in NPM `@botmaker.org/botmaker-cli` and it's intended to interact with
bots created in the botmaker web platform.
This CLI can:

- run client actions
- download the code of a bot (with the import token)
- upload the code from the local to the remote
- set the customer variables (impersonate other user variables in the local env)
- show a status of the client actions
- create a new client action
- and rename an existing client action

This `bmc` module particularly adds the completions for the [nushell](nushell.sh/) shell

## How to install

1- Install nushell in your computer
2- Download the file in this folder `bmc-completions.nu`.
3- Edit your `config.nu` to source that file in this folder.

```nu
source ~/your/location/to/bmc-completions.nu
```

4- Restart your shell and you should be good to go!
