#!/usr/bin/nu
#
# BE CAREFUL WITH ROOTS MADE ON BIG NUMBERS (10 digits and more) — the result is rounded so you may get wrong result.
# just modify the round -p or calculate it manually

#Root with a custom denominator
def root [ denominator: number, num: number ] {
	$num ** ( 1 / $denominator ) | math round  -p 10
}

#Cube root
def croot [num: number] {
	$num ** ( 1 / 3 ) | math round -p 10
}

#Root with a custom scaler and denominator
def aroot [ scaler: number, denominator: number, num: number ] {
	$num ** ($scaler / $denominator) | math round -p 10
}

#calculate delta of the quadratic function
def delta [ a: number,#x^2 factor
b: number, #x factor
c: number #the rest
] {
	( $b ** 2 ) - ( 4 * $a * $c)
}

#Factorial of the given number
def fact [num: int] {
	if $num >= 0 { if $num < 2 {$num} {seq 2 $num | math product} } { echo 'Error: can only calculate non-negative integers'}
}

