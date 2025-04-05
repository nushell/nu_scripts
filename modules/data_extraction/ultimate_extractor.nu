# Function to extract archives with different extensions.
export def extract [name:string] {
  let handlers = [ [extension command];
                   ['tar\.bz2|tbz|tbz2'     'tar xvjf']
                   ['tar\.gz|tgz'           'tar xvzf']
                   ['tar\.xz|txz'           'tar xvf']
                   ['tar\.Z'                'tar xvZf']
                   ['bz2'                   'bunzip2']
                   ['deb'                   'ar x']
                   ['gz'                    'gunzip']
                   ['pkg'                   'pkgutil --expand']
                   ['rar'                   'unrar x']
                   ['tar'                   'tar xvf']
                   ['xz'                    'xz --decompress']
                   ['zip|war|jar|nupkg|exe' 'unzip']
                   ['Z'                     'uncompress']
                   ['7z'                    '7za x']
                 ]
  let maybe_handler = ($handlers | where $name =~ $'\.(($it.extension))$')
  if ($maybe_handler | is-empty) {
    error make { msg: "unsupported file extension" }
  } else {
    let handler = ($maybe_handler | first)
    nu -c ($handler.command + ' ' + $name)
  }
}
