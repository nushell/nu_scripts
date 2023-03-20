# Runs C code via GCC without leaving a file behind
def rcc [ 
  file: path # The file to run
] {
  # Remove exe if still exists
  rm $"($file).exe" --permanent --force
  # Compile code to exe
  ^gcc ("." | path join $file | path expand) -o ("." | path join $"($file).exe" | path expand)
  # Execute exe
  ^$"($file).exe"
  # Remove exe
  rm $"($file).exe" --permanent --force
}

# Runs C++ code via g++ without leaving a file behind
def r++ [
  file: path # The file to run 
] {
  # Remove exe if still exists
  rm $"($file).exe" --permanent --force
  # Compile code to exe
  ^g++ ("." | path join $file | path expand) -o ("." | path join $"($file).exe" | path expand)
  # Execute exe
  ^$"($file).exe"
  # Remove exe
  rm $"($file).exe" --permanent --force
}
