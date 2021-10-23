#!/usr/bin/nu

# (sqrt skipped because of math module from nushell)

# cube root
def croot [num: number] {
	$num ** ( 1 / 3 ) | math round
}

# root with custom denominator, e.g. 2 ** 1/4
def root [ denominator: number, num: number ] {
	$num ** ( 1 / $denominator ) | math round
}

# totally custom root, e.g. 2 ** 3/8
def aroot [ scaler: number, denominator: number, num: number ] {
	$num ** ($scaler / $denominator) | math round
}

#discriminant of a quadratic equation
def delta [ a: number, b: number, c: number ] {
	( $b | math sqrt ) - ( 4 * $a * $c)
}

#TODO:
# -sin, cos, tan table for 0-90 degrees
# -radians to degrees and reversed
# -sin, cos, tan, ctg, sec, cosec functions
