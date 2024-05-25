# Git Scripts

### Definition

These scripts should be used to demonstrate how combine the power of nushell with git commands.

### Aliases
If you find some of these scripts useful you can add them as aliases in your git config file.

For instance you can create a nushell script in your computer and define in your git config file an alias that call that script:
```
[alias]
    bcl = !nu \"D:\\Tools\\gitalias_bcl.nu\"
```