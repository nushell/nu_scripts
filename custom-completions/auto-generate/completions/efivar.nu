# List current variables
extern "efivar" [
	--list(-l)					# List current variables
	--print(-p)					# Print variable specified by --name
	--dmpstore(-D)					# Use DMPSTORE format when exporting
	--print-decimal(-d)					# Print variable in decimal format values
	--name(-n)					# Variable to manipulate
	--append(-a)					# Append to variable specified by --name
	--list-guids(-L)					# Show internal guid list
	--write(-w)					# Write to variable specified by --name
	--help(-?)					# Show help message
	--usage					# Display brief usage message
	...args
]