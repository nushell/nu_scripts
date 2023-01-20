# Enums from https://bitwarden.com/help/cli/#enums

# Two-step login methods
#
# Used to specify which two-step login method to use when logging in
def "nu-complete bw login-methods" [] {
  [Authenticator, Email, YubiKey]
}

# Item types
#
# Used with the create command to specify a vault item type
def "nu-complete bw item-types" [] {
  [Login, "Secure Note", Card, Identity]
}

# Login URI match types
#
# Used with the create and edit command to specify URI match detection behavior for a login item
def "nu-complete bw uri-match-types" [] {
  [Domain, Host, "Starts With", Exact, "Regular Expressions", Never]
}

# Field types
#
# Used with the create and edit commands to configure custom fields
def "nu-complete bw field-types" [] {
  [Text, Hidden, Boolean]
}

# Organization user types
#
# Indicates a user's type
def "nu-complete bw organization-user-types" [] {
  [Owner, Admin, User, Manager]
}

# Organization user statuses
#
# Indicates a user's status within the organization
def "nu-complete bw organization-user-statuses" [] {
  [Owner, Admin, User, Manager]
}

# Config settings
#
# Supported settings
def "nu-complete bw config-settings" [] {
  [{ value: "server", description: "On-premises hosted installation URL." }]
}

# bw list supported object values
def "nu-complete bw list-valid-objects" [] {
  [items, folders, collections, org-collections, org-members,
   organizations]
}

# bw get supported object values
def "nu-complete bw get-valid-objects" [] {
  [item, username, password, uri, totp, notes, exposed, attachment,
   folder, collection, org-collection, organization, template,
   fingerprint, send]
}

# bw create supported object values
def "nu-complete bw create-valid-objects" [] {
  [item, attachment, folder, org-collection]
}

# bw edit supported object values
def "nu-complete bw edit-valid-objects" [] {
  [item, item-collections, folder, org-collection]
}

# bw restore supported object values
def "nu-complete bw restore-valid-objects" [] {
  [item]
}

# bw confirm supported object values
def "nu-complete bw confirm-valid-objects" [] {
  ["org-member"]
}

# bw send template supported object values
def "nu-complete bw send template-valid-objects" [] {
  ["send.text", "send.file"]
}

# bw export supported object values
def "nu-complete bw export-valid-objects" [] {
  [csv, json, and encrypted_json]
}

# bw confirm supported object values
#
# TODO(zoechi): https://community.bitwarden.com/t/bw-import-formats-should-not-require-a-login/49266
# This has multiple issues:
# - If not logged in, the completion would need to ask for the password first
# - Because there are two optional arguments, Nu doesn't show completions either
def "nu-complete bw import-formats" [] {
  ^bw import --formats
}

# bw send command supported values
def "nu-complete bw send-commands" [] {
  [list, template, get, receive, create, edit, remove-password, delete]
}

# Chose environment variable
def "nu-complete bw env-vars" [] {
  $env | columns
}

# Bitwarden command line client
#
#
# Examples:
#
#   bw login
#   bw lock
#   bw unlock myPassword321
#   bw list --help
#   bw list items --search google
#   bw get item 99ee88d2-6046-4ea7-92c2-acac464b1412
#   bw get password google.com
#   echo '{"name":"My Folder"}' | bw encode
#   bw create folder eyJuYW1lIjoiTXkgRm9sZGVyIn0K
#   bw edit folder c7c7b60b-9c61-40f2-8ccd-36c49595ed72 eyJuYW1lIjoiTXkgRm9sZGVyMiJ9Cg==
#   bw delete item 99ee88d2-6046-4ea7-92c2-acac464b1412
#   bw generate -lusn --length 18
#   bw config server https://bitwarden.example.com
#   bw send -f ./file.ext
#   bw send "text to send"
#   echo "text to send" | bw send
#   bw receive https://vault.bitwarden.com/#/send/rg3iuoS_Akm2gqy6ADRHmg/Ht7dYjsqjmgqUM3rjzZDSQ
export extern "bw" [
  --pretty                       # Format output. JSON is tabbed with two spaces.
  --raw                          # Return raw output instead of a descriptive message.
  --response                     # Return a JSON formatted version of response output.
  --cleanexit                    # Exit with a success exit code (0) unless an error is thrown.
  --quiet                        # Don't return anything to stdout.
  --nointeraction                # Do not prompt for interactive user input.
  --session: string              # Pass session key instead of reading from env.
  --version(-v)                  # output the version number
  --help(-h)                     # display help for command
]

