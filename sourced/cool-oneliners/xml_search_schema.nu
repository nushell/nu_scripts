# Search the WordprocessingML XML Schema definition file for a simple type by name
# You'll need the wml.xsd file.
# To get that file, first download the following zip:
# https://www.ecma-international.org/wp-content/uploads/ECMA-376-Fifth-Edition-Part-1-Fundamentals-And-Markup-Language-Reference.zip
# Then, unzip the contents of OfficeOpenXML-XMLSchema-Strict.zip.
open wml.xsd | from xml | get content | where tag == simpleType | flatten | where name =~ BrType | get content.content.0.attributes
