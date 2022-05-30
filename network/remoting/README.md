# Remoting
This module provide convenient way to manage multiple remote clients.

## Prerequisites
* Both `ssh` and `ssh script` require ssh to be installed on the host
* `ssh script` requires nushell to be installed on the client
* `ssh` can work both with and without nushell installed on the client however having it installed enables more sophisticated interaction between host and clients
* `wake` requires wakeonlan to be installed on the host and clients to be configured to accept Wake on Lan magic packets

## `ssh` function
This function serves as a wrapper around standard ssh command. 

Function accepts following arguments:
* name - Name of the client as specified in the config. This parameter is required (autocompletion enabled)
* args - command to run on the client. If not provided ssh starts an interactive session with the client. If provided and specified client has nushell configured output will be returned as nushell table on the host allowing further parsing. If provided and specified client does not have nushell configured output will be passed back as is
## `ssh script` function
This function executes a nushell script on a client that has nushell configured.

Function accepts following arguments:
* name - Name of the client as specified in the config. This parameter is required (autocompletion enabled)
* script - Name of the script to be executed on the client. This parameter is required The script must be available in current scope in order to be used (autocompletion enabled)
* args - Arguments to be passed to the script. Named parameters should be put in quotes to avoid parsing errors like this: `ssh script my-host my-script '--arg value'`

## `wake` function
This function wakes specified clients via Wake on Lan.

Function accepts following arguments:
* names - Name of clients to be woken up as specified in the config. (autocompletion enabled)


## Config
Client config is kept within (non-exported) `hosts` function as a list of records. Each record should contain following fields:

| Parameter | Is required?                           | Usage                        | Type   |
|-----------|----------------------------------------|------------------------------|--------|
| name      | Required                               | DNS name of the client       | string |
| domain    | Either domain or IP must be specified  | DNS domain of the client     | string |
| ip        | Either domain or IP must be specified  | IP address of the client     | string |
| username  | Required                               | Username used for connection | string |
| port      | Required                               | SSH port                     | int    |
| mac       | Required only for `wake`               | MAC address of the client    | string |
| nu        | Required                               | Whether nushell is installed | bool   |

Example configuration records:
* {name: 'host1', domain: 'nushell.sh', ip: '', username: 'username', port: 22, mac: 'AA:BB:CC:DD:EE;FF', nu: false} 
* {name: 'host2', domain: '', ip: '192.168.0.1', username: 'username', port: 2222, mac: '', nu: true}
