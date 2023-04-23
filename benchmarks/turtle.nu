# The infamous turtle benchmark
def turtle [column: string] {
    wrap $column | table
}

print $"Turtle 1 = ('turtle' | turtle '1' | str length)"
print $"Turtle 2 = ('turtle' | turtle '1' | turtle '2' | str length)"
print $"Turtle 3 = ('turtle' | turtle '1' | turtle '2' | turtle '3' | str length)"
print $"Turtle 4 = ('turtle' | turtle '1' | turtle '2' | turtle '3' | turtle '4' | str length)"
print $"Turtle 5 = ('turtle' | turtle '1' | turtle '2' | turtle '3' | turtle '4' | turtle '5' | str length)"