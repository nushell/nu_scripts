# duplicates example
use mod.nu *

let info = "[{name: "John", lastname: "Doe"}, {name: "John", lastname: "Roe"}, {name: "Jane", lastname: "Soe"}]"
print ($info | from json)
print ($info | from json | duplicates name)

#duplicates files example
echo A | save A.txt
echo A | save B.txt 
# note that if I used "echo B | save B.txt" the function will give a false positive
echo ABC | save C.txt
print (ls)
print (duplicates files)
rm A.txt B.txt C.txt --permanent
