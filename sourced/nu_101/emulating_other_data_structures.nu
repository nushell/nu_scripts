# Some examples of how you can use nushell commands to treat lists like other data structures and perform equivalent data structure operations on them.

## Queue (first in, first out [FIFO])

let queue = [1 2 3]

let elem = 4

### Enqueue (push)

$queue | append $elem

### Dequeue (shift)

{ out: ($queue | first),
  new_queue: ($queue | skip 1) }

## Stack (last in, first out [LIFO])

### Push

$queue | append $elem

### Pop

{ out: ($queue | last),
  new_stack: ($queue | drop) }

## Set

# Ordered sets are similar to below, just taking more care of order when altering the sets since lists are already ordered.

let set = [1 2 3]

let elem = 4

let set_b = [2 3 4 5]

### Checking set membership

$elem in $set # false

2 in $set # true

### Inserting a new element

if $elem not-in $set { $set | append $elem }

# or

$set | append $elem | uniq

# Result: [1 2 3 4]

### Union

$set ++ $set_b | uniq

# Result: [1 2 3 4 5]

### Intersection

$set | where { |elem| $elem in $set_b }

# Result: [2 3]

### Difference

# $set - $set_b

$set | where { |elem| $elem not-in $set_b }

# or

# Result: [1]

### Symmetric Difference

$set ++ $set_b | uniq --unique

# Result: [1 4 5]

### Multiset (bag)

# Pretty much the same as a list but you can get the counts of the multiset elements with

[1 2 2 3] | uniq --count

# Result:
# ╭───┬───────┬───────╮
# │ # │ value │ count │
# ├───┼───────┼───────┤
# │ 0 │     1 │     1 │
# │ 1 │     2 │     2 │
# │ 2 │     3 │     1 │
# ╰───┴───────┴───────╯

# The unique values along with how many times they are in the multiset/bag.