# Log into a user account.
#
#
# Notes:
#
#   See docs for valid `method` enum values.
#
#   Pass `--raw` option to only return the session key.
#
# Examples:
#
#   bw login
#   bw login john@example.com myPassword321 --raw
#   bw login john@example.com myPassword321 --method 1 --code 249213
#   bw login --sso
export extern "bw login" [
  --method: string@"nu-complete bw login-methods"  # Two-step login method.
  --code: int                    # Two-step login code.
  --sso                          # Log in with Single-Sign On.
  --apikey                       # Log in with an Api Key.
  --passwordenv: string@"nu-complete bw env-vars"  # Environment variable storing your password
  --passwordfile: path         # Path to a file containing your password as its first line
  --check                        # Check login status.
  --raw                          # Pass `--raw` option to only return the session key.

  email?: string
  password?: string
]

# Log out of the current user account.
#
#
# Examples:
#
#   bw logout
export extern "bw logout" [
  --help(-h)                     # display help for command
]

# Lock the vault and destroy active session keys.
#
#
# Examples:
#
#   bw lock
export extern "bw lock" [
  --help(-h)                     # display help for command
]

# Unlock the vault and return a new session key.
#
#
# Notes:
#
#   After unlocking, any previous session keys will no longer be valid.
#
#   Pass `--raw` option to only return the session key.
#
# Examples:
#
#   bw unlock
#   bw unlock myPassword321
#   bw unlock myPassword321 --raw
export extern "bw unlock" [
  --check                        # Check lock status.
  --passwordenv: string@"nu-complete bw env-vars"  # Environment variable storing your password
  --passwordfile: path         # Path to a file containing your password as its first line
  --help(-h)                     # display help for command
]

# Pull the latest vault data from server.
#
#
# Examples:
#
#   bw sync
#   bw sync -f
#   bw sync --last
export extern "bw sync" [
  --force(-f)                    # Force a full sync.
  --last                         # Get the last sync date.
  --help(-h)                     # display help for command  
]

# Generate a password/passphrase.
#
#
# Notes:
#
#   Default options are `-uln --length 14`.
#
#   Minimum `length` is 5.
#
#   Minimum `words` is 3.
#
# Examples:
#
#   bw generate
#   bw generate -u -l --length 18
#   bw generate -ulns --length 25
#   bw generate -ul
#   bw generate -p --separator _
#   bw generate -p --words 5 --separator space
export extern "bw generate" [
  --uppercase(-u)                # Include uppercase characters.
  --lowercase(-l)                # Include lowercase characters.
  --number(-n)                   # Include numeric characters.
  --special(-s)                  # Include special characters.
  --passphrase(-p)               #  Generate a passphrase.
  --length: int                  # Length of the password.
  --words: int                   # Number of words.
  --separator: string            # Word separator.
  --capitalize(-c)               # Title case passphrase.
  --includeNumber                # Passphrase includes number.
  --help(-h)                     # display help for command  
]

# Base 64 encode stdin.
#
#
# Notes:
#
#   Use to create `encodedJson` for `create` and `edit` commands.
#
# Examples:
#
#   echo '{"name":"My Folder"}' | bw encode
export extern "bw encode" [
  --help(-h)                     # display help for command  
]

# Configure CLI settings.
#
#
# Settings:
#
#   server - On-premises hosted installation URL.
#
# Examples:
#
#   bw config server
#   bw config server https://bw.company.com
#   bw config server bitwarden.com
#   bw config server --api http://localhost:4000 --identity http://localhost:33656
export extern "bw config" [
  --web-vault: string            # <url> Provides a custom web vault URL that differs from the base URL.
  --api: string                  # <url> Provides a custom API URL that differs from the base URL.
  --identity: string             # <url> Provides a custom identity URL that differs from the base URL.
  --icons: string                # <url> Provides a custom icons service URL that differs from the base URL.
  --notifications: string        # <url> Provides a custom notifications URL that differs from the base URL.
  --events: string               # <url> Provides a custom events URL that differs from the base URL.
  --key-connector: string        # <url> Provides the URL for your Key Connector server.
  --help(-h)                     # display help for command

  settings: string@"nu-complete bw config-settings"
  value?: any
]

# Check for updates.
#
#
# Notes:
#
#   Returns the URL to download the newest version of this CLI tool.
#
#   Use the `--raw` option to return only the download URL for the update.
#
# Examples:
#
#   bw update
#   bw update --raw
export extern "bw update" [
  --help(-h)                     # display help for command  
]

# Not useful in Nushell
# export extern "bw completion" [
#  --help(-h)                     # display help for command  
#]

