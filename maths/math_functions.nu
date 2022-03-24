#Root with a custom denominator
def root [ denominator, num ] {
	$num ** ( 1 / $denominator ) | math round  -p 10
}

#Cube root
def croot [num] {
	$num ** ( 1 / 3 ) | math round -p 10
}

#Root with a custom scaler and denominator
def aroot [ scaler, denominator, num] {
	$num ** ($scaler / $denominator) | math round -p 10
}

#calculate delta of the quadratic function
def delta [ a,#x^2 factor
b, #x factor
c #the rest
] {
	( $b ** 2 ) - ( 4 * $a * $c)
}

#Factorial of the given number
def fact [num: int] {
	if $num >= 0 {
		if $num < 2 {
			$num
		} else {
			seq 2 $num | math product
		}
	} else {
		echo 'Error: can only calculate non-negative integers'
	}
}
