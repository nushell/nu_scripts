## show directory sizes in current directory starting from the largest
ls -d|where type == dir|sort-by size|reverse|format filesize GB size
