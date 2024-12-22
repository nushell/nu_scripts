# Recursion : Scripts to help with recursive calls in custom commands

## Manifest

- tramp.nu : Module for using the trampoline pattern
- countdown.nu : Simple countdowner that uses the tramp module
- even-odd.nu : Example of a mutually recursive pair of functions that use  tramp
- gcd.nu: Recursive example of Euclid's greatest common divisor algorithm
- fact.nu : Factorial calculation that uses tramp module
- fib.nu: Fibonacci's  recursive algorithm that uses the tramp module
- merge.nu: Recursive merge sort
- tree.nu: Recursively applies closure to every node in any input, structured or scalar

## The Trampoline pattern

Currently, Nu does not support Tail Call Optimization (TCO), so, using
recursion in your custom commands might cause a stack overflow panic. In versions
previous  to 1.0 (and maybe after that) this error is non-recoverable.
With TCO, if implemented in Nu, this problem would be avoidable if recursive
custom commands  were written using either Accumulator Passing Style (APS) or
Continuation Passing Style. (CPS) This is because in both of these styles
the recursive case  is now physically in the tail position of the function body.
IOW, it is the last thing  that happens before the function exits. and the
compiler can rewrite it to just be a jump, making an essentially a normal loop.

However, their is a technique call the Trampoline pattern which can be used to
overcome the limitation in languages like Nu that lack TCO.

If you already have your recursive case in the tail position you can wrap
this call in a thunk.
(A thunk  is merely a closure of 0 arguments)

The trampoline is a function that takes a recursive function that has been
"thunkified" in the above manner and iterates over it until it reaches the base
case in which it just returns the last result.


## Example usage

```nu
use tramp.nu 
# Compute the factorial of a number
# This version just returns either the value or a thunk.
# Meant to be used in a trampoline
# But still uses APS
def fact [n: int, acc=1]: nothing -> int {
  if $n <= 1 { return $acc } else {
    {|| fact ($n - 1) ($n * $acc) } # The thunk being returned to the trampoline
  }
}
```


Now use it:

```nu
source fact.nu
tramp recurse (fact 19)
121645100408832000
```


Note: factorial here will blowup with values of n larger than 20 due to operator
overload errors not a stack overflow.

## Provided examples

### countdown.nu

This function takes a value and then simply countdowns to 0 recursively.

```nu
use tramp.nu
source countdown.nu
tramp recurse (countdown 100000000)
0
```

Note, this might take some time to compute with large values of n.

### even-odd.nu

This pair of functions: even and odd,  will return true if the passed in number
is either  even or odd respectively. It does this by mutually recursively calling
its partner until a base case is reached.

The logic is that a number is odd if it is 0 else if it not (odd ($n - 2)).
A number is odd if it is 1 or not 0 otherwise if it is not (even ($n - 2))

E.g. Say we pass 4 to even.
It is not 0, therefore call odd (4 -2) or 2. and then invert that result.
Odd asks if the number (2) is 1, it is not, so call even (2 -2 or 0 and invert that result.
Even knows that 0 is even so it hits the base case and returns true.
Odd returns false, the inverse of true.
The previous call to even then inverts this false result and returns true.
Thus, even 4 is true.

## Example usage

```nu
use tramp.nu
source even-odd.nu
tramp recurse (odd 1234567)
false
```



Be aware that this method of computing  either an even or odd truth actually
will take about 1/2 the number of steps as the passed in initial value. even
will be called 1/4th of the number of the initial value and odd will
be called the other 1/4th of the times.
Thus, large values of  n might take some seconds.


## Tips and Caveats

Currently, in versions of Nushell less than 1.0 or about, writing normal
recursive functions that use stack depths of less than 700 will be Ok.
For larger values that might cause the stack to overflow modifying the structure
of the function could result in lower space complexity, especially with regard
to the stack.

### Using Accumulator Passing Style

The goal of restructuring functions to pass a growing accumulator is to move
the recursive call to the tail call position. If the language  supports
tail call optimization, then that is all that is required. For other languages,
you can use the trampolining method described here. Essentially, you do:

1. Restructure to APS
2. Wrap the recursive call, now in the tail position, in a thun, a no arg closure.
3. (Possibly) wrap the call to the trampoline function in another function.

### Accumulator Passing Style APS

1. Add a default final parameter to the function signature.
2. Give the accumulator the base value as the default value
3. Return  the accumulator in the base case instead of the normal base value.
4. Invert the actual step in the tail position to compute the accumulator
5. Move the recursive call to the tail position.

Using the example of factorial above, we can see the sub tree of the AST as
consisting of:



In step 1, we do

```nu
def fact-aps [n: int, acc: int=1] {
```

Note that, in multiplication recurrances, 1 is the identity value.
This comes up again and again in recursive functions.



In steps 3 - 5, we invert the AST subtree to compute the accumulator
as we make deeper and deeper recursive calls. In many cases, we use the passed
in value of the previous accumulator in the further computation.

E.g. for factorial:

```nu
# the recursive call
  } else {
    fact ($n - 1) ($n * $acc)
  }
```


For factorial, as the stack grows taller, the values of $n reduce more and more
to the base case. The values of $acc grow larger until the base case is
reached, in which the $acc value is returned.
and the stack unwinds returning the accumulator computed value.



Again, this does nothing to reduce stack growth, unless TCO is involved.
In that case, the  stack only grows by 2 stack frames max.

### Adding the Thunk



The final step to use the Trampoline pattern is to wrap the final call in
the recursive case in a thunk.  So, either your new function will return
its computed accumulator
 or a closure that stores the next step to be performed. In some languages
this last action can be performed by the language itself or by some AST or macro
steps.

## Double recursion

For some algorithms, the recursion stack grows geometrically, e.g. by a factor
of 2 each time. Two such functions are Fibonacci and merge sort. Every
recursive call results in 2 additional recursive calls.

Fibonacci can be turned into APS via a sliding  double accumulator.
And once converted, it can be thunkified for trampoline purposes. See the file fib.nu
for an example.

However, merge sort cannot so easily be converted into APS.
This is because it has a growing ever deeper binary tree until it reaches
its many base cases upon which it does all of its work (merging) as it collapses this
tree.
 It does not, therefore have anywhere to gather intermediate  results in a 
accumulator. 

It should be possible, however, to use CPS or continuation passing style
to move calls into the tail position. This is left as an exercise for the reader.
It seems pointless, to the author at least to even attempt in Nu because
Nushell already has perfectly acceptable sort commands.
