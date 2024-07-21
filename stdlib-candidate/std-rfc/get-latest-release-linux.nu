# A small script to auto-update nushell in linux
# requires nushell 0.36.0 or greater
def get-latest-linux [] {
    # fetch the information about the latest release
    let metadata = (http get https://api.github.com/repos/nushell/nushell/releases/latest)
    let release_name = ($metadata | get name | split row ' ' | first)
    # get the body that shows information about this release
    let body = ($metadata | get body)
    # find the linux download
    let asset_info = ($metadata | get assets | where name =~ 'x86_64-linux-gnu-full.tar.gz' | first)
    # construct the url
    let download_url = ($asset_info | get browser_download_url)

    let file_name = ($asset_info | get name)
    # tell you what i'm doing
    print $"Release name is ($release_name)(char newline)(char newline)"
    print $"($body)(char newline)(char newline)Downloading and following redirects ..."
    # fetch follows redirects now
    http get $download_url | save $file_name
    # tell you what i'm doing
    print $"(char newline)Extracting ($file_name) to /tmp(char newline)"
    # extract the tar file to the temp folder
    tar -xf ($file_name) -C /tmp
    # parse the $file_name to get the folder
    # echo nu_0_31_0_linux.tar.gz | path parse | get stem | path parse | get stem
    # echo nu_0_31_0_linux.tar.gz | split column '.' | get Column1
    # now get the file name using the path commands. it was a little tricky because
    # there are two extensions .tar and .gz
    let root_file_name = ($file_name | path parse | get stem | path parse | get stem)
    # update our progress
    print $"Copying files from /tmp/($root_file_name)/*/* to ~/.cargo/bin(char newline)"
    # this is for testing so it doesn't overwrite my real nu. this should really
    # be a parameter
    mkdir release
    # construct the copy from and to paths
    let cp_from_path = $"/tmp/($root_file_name)/**/*"
    let cp_to_path = "./release"
    # actually run the cp command
    # we may want to make this overwrite and not prompt
    cp ($cp_from_path) ($cp_to_path)
    # exec ~/.cargo/bin/nu
    print $"Starting nushell(char nl)"
    exec ./release/nu
}
