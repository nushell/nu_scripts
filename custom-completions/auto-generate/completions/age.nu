# encrypt
extern "age" [
	--encrypt(-e)					# encrypt
	--recipient(-r)					# public key
	--recipients-file(-R)					# file with public key(s)
	--armor(-a)					# PEM encode ciphertext
	--passphrase(-p)					# passphrase
	--decrypt(-d)					# decrypt
	--identity(-i)					# file with private key(s)
	--version					# print version number
	...args
]