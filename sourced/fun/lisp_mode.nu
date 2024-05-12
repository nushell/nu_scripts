# Note: this requires the latest 0.32.1 or later
#
# usage:
# > source lisp_mode.nu
# > (echo (+ 1 (* 3 2)))

def "+" [x, y] { $x + $y }

def "-" [x, y] { $x - $y }

def "*" [x, y] { $x * $y }

def "/" [x, y] { $x / $y }

def in [x, y] { $x in $y }

def not-in [x, y] { $x not-in $y}

def "<" [x, y] { $x < $y }

def "<=" [x, y] { $x <= $y }

def ">" [x, y] { $x > $y }

def ">=" [x, y] { $x >= $y }

def "==" [x, y] { $x == $y }

def "!=" [x, y] { $x != $y }

def "=~" [x, y] { $x =~ $y }

def "!~" [x, y] { $x !~ $y }

def array [...rest] { echo $rest }

