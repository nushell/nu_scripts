#Function to extract archives with different extensions
export def extract [name:string #name of the archive to extract
] {
  let exten = [ [ex com];
                    ['.tar.bz2' 'tar xjf']
                    ['.tar.gz' 'tar xzf']
                    ['.bz2' 'bunzip2']
                    ['.rar' 'unrar x']
                    ['.tbz2' 'tar xjf']
                    ['.tgz' 'tar xzf']
                    ['.zip' 'unzip']
                    ['.7z' '/usr/bin/7z x']
                    ['.deb' 'ar x']
                    ['.tar.xz' 'tar xvf']
                    ['.tar.zst' 'tar xvf']
                    ['.tar' 'tar xvf']
                    ['.gz' 'gunzip']
                    ['.Z' 'uncompress']
                    ]

  let command = ($exten|where $name =~ $it.ex|first)
  if ($command|is-empty) {
    echo 'Error! Unsupported file extension'
  } else {
    nu -c ($command.com + ' ' + $name)
  }
}
