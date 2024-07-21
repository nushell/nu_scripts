# Documentation for get-col
# Written on 2021-03-28 06:58:50 by andras_io on discord
# Written for the new Nushell version on 03/31/2022 10:10 PM by denkspuren on discord
def get-col [
     col_index:int # A 0 indexed col_index
    ] {

    # meant to be used like `ls | get-col 1`
    let input = $in
    let name = ($input | columns | select $col_index | get 0)
    $input | select $name
}

# Documentation for get-col2
# Written on 2021-03-28 07:00:24 by johng on discord
# Written for the new Nushell version on 03/31/2022 10:10 PM by denkspuren on discord
def get-column [
     col_index:int # A 0 indexed col_index
    ] {

    # meant to be used like `ls | get-column 1`
    $in | transpose | select $col_index | transpose | select column1 | headers
}
