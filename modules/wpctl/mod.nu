# `"Wpctl"` is a command-line control tool for WirePlumber, the PipeWire session manager.
#
# It provides an interface to inspect, control, and configure audio and video devices, nodes,
# and their properties within a PipeWire media server. WirePlumber manages audio and video routing,
# device configuration, and session policies. wpctl allows users to interact with these components,
# change volume levels, set default devices, inspect object properties, and modify settings.
@category audio
@search-terms audio pipewire
@complete external # PLZ use fish to complete it instead of carapace
export extern main []

def media [] { [audio video] }
def object [] { [devices sinks sources]}

# Displays a machine-readable list of PipeWire objects.
#
# Optionally filtered by media type and object type.
@category audio
@example "List all audio devices" { wpctl list audio devices }
export def list [
  media?: string@media    # Filter by media type
  object?: string@object  # Filter by object type (requires media type to be specified first)
]: nothing -> table<id: int name: string type: string default: bool> {
  ^wpctl list ...([$media $object] | compact)
  | from csv --separator "\t" --noheaders
  | rename id name type default
  | update id { into int }
  | update default { str contains "*" }
}

def id [
]: nothing -> table<value: string description: string> {
  list
  | where type not-ends-with device
  | update name {|it|
    try {
      ^wpctl inspect $it.id
      | find "node.description"
      | parse --regex '= "(?<name>[^"]+)"'
      | get 0.name
    } catch {
      $it.name
    }
  }
  | rename --column { id: value name: description }
}

# Displays the current state of objects in PipeWire.
#
# It including devices, sinks, sources, filters, and streams.
# Shows a hierarchical view of the audio/video system.
export extern status [
  --nick (-k) # Display device and node nicknames instead of descriptions
  --name (-n) # Display device and node names instead of descriptions
]

const identifiers = [
  [value description];
  [@DEFAULT_SINK@           "The current default audio sink (playback device)"]
  [@DEFAULT_AUDIO_SINK@     "The current default audio sink (playback device)"]
  [@DEFAULT_SOURCE@         "The current default audio source (capture device)"]
  [@DEFAULT_AUDIO_SOURCE@   "The current default audio source (capture device)"]
  [@DEFAULT_VIDEO_SOURCE@   "The current default video source (camera)"]
]

def id-and-identifiers [
]: nothing -> table {
  id | append $identifiers
}

# Displays volume information about the specified node.
#
# It including current volume level and mute state.
export extern get-volume [
  id: string@id-and-identifiers # Node ID or special identifier
]

# Displays detailed information about the specified object
#
# It including all properties and metadata.
@example "Inspect a device with associated objects" { wpctl inspect --associated 30 }
export def inspect [
  --referenced (-r) # Show objects that are referenced in properties
  --associated (-a) # Show associated objects
  id: string@id-and-identifiers # Object ID or special identifier
]: nothing -> record {
  let id = try { $id | into int } catch {
    ^wpctl inspect $id
    | lines
    | first
    | parse 'id {id}, type {type}'
    | get 0.id
  }
  ^pw-dump
  | from json
  | where id == $id
  | update info { get props }
  | reject version permissions
  | flatten
  | first
  | transpose key value
  | each { [$in.key $in.value] }
  | into record
}

# Sets the specified device node to be the default target.
#
# Set default of its kind (capture or playback) for new streams that require auto-connection.
# The selection is remembered across restarts, in the default-nodes state file,
# and takes precedence over the automatic,
# priority-based selection that WirePlumber would otherwise make.
# Use clear-default to undo it.
@example "Set default audio sink" { wpctl set-default 42 }
export extern set-default [
  id: int@id # Sink or source node ID
]

export def pid []: nothing -> table<value: string description: string> {
  ^pw-dump
  | from json
  | get --optional info.props
  | where ($it."application.process.id"? != null)
  | select "application.process.id" "application.name"
  | rename "value" "description"
}

# Sets the volume of the specified node.
#
# Volume specification
#
# - VOL - Set volume to specific value (1.0 = 100%)
# - VOL% - Set volume to percentage (50% = 0.5)
# - VOL+ - Increase volume by value
# - VOL- - Decrease volume by value
# - VOL%+ - Increase volume by percentage
# - VOL%- - Decrease volume by percentage
@example "Set volume to 50%" { wpctl set-volume @DEFAULT_SINK@ 0.5 }
@example "Increase volume by 10%" { wpctl set-volume 42 10%+ }
@example  "Set volume for all nodes of PID 1234" { wpctl set-volume --pid 1234 0.8 }
export extern set-volumn [
  --pid (-p): int@pid # Treat ID as a process ID and affect all nodes associated with it
  --limit (-l): float # Limit final volume to below this value (floating point, 1.0 = 100%)
  id: string@id-and-identifiers # Node ID, special identifier
  volume: string # Volume specification:
]

