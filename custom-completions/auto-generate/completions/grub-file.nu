# Check if FILE can be booted as i386 PAE Xen unprivileged guest kernel
extern "grub-file" [
	--is-i386-xen-pae-domu					# Check if FILE can be booted as i386 PAE Xen unprivileged guest kernel
	--is-x86					# Check if given file can be booted as x86_64 Xen unprivileged guest kernel
	--is-x86-xen-dom0					# Check if given file can be used as Xen x86 privileged guest kernel
	--is-x86-multiboot					# Check if given file can be used as x86 multiboot kernel
	--is-x86-multiboot2					# Check if given file can be used as x86 multiboot2 kernel
	--is-arm-linux					# Check if given file is ARM Linux
	--is-arm64-linux					# Check if given file is ARM64 Linux
	--is-ia64-linux					# Check if given file is IA64 Linux
	--is-mips-linux					# Check if given file is MIPS Linux
	--is-mipsel-linux					# Check if given file is MIPSEL Linux
	--is-sparc64-linux					# Check if given file is SPARC64 Linux
	--is-powerpc-linux					# Check if given file is POWERPC Linux
	--is-x86-linux					# Check if given file is x86 Linux
	--is-x86-linux32					# Check if given file is x86 Linux supporting 32-bit protocol
	--is-x86-kfreebsd					# Check if given file is x86 kFreeBSD
	--is-i386-kfreebsd					# Check if given file is i386 kFreeBSD
	--is-x86					# Check if given file is x86_64 kFreeBSD
	--is-x86-knetbsd					# Check if given file is x86 kNetBSD
	--is-i386-knetbsd					# Check if given file is i386 kNetBSD
	--is-x86					# Check if given file is x86_64 kNetBSD
	--is-i386-efi					# Check if given file is i386 EFI file
	--is-x86					# Check if given file is x86_64 EFI file
	--is-ia64-efi					# Check if given file is IA64 EFI file
	--is-arm64-efi					# Check if given file is ARM64 EFI file
	--is-arm-efi					# Check if given file is ARM EFI file
	--is-hibernated-hiberfil					# Check if given file is hiberfil.sys in hibernated state
	--is-x86					# Check if given file is x86_64 XNU (Mac OS X kernel)
	--is-i386-xnu					# Check if given file is i386 XNU (Mac OS X kernel)
	--is-xnu-hibr					# Check if given file is XNU (Mac OS X kernel) hibernated image
	--is-x86-bios-bootsector					# Check if given file is BIOS bootsector
	--help(-h)					# Display help and exit
	--usage(-u)					# Display usage and exit
	...args
]