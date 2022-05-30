# Use config file to generate the ramdisk
extern "mkinitcpio" [
	--config(-c)					# Use config file to generate the ramdisk
	--generatedir(-d)					# Set directory as the location where the initramfs is built
	--generate(-g)					# Generate a CPIO image as filename
	--preset(-p)					# Build initramfs image(s) according to specified preset
	--moduleroot(-r)					# Specifies the root directory to find modules in
	--save(-s)					# Saves the build directory for the initial ramdisk
	--builddir(-t)					# Use tmpdir as the temporary build directory instead of /tmp
	--version(-V)					# Display version information
	--verbose(-v)					# Verbose output
	--compress(-z)					# Override the compression method with the compress program
	...args
]