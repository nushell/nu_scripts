def look_for [word] {
  open sample_andres.json |
    flatten |
    flatten |
    insert comp {
        get shoes_name |
            split row " " |
            each --numbered {
        = [[idx, loc]; [$it.index, $(= $it.item | str index-of $word)]]
        }
    } |
    flatten |
    flatten |
    where comp.loc >= 0 |
    flatten |
    update idx { = $it.idx + 1 } |
    reject name price loc |
    rename nameWords targetWordIndex
}

look_for "leather" | to json --pretty 4
look_for "low-top" | to json --pretty 4