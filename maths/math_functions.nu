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
		error make {msg: "can only calculate non-negative integers"}
	}
}

### Added by kira
## constants
let pi = 3.1415926535897932
let e  = 2.7182818284590452

#Calculate roots of the quadratic function: ax^2+bx+x
def q_roots [
	a 	# x^2
	b	# x
	c 	# independent term
] {
	let d = $b ** 2 - 4 * $a * $c
	if $d > 0 {
		let s = ($d | math sqrt)
		let r1 = (($s - $b) / (2 * $a))
		let r2 = (0 - (($s + $b) / (2 * $a)))

		echo $"root #1: ($r1)"
		echo $"root #2: ($r2)"
	} else if $d == 0 {
		let s = ($d | math sqrt)
		let r = (($s - $b) / (2 * $a))

		echo $"root:   ($r)"
	} else {
		let s = ((0 - $d) | math sqrt)
		let r = ((0 - $b) / (2 * $a))
		let i = ($s / (2 * $a))

		echo $"root #1: ($r) + ($i)*i"
		echo $"root #2: ($r) - ($i)*i"
	}
}

#Check if integer is prime
def isprime [n: int] {
	let max = ($n | math sqrt | math ceil)

	let flag = ([[isPrime];[true]] | update isPrime {if ($n mod 2) == 0 { false } else { seq 3 1 $max | each { |it| if ($n mod $it) == 0 { false }}}})

	if ($flag.isPrime.0 | empty?) { echo 'prime' } else { echo 'not prime' }
}

#Prime list <= n
def primelist [n: int] {
	let primes = [2 3]

	let primes2 = (seq 5 2 $n | each {|it| if (isprime $it) == 'prime' {$it}})

	$primes | append $primes2
}

#Multiplication table of n till max
def mtable [n: int, max: int] {
	seq 1 $max | each {|it| echo $"($it)*($n) = ($n * $it)"}
}

#Check if year is leap
def isleap [year: int] {
	if ( (($year mod 4) == 0 && ($year mod 100) != 0) || ($year mod 400) == 0 ) { echo "It is a leap year." } else { echo "It is not a leap year."}
}

#Greatest common divisior (gcd) between 2 integers
def gcd [a: int, b:int] {
	if $a < $b {
		gcd $b $a
	} else if $b == 0 {
		$a
	} else {
		gcd $b ($a mod $b)
	}
}

#Least common multiple (lcm) between 2 integers
def lcm [a: int, b:int] {
	if $a == $b && $b == 0 {
		0
	} else {
		$a * ($b / (gcd $a $b))
	}
}

#Decimal number to custom base representation
def dec2base [
	n: string	#decimal number
	b: string	#base in [2,16]
] {
	let base = if ( ($b | into int) < 2 || ($b | into int) > 16 ) {
		echo "Wrong base, it must be an integer between 2 and 16"
		10
	} else {
		$b | into int
	}

	let number = ($n | into int)

	let chars = ['0' '1' '2' '3' '4' '5' '6' '7' '8' '9' 'A' 'B' 'C' 'D' 'E' 'F']

	if $number == 0 {
		''
	} else {
		let newNumber = (($number - ($number mod $base)) / $base)

		[(dec2base $newNumber $base) ($chars | get ($number mod $base))] | str collect
	}
}

# Scale list to [a,b] interval
def scale-minmax [a, b,input?] {
	let x = if ($input | empty?) {$in} else {$input}

	let min = ($x | math min)
	let max = ($x | math max)

	$x | each {|it| ((($it - $min) / ($max - $min)) * ($b - $a) + $a) }
}

# Scale every column of a table (separately) to [a,b] interval
def scale-minmax-table [a, b,input?] {
	let x = if ($input | empty?) {$in} else {$input}
	let n_cols = ($x | transpose | length)
	let name_cols = ($x | transpose | column2 0)

	for $i in 0..($n_cols - 1) {
		($x | column2 $i) | scale-minmax $a $b | wrap ($name_cols | get $i)
	} | reduce {|it, acc| $acc | merge {$it}}
}

#sin function
def "math sin" [ ] {
    each {|x| "s(" + $"($x)" + ")\n" | bc -l | into decimal }
}

#cos function
def "math cos" [ ] {
    each {|x| "c(" + $"($x)" + ")\n" | bc -l | into decimal }
}

#natural log function
def "math ln" [ ] {
    each {|x| "l(" + $"($x)" + ")\n" | bc -l | into decimal }
}

#exp function
def "math exp" [ ] {
    each {|x| "e(" + $"($x)" + ")\n" | bc -l | into decimal }
}
