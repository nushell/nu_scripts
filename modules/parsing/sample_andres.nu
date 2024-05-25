def look_for [word] {
  open sample_andres.json |
    flatten |
    flatten |
    insert comp {
        get shoes_name |
            split row " " |
            enumerate | each {
        [[idx, loc]; [$in.index, ($in.item | str index-of $word)]]
        } | flatten
    } |
    flatten |
    where comp.loc >= 0 |
    flatten |
    update idx { $in + 1 } |
    reject name price loc |
    rename nameWords targetWordIndex
}

print (look_for "leather" | to json --indent 4)
print (look_for "low-top" | to json --indent 4)
