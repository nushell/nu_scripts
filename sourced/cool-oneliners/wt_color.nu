# Simple script that sets color of a windows terminal (https://github.com/microsoft/terminal).
def set-tab-color [idx: int] { ansi -e ( ["2;15;", ($idx | into string), (",|") ] | str join ) }
