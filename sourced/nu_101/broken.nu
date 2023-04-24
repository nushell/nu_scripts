### These examples are here to show the user
### How the parser works by showing examples that will not parse
### The beginning nushell script writer / user may get confused
### as to why their script is not working
###
### If you uncomment any of the defs below these are
### the error messages you will see
#
#
#
### Examples p1 - p3 below elucidate the following idea:
### That a brace has to be on the same line as the def
###
###
### Error: nu::parser::missing_positional
### The error message is: "Missing required positional argument"
### missing block
###
### help: Usage: def <def_name> <params> <block>
###
#
### https://github.com/nushell/nushell/issues/2972
#
### All of these examples will not parse.

### def p1 [arg]
### { echo $arg }

### def p2 [arg]
### {
### echo $arg }

### def p3 [arg]
### {
### echo $arg
### }

### This breaks because you need a space between
### between foo and the left bracket
### def foo[] {
###  "bar"
### }
### This works
### def foo [] {
### "bar"
### }
