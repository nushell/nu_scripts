# SSH completions

A Nushell extern definition and completers for the ssh command.

This module provides extern definitions for most of the ssh command options and flags.

## Usage

Simply import the extern definitions with

```nu
source path/to/ssh-completions.nu
```

This script will parse `/etc/ssh/ssh_config` and `~/.ssh/config` to fetch SSH config hosts.

Given the following config:

```
Host my-ip
    HostName 192.168.50.237
Host mydomain
    HostName mydomain.example.com
Host no.hostname
    ProxyCommand ssh -q -W %h:%p office
Host my-domain-2
    HostName mydomain-2.example.com
Host my_domain_3
    HostName mydomain_3.example.com
```


When you press the tab key, it will display:

```
❯ | ssh
my-ip             192.168.50.237
mydomain          mydomain.example.com
no.hostname
my-domain-2       mydomain-2.example.com
my_domain_3       mydomain_3.example.com

```