def switch []: nothing -> table { [
  [value description];
  [1 mute]
  [0 unmute]
  [toggle toggle]]
}

# Changes the mute state of the specified node.
@example "Mute the default source" { wpctl set-mute @DEFAULT_SOURCE@ 1 }
export extern set-mute [
  --pid (-p): int@pid # Treat ID as a process ID and affect all nodes associated with it
  id: string@id-and-identifiers # Node ID, special identifier
  switch: string@switch # Mute state
]

# Sets the profile of the specified device to the given index.
export extern set-profile [
  id: string@id-and-identifiers # Node ID, special identifier
  index: int # Profile index (integer, 0 typically means 'off')
]


# Sets the route of the specified device to the given index.
export extern set-route [
  id: string@id-and-identifiers # Node ID, special identifier
  index: int # Route index (integer, 0 typically means 'off')
]

def setting-id [] {
  [
    [value description];
    [0 Audio/Sink]
    [1 Audio/Source]
    [2 Video/Source]
  ]
}

# Clears the default configured node. If no ID is specified, clears all default nodes.
#
# This forgets the current and all previous set-default selections of that kind,
# so that WirePlumber goes back to choosing the default node automatically,
# based on the priority.session property of each node. It is needed whenever a
# configured priority appears to have no effect, since a saved selection
# outranks any priority. The saved selections are listed in the "Default Configured Devices"
# section of status.
export extern clear-default [
  id?: int@setting-id # Settings ID to clear
]

def settings-scheme []: nothing -> table<value: string description: string> {
  ^wpctl settings
  | lines
  | skip 2
  | each {
    if $in =~ '^\s+Default: [^\[\]]+\[[^\[\]]+\]$' {
      str trim
      | str replace -ar '\s+' ' '
      | parse "Default: {default} [Min: {min}, Max: {max}]"
      | first
      | ($"  Default: ($in.default)\n" +
        $"  Min: ($in.min)\n" +
        $"  Max: ($in.max)"
      )
    } else { $in }
  }
  | str join "\n" | from yaml
}

def setting-key []: nothing -> table<value: string description: string> {
  settings-scheme | rename --column { Id: value Name: description }
}

def setting-val [context: string]: nothing -> list<string> {
  match (
    $context
    | split row " "
    | skip 2
    | where $it !~ ""
    | first
  ) {
    bluetooth.profile-preference => [quality latency]
    $key if (
      settings-scheme | where Id == $key
    ).Type == "Boolean" => [true false]
    _ => []
  }
}

# Shows, changes, or removes WirePlumber settings.
export def settings [
  --delete (-d) # Delete the saved setting value
  --save (-s) # Save the setting value
  --reset (-r) # Reset the setting to its default value
  key?: string@setting-key # Setting key name
  val?: string@setting-val # Setting value (JSON format)
] {
  let val = if $val == null and $in != null { $in | to json --raw } else { $val }
  if $key == null { settings-scheme }
  else {
    let args = [
      (if $delete { "--delete" })
      (if $save { "--save" })
      (if $reset { "--reset" })
      $key
      $val
    ] | compact
    ^wpctl settings ...$args
  }
}

def client-id []: nothing -> table<value: string description: string> {
  ^pactl -f json list clients
  | from json
  | update properties { get "application.name" }
  | rename --column { index: value properties: description }
  | let completion
  {
    value: 0
    description: "PipeWire Server"
  } | append $completion
}

def log-level [] {
  [
    0 1 2 3 4 5
    E W N I D T
    -
  ]
}

# Sets the log level of a client.
export extern set-log-level [
  id: int@client-id # Client ID. If omitted, applies to WirePlumber. Use 0 for PipeWire server.
  level: string@log-level # Log level, Use - to unset the log level.
]

# Resets WirePlumber (and optionally PipeWire) to defaults by removing state and configuration files.
#
# By default, only the WirePlumber state directory (~/.local/state/wireplumber) is removed.
# WirePlumber is automatically stopped before removal and restarted afterwards,
# unless --no-restart is given. A confirmation prompt is shown before any files are deleted,
# unless --yes is given.
# This command does not require a running PipeWire session.
@example "Reset WirePlumber state and config without promptin" { wpctl reset --wireplumber-config --yes }
@example "Reset everything (WirePlumber and PipeWire state and config)" { wpctl reset --all}
export extern reset [
  --wireplumber-config (-c) # Remove WirePlumber config files
  --pipewire-config (-p) # Remove PipeWire config files and restart the service
  --all (-a) # Remove all state and config files
  --no-restart (-n) # Do not stop or restart services after removing files
  --dry-run (-d) # Show which files would be deleted
  --yes (-y) # Proceed without prompting for confirmation
]
