# Yadm

Yadm is a dot files manager that is written in Bash.
The code in this module reflects this fact.
The functions in this file are typed wrappers around yadm.

## Usage

To use this module make sure you have installed `yadm`.

Installing with basher.

```bash
basher install TheLocehiliosan/yadm
```

Installing yadm with curl in Nu Shell session.

```nu
curl -fLo /usr/local/bin/yadm https://github.com/TheLocehiliosan/yadm/raw/master/yadm ; chmod a+x /usr/local/bin/yadm
```

Then copy this folder to the folder where you place your nu scripts
Which is usually in `$"($nu.default-config-dir)"/modules`.

Then reference the folder by using the modules/yadm.nu.

```nu
 export module yadm
```

## Contributing

This module doesn't represent all of git's functionality.
Which means it doesn't allow you to do everything git can.
if there is something missing please submit a PR to this repo.
If you can help please checkout git completions for a reference.
