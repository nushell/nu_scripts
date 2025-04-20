# 
extern "systemd-cryptenroll" [
	--password					# Enroll a regular password
	--recovery-key					# Enroll an auto-generated recovery key
	--pkcs11-token-uri					# Enroll a PKCS#11 security token or smartcard
	--fido2-device					# Enroll a FIDO2 security token
	--fido2-with-client-pin					# Require to enter a PIN when unlocking the volume
	--fido2-with-user-presence					# Require to verify presence when unlocking the volume
	--fido2-with-user-verification					# Require user verification when unlocking the volume
	--tpm2-device					# Enroll a TPM2 security chip
	--wipe-slot					# Wipes one or more LUKS2 key slots
	--help(-h)					# Print a short help
	--version					# Print a short version string
	...args
]