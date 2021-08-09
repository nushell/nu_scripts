## show directory sizes in current directory starting from the largest
ls|where type == Dir|each {du $it.name}|sort-by apparent|reverse|format filesize apparent GB
