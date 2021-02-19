# A small script to auto-update nushell in linux
# WIP - Not finished yet
def get-latest [] {
    let metadata = $(fetch https://api.github.com/repos/nushell/nushell/releases/latest)
    let release_name = $(echo $metadata | get name | split row ' ' | nth 0)
    let body = $(echo $metadata | get body)
    let asset_info = $(echo $metadata | get assets | where name =~ 'linux.tar.gz')
    let download_url = $(echo $asset_info | get browser_download_url)
    let file_name = $(echo $asset_info | get name)
    echo $(build-string "Release name is " $release_name $(char newline) $(char newline))
    echo $(build-string $body $(char newline) $(char newline) "Downloading...")
    let redirected_url = $(fetch $download_url --raw)
    let real_download_url = $(echo $redirected_url | xpath '//@href' | get '//@href')
    fetch $real_download_url | save $file_name
    # Remaining to do
    # tar xf $file_name
    # parse the $file_name to get the folder like going
    # from: nu_0_27_0_linux.tar.gz
    # to: nu_0_27_0_linux
    # cp nu_0_27_0_linux/nushell-0.27.0/* ~/.cargo/bin
    # exec ~/.cargo/bin/nu
}