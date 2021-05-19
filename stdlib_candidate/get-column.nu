# Documentation for get-col
# Written on 2021-03-28 06:58:50 by andras_io on discord
def get-col [
     col_index:int # A 0 indexed col_index
    ] {

    # meant to be used like `ls | get-col 1`
    # ls | select (ls | get | nth 2)

    each {
        echo $it | select (echo $it | get | nth $col_index)
    }
}

# Documentation for get-col2
# Written on 2021-03-28 07:00:24 by johng on discord
def get-column [
     col_index:int # A 0 indexed col_index
    ] {

    # meant to be used like `ls | get-column 1`
    pivot | nth $col_index | pivot | get Column1 | skip
}

# another working example is
# ls | keep 2 | drop column 3