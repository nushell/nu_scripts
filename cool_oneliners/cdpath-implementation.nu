#!/usr/bin/nu

#I actually use it as a part of my startup, so I'm not really sure how to pack it, yet I'd like to contribute
#NOTE: it does *not* work with 0 arguments. To get $cd functionality, use $cd. To use cdpath, use $c
#Written by skelly37

startup = [
	"let cdpath = [. /data /data/it /data/games]", 
	"def c [dir] { let wd = (pwd); for element in $cdpath {if (pwd) == $wd {cd $element; for directory in (ls -a | select name type | each { if $it.type == Dir {echo $it.name} {} }  ) {if $dir == $directory {cd $dir} {}}; if (pwd) == $element {cd $wd} {}} {}}; if (pwd) == $wd {cd $wd; echo \"No such path!\"} {}}",
]