# Show server, last sync, user information, and vault status.
#
#
# Example return value:
#
#   {
#     "serverUrl": "https://bitwarden.example.com",
#     "lastSync": "2020-06-16T06:33:51.419Z",
#     "userEmail": "user@example.com,
#     "userId": "00000000-0000-0000-0000-000000000000",
#     "status": "locked"
#   }
#
# Notes:
#
# `status` is one of:
#   - `unauthenticated` when you are not logged in
#   - `locked` when you are logged in and the vault is locked
#   - `unlocked` when you are logged in and the vault is unlocked
export extern "bw status" [
  --help(-h)                     # display help for command  
]

# Start a RESTful API webserver.
#
#
# Notes:
#
#   Default hostname is `localhost`.
#   Use hostname `all` for no hostname binding.
#   Default port is `8087`.
#
# Examples:
#
#   bw serve
#   bw serve --port 8080
#   bw serve --hostname bwapi.mydomain.com --port 80
export extern "bw serve" [
  --hostname: string             # The hostname to bind your API webserver to.
  --port: int                    # The port to run your API webserver on.
  --disable-origin-protection    # If set, allows requests with origin header. Warning, this option exists for backwards compatibility reasons and exposes your environment to known CSRF attacks.
  --help(-h)                     # display help for command  
]

# List an array of objects from the vault.
#
#
# Notes:
#
#   Combining search with a filter performs a logical AND operation.
#
#   Combining multiple filters performs a logical OR operation.
#
# Examples:
#
#   bw list items
#   bw list items --folderid 60556c31-e649-4b5d-8daf-fc1c391a1bf2
#   bw list items --search google --folderid 60556c31-e649-4b5d-8daf-fc1c391a1bf2
#   bw list items --url https://google.com
#   bw list items --folderid null
#   bw list items --organizationid notnull
#   bw list items --folderid 60556c31-e649-4b5d-8daf-fc1c391a1bf2 --organizationid notnull
#   bw list items --trash
#   bw list folders --search email
#   bw list org-members --organizationid 60556c31-e649-4b5d-8daf-fc1c391a1bf2
export extern "bw list" [
  --search: string               # Perform a search on the listed objects.
  --url: string                  # Filter items of type login with a url-match search.
  --folderid: string             # Filter items by folder id.
  --collectionid: string         # Filter items by collection id.
  --organizationid: string       # Filter items or collections by organization id.
  --trash                        # Filter items that are deleted and in the trash.
  --help(-h)                     # display help for command

  object: string@"nu-complete bw list-valid-objects"  # Valid objects are: items, folders, collections, org-collections, org-members, organizations
]

# Get an object from the vault.
#
#
# If raw output is specified and no output filename or directory is given for
# an attachment query, the attachment content is written to stdout.
#
# Examples:
#
#   bw get item 99ee88d2-6046-4ea7-92c2-acac464b1412
#   bw get password https://google.com
#   bw get totp google.com
#   bw get notes google.com
#   bw get exposed yahoo.com
#   bw get attachment b857igwl1dzrs2 --itemid 99ee88d2-6046-4ea7-92c2-acac464b1412 --output ./photo.jpg
#   bw get attachment photo.jpg --itemid 99ee88d2-6046-4ea7-92c2-acac464b1412 --raw
#   bw get folder email
#   bw get template folder
export extern "bw get" [
  --itemid: string               # Attachment's item id.
  --output: string               # Output directory or filename for attachment.
  --organizationid: string       # Organization id for an organization object.
  --help(-h)                     # display help for command

  object: string@"nu-complete bw get-valid-objects"  # Valid objects are: item, username, password, uri, totp, notes, exposed, attachment, folder, collection, org-collection, organization, template, fingerprint, send
  id: string                     # Search term or object's globally unique `id`.
]

# Create an object in the vault.
#
#
# Examples:
#
#   bw create folder eyJuYW1lIjoiTXkgRm9sZGVyIn0K
#   echo 'eyJuYW1lIjoiTXkgRm9sZGVyIn0K' | bw create folder
#   bw create attachment --file ./myfile.csv --itemid 16b15b89-65b3-4639-ad2a-95052a6d8f66
export extern "bw create" [
  --file: string                 # Path to file for attachment.
  --itemid: string               # Attachment's item id.
  --organizationid: string       # string  Organization id for an organization object.
  --help(-h)                     # display help for command

  object: string@"nu-complete bw create-valid-objects"  # Valid objects are: item, attachment, folder, org-collection
  encodedJson?: string           # Encoded json of the object to create. Can also be piped into stdin.
]

