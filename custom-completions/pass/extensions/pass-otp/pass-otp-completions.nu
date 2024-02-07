use ../../nu-complete "nu-complete pass-files"

# Prompt for and insert a new OTP key.
export extern "pass otp insert" [
  name?: string@"nu-complete pass-files" # The name of the password entry to insert the OTP key into. If not provided, the URI label is used.
  --force(-f) # Do not prompt before overwriting an existing URI.
  --echo(-e) # Echo the input.
  --secret(-s) # Prompt for the OTP secret, assuming SHA1 algorithm, 30-second period, and 6 OTP digits. If set, one of --issuer or --account is also required. If not set, prompt for a key URI.
  --issuer(-i): string # The issuer of the OTP key.
  --account(-a): string # The account the OTP key belongs to.
]

# Appends an OTP key URI to an existing password file.
export extern "pass otp append" [
  name: string@"nu-complete pass-files" # The name of the password entry to insert the OTP key into.
  --force(-f) # Do not prompt before overwriting an existing URI.
  --echo(-e) # Echo the input.
  --secret(-s) # Prompt for the OTP secret, assuming SHA1 algorithm, 30-second period, and 6 OTP digits. If set, one of --issuer or --account is also required. If not set, prompt for a key URI.
  --issuer(-i): string # The issuer of the OTP key.
  --account(-a): string # The account the OTP key belongs to.
]

# Display the key URI stored in the given password entry.
export extern "pass otp uri" [
  name: string@"nu-complete pass-files" # The name of the password entry.
  --clip(-c) # Put the URI on the clipboard.
  --qrcode(-q) # Output the URI as a QR code.
]

# Test if the given URI is a valid OTP key URI.
export extern "pass otp validate" [
  uri: string # The URI to validate.
]

# Generate an OTP code.
export extern "pass otp" [
  name: string@"nu-complete pass-files" # The name of the password entry containing the OTP secret.
  --clip(-c) # Put the OTP code on the clipboard and clear it after 45 seconds.
]

export alias "pass otp code" = pass otp
