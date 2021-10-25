#As in the file name, the script is designed to conveniently handle any archive format

#usage: extract archive_name

def extract [name:string] {
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
  if ($command|empty?) {
    echo 'Error! Unsupported file extension'
  } {
    nu -c (build-string $command.com ' ' $name)
  }
}