# Edit an object from the vault.
#
#
# Examples:
#
#   bw edit folder 5cdfbd80-d99f-409b-915b-f4c5d0241b02 eyJuYW1lIjoiTXkgRm9sZGVyMiJ9Cg==
#   echo 'eyJuYW1lIjoiTXkgRm9sZGVyMiJ9Cg==' | bw edit folder 5cdfbd80-d99f-409b-915b-f4c5d0241b02
#   bw edit item-collections 78307355-fd25-416b-88b8-b33fd0e88c82 WyI5NzQwNTNkMC0zYjMzLTRiOTgtODg2ZS1mZWNmNWM4ZGJhOTYiXQ==
export extern "bw edit" [
  --organizationid: string       # Organization id for an organization object.
  --help(-h)                     # display help for command

  object: string@"nu-complete bw edit-valid-objects"  # Valid objects are: item, item-collections, folder, org-collection
  id: string@"nu-complete bw edit-valid-objects"  # Object's globally unique `id`.
  encodedJson?: string           # Encoded json of the object to create. Can also be piped into stdin.
]

# Delete an object from the vault.
#
#
# Examples:
#
#   bw delete item 7063feab-4b10-472e-b64c-785e2b870b92
#   bw delete item 89c21cd2-fab0-4f69-8c6e-ab8a0168f69a --permanent
#   bw delete folder 5cdfbd80-d99f-409b-915b-f4c5d0241b02
#   bw delete attachment b857igwl1dzrs2 --itemid 310d5ffd-e9a2-4451-af87-ea054dce0f78
export extern "bw delete" [
  --itemid: string               # Attachment's item id.
  --organizationid: string       # Organization id for an organization object.
  -p, --permanent                # Permanently deletes the item instead of soft-deleting it (item only).
  --help(-h)                     # display help for command

  object: string@"nu-complete bw create-valid-objects"  # Valid objects are: item, attachment, folder, org-collection
  id: string                     # Object's globally unique `id`.
]

# Restores an object from the trash.
#
#
# Examples:
#
#   bw restore item 7063feab-4b10-472e-b64c-785e2b870b92
export extern "bw restore" [
  --help(-h)                     # display help for command

  object: string@"nu-complete bw create-valid-objects"  # Valid objects are: item
  id: string                     # Object's globally unique `id`.
]

# Move an item to an organization.
#
#
# Examples:
#
#   bw move 4af958ce-96a7-45d9-beed-1e70fabaa27a 6d82949b-b44d-468a-adae-3f3bacb0ea32 WyI5NzQwNTNkMC0zYjMzLTRiOTgtODg2ZS1mZWNmNWM4ZGJhOTYiXQ==
#   echo '["974053d0-3b33-4b98-886e-fecf5c8dba96"]' | bw encode | bw move 4af958ce-96a7-45d9-beed-1e70fabaa27a 6d82949b-b44d-468a-adae-3f3bacb0ea32
export extern "bw move" [
  --help(-h)                     # display help for command

  id: string                     # Object's globally unique `id`.
  organizationId: string         # Organization's globally unique `id`.
  encodedJson?: string            # Encoded json of an array of collection ids. Can also be piped into stdin.
]

# Confirm an object to the organization.
#
#
#   Examples:
#
#     bw confirm org-member 7063feab-4b10-472e-b64c-785e2b870b92 --organizationid 310d5ffd-e9a2-4451-af87-ea054dce0f78
export extern "bw confirm" [
  --organizationid: string       # Organization id for an organization object.
  --help(-h)                     # display help for command

  object: string@"nu-complete bw create-valid-objects"  # Valid objects are: org-member
  id: string                             # Object's globally unique `id`.
]

# Import vault data from a file.
#
#
# Examples:
#
#   bw import --formats
#   bw import bitwardencsv ./from/source.csv
#   bw import keepass2xml keepass_backup.xml
#   bw import --organizationid cf14adc3-aca5-4573-890a-f6fa231436d9 keepass2xml keepass_backup.xml
export extern "bw import" [
  --formats                      # List formats
  --organizationid: string       # ID of the organization to import to.
  --help(-h)                     # display help for command

  format?: string  # The format of [input]
  # @"nu-complete bw import-formats" does not work

  input?: path                          # Filepath to data to import
]

# Export vault data to a CSV or JSON file.
#
#
# Notes:
#
#   Valid formats are `csv`, `json`, and `encrypted_json`. Default format is `csv`.
#
#   If --raw option is specified and no output filename or directory is given, the
#   result is written to stdout.
#
# Examples:
#
#   bw export
#   bw --raw export
#   bw export myPassword321
#   bw export myPassword321 --format json
#   bw export --output ./exp/bw.csv
#   bw export myPassword321 --output bw.json --format json
#   bw export myPassword321 --organizationid 7063feab-4b10-472e-b64c-785e2b870b92
export extern "bw export" [
  --output: string               # Output directory or filename.
  --format: string@"nu-complete bw export-valid-objects"  # Export file format.
  --password: string             # [password] Use password to encrypt instead of your Bitwarden account encryption key. Only applies to the encrypted_json format.
  --organizationid: string       # Organization id for an organization.
  --help(-h)                     # display help for command

  password?: string              # Use password to encrypt instead of your Bitwarden account encryption key. Only applies to the encrypted_json format.
]

