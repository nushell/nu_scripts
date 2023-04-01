#Root with a custom denominator
export def root [ denominator, num ] {
	$num ** ( 1 / $denominator ) | math round  -p 10
}

#Cube root
export def croot [num] {
	$num ** ( 1 / 3 ) | math round -p 10
}

#Root with a custom scaler and denominator
export def aroot [ scaler, denominator, num] {
	$num ** ($scaler / $denominator) | math round -p 10
}

#calculate delta of the quadratic function
export def delta [ a,#x^2 factor
b, #x factor
c #the rest
] {
	( $b ** 2 ) - ( 4 * $a * $c)
}

#Factorial of the given number
export def fact [num: int] {
	if $num >= 0 {
		if $num < 2 {
			$num
		} else {
			seq 2 $num | math product
		}
	} else {
		error make -u {msg: "can only calculate non-negative integers"}
	}
}

#Calculate roots of the quadratic function: ax^2+bx+x
export def q_roots [
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
export def isprime [n: int] {
	let max = ($n | math sqrt | math ceil)

	let flag = ([[isPrime];[true]] | update isPrime {if ($n mod 2) == 0 { false } else { seq 3 1 $max | each { |it| if ($n mod $it) == 0 { false }}}})

	if ($flag.isPrime.0 | is-empty) { echo 'prime' } else { echo 'not prime' }
}

#Prime list <= n
export def primelist [n: int] {
	let primes = [2 3]

	let primes2 = (seq 5 2 $n | each {|it| if (isprime $it) == 'prime' {$it}})

	$primes | append $primes2
}

#Multiplication table of n till max
export def mtable [n: int, max: int] {
	seq 1 $max | each {|it| echo $"($it)*($n) = ($n * $it)"}
}

#Check if year is leap
export def isleap [year: int] {
	if ( (($year mod 4) == 0 and ($year mod 100) != 0) or ($year mod 400) == 0 ) { echo "It is a leap year." } else { echo "It is not a leap year."}
}

#Greatest common divisior (gcd) between 2 integers
export def gcd [a: int, b:int] {
	if $a < $b {
		gcd $b $a
	} else if $b == 0 {
		$a
	} else {
		gcd $b ($a mod $b)
	}
}

#Least common multiple (lcm) between 2 integers
export def lcm [a: int, b:int] {
	if $a == $b and $b == 0 {
		0
	} else {
		$a * ($b / (gcd $a $b))
	}
}

#Decimal number to custom base representation
export def dec2base [
	n: string	#decimal number
	b: string	#base in [2,16]
] {
	let base = if ( ($b | into int) < 2 or ($b | into int) > 16 ) {
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
export def scale-minmax [a, b,input?] {
	let x = if ($input | is-empty) {$in} else {$input}

	let min = ($x | math min)
	let max = ($x | math max)

	$x | each {|it| ((($it - $min) / ($max - $min)) * ($b - $a) + $a) }
}

# Scale every column of a table (separately) to [a,b] interval
export def scale-minmax-table [a, b,input?] {
	let x = if ($input | is-empty) {$in} else {$input}
	let n_cols = ($x | transpose | length)
	let name_cols = ($x | transpose | column2 0)

	0..($n_cols - 1)
	| each {|i|
		($x | column2 $i) | scale-minmax $a $b | wrap ($name_cols | get $i)
	} | reduce {|it, acc| $acc | merge {$it}}
}
