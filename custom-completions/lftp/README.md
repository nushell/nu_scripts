# LFTP completions

[`LFTP`](https://lftp.yar.ru/) is a file transfer program supporting many protocols (FTP, HTTP, SFTP, FISH, TORRENT). It is shell-like, reliable and can transfer several files in parallel.

## Install completion script

### Method 1: Use from Git repo

- `git clone https://github.com/nushell/nu_scripts.git`

- Add this to `$nu.config-path` file.

  ```nu
  source repo/custom-completions/lftp/lftp-completions.nu
  ```

### Method 2: Selectively copy


- Copy the _lftp-completions.nu_ to Nu standard place.

  ```nu
  cp custom-completions/lftp/lftp-completions.nu ($nu.data-dir | path join 'completions')
  ```

- Open `$nu.config-path` file and add this:

  ```nu
  source lftp-completions.nu
  ```

