## show directory sizes in current directory starting from the largest
ls -d|where type == Dir|sort-by size|reverse|format filesize apparent GB
