# Do not cache authentication tokens
extern "svn" [
	--no-auth-cache					# Do not cache authentication tokens
	--non-interactive					# Do no interactive prompting
	--trust-server-cert					# Accept SSL server certificates from unknown authorities (only with --non-interactive)
	...args
]