# --DEPRECATED-- Move an item to an organization.
export extern "bw share" [
  --help(-h)                     # display help for command
]

# Work with Bitwarden sends.
#
# A Send can be quickly created using this command or subcommands can be used to fine-tune the Send
export extern "bw send" [
   command: string@"nu-complete bw send-commands"  # The subcommand to use
]

# List all the Sends owned by you
export extern "bw send list" [
  --file(-f)                     # Specifies that <data> is a filepath
  --deleteInDays(-d): int        # The number of days in the future to set deletion date, defaults to 7 (default: "7")
  --maxAccessCount(-a): int      # The amount of max possible accesses.
  --hidden                       # Hide <data> in web by default. Valid only if --file is not set.
  --name(-n): string             # The name of the Send. Defaults to a guid for text Sends and the filename for files.
  --notes: string                # Notes to add to the Send.
  --fullObject                   # Specifies that the full Send object should be returned rather than just the access url.
  --help(-h)                     # display help for command

  data: any                      # The data to Send. Specify as a filepath with the --file option
]

# Get json templates for send objects
export extern "bw send template" [
  --help(-h)                     # display help for command

  object: string@"nu-complete bw send template-valid-objects"  # Valid objects are: send.text, send.file
]

# Get Sends owned by you.
#
#
# If raw output is specified and no output filename or directory is given for
# an attachment query, the attachment content is written to stdout.
#
# Examples:
#
#   bw send get searchText
#   bw send get id
#   bw send get searchText --text
#   bw send get searchText --file
#   bw send get searchText --file --output ../Photos/photo.jpg
#   bw send get searchText --file --raw
export extern "bw send get" [
  --output:path                  # Output directory or filename for attachment.
  --text                         # Specifies to return the text content of a Send
  --help(-h)                     # display help for command

  id: string                     # Search term or Send's globally unique `id`.
]

# Access a Bitwarden Send from a url
#
#
# If a password is required, the provided password is used or the user is prompted.
export extern "bw send receive" [
  --password: string             # Password needed to access the Send.
  --passwordenv: string@"nu-complete bw env-vars"  # Environment variable storing the Send's password
  --passwordfile: path           # Path to a file containing the Sends password as its first line
  --obj                          # Return the Send's json object rather than the Send's content
  --output: path                 # Specify a file path to save a File-type Send to
  --help(-h)                     # display help for command
]

# Create a Send
#
#
# Note:
#   Options specified in JSON take precedence over command options
export extern "bw send create" [
  --file: path                   # file to Send. Can also be specified in parent's JSON.
  --text: string                 # text to Send. Can also be specified in parent's JSON.
  --hidden                       # text hidden flag. Valid only with the --text option.
  --password: string             # optional password to access this Send. Can also be specified in JSON
  --help(-h)                     # display help for command

  encodedJson?: string           # JSON object to upload. Can also be piped in through stdin.
]

# edit a Send
#
#
# Note:
#   You cannot update a File-type Send's file. Just delete and remake it
export extern "bw send edit" [
  --itemid: string               # Overrides the itemId provided in [encodedJson]
  --help(-h)                     # display help for command

  encodedJson?: string           # Updated JSON object to save. If not provided, encodedJson is read from stdin.
]

# Removes the saved password from a Send.
export extern "bw send remove-password" [
  --help(-h)                     # display help for command

  id: string                     # The id of the Send to alter.
]

# Delete a Send
export extern "bw send delete" [
  --help(-h)                     # display help for command

  id: string                     # The id of the Send to delete.
]

# Access a Bitwarden Send from a url
#
#
# If a password is required, the provided password is used or the user is prompted.
export extern "bw receive" [
  --password: string             # Password needed to access the Send.
  --passwordenv: string@"nu-complete bw env-vars"  # Environment variable storing the Send's password
  --passwordfile: path           # Path to a file containing the Sends password as its first line
  --obj                          # Return the Send's json object rather than the Send's content
  --output: path                 # Specify a file path to save a File-type Send to
  --help(-h)                     # display help for command

  urs: string
]

# Not useful in Nushell
# export extern "bw help" [
#   --help(-h)                     # display help for command
# ]
