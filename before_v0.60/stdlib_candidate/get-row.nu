# This is a wrapper to get a row
def get-row [
    row_num:int # A 0 indexed row
    ] {

    nth $row_num | table -n $row_num
}