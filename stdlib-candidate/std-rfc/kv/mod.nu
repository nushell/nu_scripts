# kv module
#
# use std-rfc/kv *
#
# Easily store and retrieve key-value pairs
# in a pipeline.
#
# A common request is to be able to assign a
# pipeline result to a variable. While it's
# not currently possible to use a "let" statement
# within a pipeline, this module provides an
# alternative. Think of each key as a variable
# that can be set and retrieved.

# Stores the pipeline value for later use
#
# If the key already exists, it is updated
# to the new value provided.
#
# Usage:
# <input> | kv set <key> <value?>
#
# Example:
# ls ~ | kv set "home snapshot"
# kv set foo 5
export def "kv set" [
  key: string
  value_or_closure?: any
  --return (-r): string   # Whether and what to return to the pipeline output
] {
  # Pipeline input is preferred, but prioritize
  # parameter if present. This allows $in to be
  # used in the parameter if needed.
  let input = $in

  let arg_type = ($value_or_closure | describe)
  let value = match $arg_type {
    closure => { $input | do $value_or_closure }
    _ => ($value_or_closure | default $input)
  }

  # Store values as nuons for type-integrity
  let kv_pair = {
    key: $key
    value: ($value | to nuon)
  }

  # Create the table if it doesn't exist
  try {
    stor create -t std_kv_store -c {key: str, value: str} | ignore
  }

  # Does the key exist yet?
  let key_exists = ( $key in (stor open | $in.std_kv_store?.key?))
  
  # If so, we need an update rather than an insert
  let stor_action = match $key_exists {
    true => {{stor update -t std_kv_store --where-clause $"key = '($key)'"}}
    false  => {{stor insert -t std_kv_store}}
  }

  # Execute the update-or-insert action
  $kv_pair | do $stor_action

  # Returns the kv table itself in case it's
  # useful in the pipeline
  match ($return | default 'value') {
    'all' => (kv list)
    'a' => (kv list)
    'value' => $value
    'v' => $value
    'input' => $input
    'in' => $input
    'ignore' => null
    'i' => null
    _  => {
      error make {
        msg: "Invalid --return option"
        label: {
          text: "Must be 'all'/'a', 'value'/'v', 'input'/'in', or 'ignore'/'i'"
          span: (metadata $return).span
        }
      }
    }
  }
}

def kv_key_completions [] {
  try {
    stor open
    # Hack to turn a SQLiteDatabase into a table
  | $in.std_kv_store | wrap temp | get temp
  | get key? 
  } catch {
    # Return no completions
    []
  }

}

# Retrieves a stored value by key
#
# Counterpart of "kv set". Returns null
# if the key is not found.
# 
# Usage:
# kv get <key> | <pipeline>
export def "kv get" [
  key: string@kv_key_completions    # Key of the kv-pair to retrieve
] {
  try {
    stor create -t std_kv_store -c {key: str, value: str} | ignore
  }

  stor open
    # Hack to turn a SQLiteDatabase into a table
  | $in.std_kv_store | wrap temp | get temp
  | where key == $key
    # Should only be one occurence of each key in the stor
  | get -i value | first
  | match $in {
      # Key not found
      null => null
      # Key found
      _ => { from nuon }
  }
}

# List the currently stored key-value pairs
#
# Returns results as the Nushell value rather
# than the stored nuon.
export def "kv list" [] {
  # Create the table if it doesn't exist
  try {
    stor create -t std_kv_store -c {key: str, value: str} | ignore
  }

  stor open | $in.std_kv_store | each {|kv_pair|
    {
      key: $kv_pair.key
      value: ($kv_pair.value | from nuon )
    }
  }
}

# Returns and removes a key-value pair
export def "kv drop" [
  key: string@kv_key_completions    # Key of the kv-pair to drop
] {
  # Create the table if it doesn't exist
  try {
    stor create -t std_kv_store -c {key: str, value: str} | ignore
  }

  try {
    stor open
      # Hack to turn a SQLiteDatabase into a table
    | $in.std_kv_store | wrap temp | get temp
    | where key == $key
      # Should only be one occurrence of each key in the stor
    | get -i value | first
    | match $in {
        # Key not found
        null => null

        # Key found
        _ => {
          let value = $in
          stor delete --table-name std_kv_store --where-clause $"key = '($key)'"
          $value | from nuon
        }
    }

  } catch {
    # If value not found or other error, don't return anything
    null
  }
}