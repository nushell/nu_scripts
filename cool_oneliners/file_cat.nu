# Combine two files into one
# You can generate `a.json` with something like `range 1..5 | save a.json`
echo (open a.json) (open b.json) | save c.json
