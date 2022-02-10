# Combine two files into one

def create_files [] {
  [0,1,2,3] | range 0..3 | save a.json
  [4,5,6,7] | range 0..3 | save b.json
}

create_files
echo (open a.json) (open b.json) | save c.json
open c.json | flatten
rm a.json b.json c.json
