# Nushell Conda/Mamba/Micromamba Activation Script
#
# Based on nu_conda_2 from nushell/nu_scripts, with fixes for:
# - Mamba JSON output changes (key names like "envs directories", "base environment")
# - Nushell syntax errors (let assignment, run-external usage)
# - Tested with Mamba 2.1.0 / Conda (implicitly via Mamba) / Nushell 0.103.0

# Loads conda info once per session and caches in $env.CONDA_INFO
def --env load-conda-info-env [] {
    # Check only once per session if CONDA_INFO is already loaded
    if (not (has-env CONDA_INFO)) {
        export-env {
            # Determine which command to use (prioritize micromamba > mamba > conda)
            # Corrected syntax: Wrap the entire if/else expression in parentheses for assignment
            let cmd_base = (
                if not (which micromamba | is-empty) {
                    "micromamba"
                } else {
                    if not (which mamba | is-empty) {
                        "mamba"
                    } else {
                        if not (which conda | is-empty) {
                            "conda"
                        } else {
                            null # No command found
                        }
                    }
                }
            )

            # If a command was found, try to load info
            $env.CONDA_INFO = if ($cmd_base == "mamba") {
                try {
                    # Mamba requires separate calls as `info --envs` is minimal
                    # Corrected syntax: Pass arguments as separate strings to run-external
                    let mamba_info = (run-external $cmd_base "info" "--json" | from json)
                    let mamba_envs = (run-external $cmd_base "info" "--envs" "--json" | from json | get envs)

                    # Explicitly extract keys using names observed in Mamba 2.x output
                    let root_prefix = ($mamba_info | get "base environment")
                    let envs_dirs = ($mamba_info | get "envs directories")

                    # Construct the final record cleanly
                    {
                        root_prefix: $root_prefix,
                        envs_dirs: $envs_dirs,
                        envs: $mamba_envs
                    }

                } catch { |err|
                    print --stderr $"WARN: Failed to get info from 'mamba': ($err)"
                    null # Indicate failure
                }
            } else if ($cmd_base == "conda") {
                # Conda 'info --json' usually contains all necessary info
                try {
                    # Corrected syntax: Pass arguments as separate strings to run-external
                    let conda_info_all = (run-external $cmd_base "info" "--json" | from json)
                    # Extract required fields, assuming standard conda output keys
                    {
                        root_prefix: ($conda_info_all | get root_prefix),
                        envs_dirs: ($conda_info_all | get envs_dirs),
                        envs: ($conda_info_all | get envs)
                    }
                } catch { |err|
                     print --stderr $"WARN: Failed to get info from 'conda': ($err)"
                    null # Indicate failure
                }
            } else if ($cmd_base == "micromamba") {
                 # Micromamba requires parsing text output and separate calls
                 try {
                    # Corrected syntax: Pass arguments as separate strings to run-external
                    let mi_info_lines = (run-external $cmd_base "info" | lines)
                    let base = ($mi_info_lines | where $it =~ "Base Environment" | parse "{key}: {value}" | get value | str trim | first)
                    let dirs_line = ($mi_info_lines | where $it =~ "Envs Directories" | first)
                    let dirs = if ($dirs_line | is-empty) { [] } else { $dirs_line | parse "{key}: {value}" | get value | str trim | split row " " }

                    # Corrected syntax: Pass arguments as separate strings to run-external
                    let env_list = (run-external $cmd_base "env" "list" "--json" | from json | get envs)

                    # Construct record using consistent key names where possible
                    { root_prefix: $base, envs_dirs: $dirs, envs: $env_list }

                 } catch { |err|
                    print --stderr $"WARN: Failed to get info from 'micromamba': ($err)"
                    null
                 }
            } else {
                # No command found
                print --stderr "WARN: No conda, mamba, or micromamba command found."
                null
            }
        } # End export-env
    } # End if not (has-env CONDA_INFO)
}

# Activate conda environment
export def --env activate [
    env_name: string@'nu-complete conda envs' = "base" # name of the environment
] {
    load-conda-info-env
    let conda_info = $env.CONDA_INFO
    if ($conda_info == null) {
        print --stderr "Error: Conda/Mamba/Micromamba info could not be loaded. Cannot activate."
        return
    }
    # Check if essential keys were populated correctly
    if ($conda_info.envs_dirs == null) or ($conda_info.root_prefix == null) or ($conda_info.envs == null) {
         print --stderr "Error: Failed to load essential Conda/Mamba/Micromamba info (envs_dirs, root_prefix, envs). Cannot activate."
         return
    }


    let env_dir = if $env_name != "base" {
        # Check if env_name is already a valid path to a known environment
        let expanded_env_name = ($env_name | path expand)
        if ($env_name | path exists) and ($expanded_env_name in $conda_info.envs ) {
            $expanded_env_name
        } else {
            # Otherwise, try to find the environment by name in the known envs_dirs
            (check-if-env-exists $env_name $conda_info)
        }
    } else {
        $conda_info.root_prefix
    }

    # If check-if-env-exists returned an error (implicitly null/empty), stop
    if ($env_dir | is-empty) {
        # Error message was already printed by check-if-env-exists
        return
    }

    # Ensure env_dir is a string for path operations
    let env_dir = ($env_dir | into string)

    let old_path = (system-path | str join (char esep))

    let new_path = if (windows?) {
        conda-create-path-windows $env_dir
    } else {
        conda-create-path-unix $env_dir
    }

    let virtual_prompt = $'[($env_name)] '

    # Base environment variables to set
    let new_env_base = {
        CONDA_DEFAULT_ENV: $env_name,
        CONDA_PREFIX: $env_dir,
        CONDA_PROMPT_MODIFIER: $virtual_prompt,
        CONDA_SHLVL: ((($env.CONDA_SHLVL? | default 0) | into int) + 1 | into string), # Increment shell level
        CONDA_OLD_PATH: $old_path
    }

    # Merge the new path (PATH or Path)
    let new_env = ($new_env_base | merge $new_path)

    # Handle prompt modification only if CONDA_NO_PROMPT is not set
    let new_env = if not (has-env CONDA_NO_PROMPT) {
        let old_prompt_command = if (has-env CONDA_OLD_PROMPT_COMMAND) {
            $env.CONDA_OLD_PROMPT_COMMAND
        } else {
            if (has-env 'PROMPT_COMMAND') {
                $env.PROMPT_COMMAND
            } else {
                null # Use null if no prompt command exists
            }
        }

        # Store the old prompt command only if it wasn't null
        let env_update_prompt = if ($old_prompt_command != null) {
             { CONDA_OLD_PROMPT_COMMAND: $old_prompt_command }
        } else {
             {} # Empty record if no old prompt to save
        }

        # Create the new prompt command
        let new_prompt = if ($old_prompt_command != null) {
            # Check if the old command is a closure
            if 'closure' in ($old_prompt_command | describe) {
                {|| $'($virtual_prompt)(do $old_prompt_command)' }
            } else {
                 # Assume it's a string or something else printable
                {|| $'($virtual_prompt)($old_prompt_command)' }
            }
        } else {
             # If no old prompt, just use the virtual prompt
            {|| $'($virtual_prompt)' }
        }

        # Merge prompt updates into the environment changes
        $new_env | merge $env_update_prompt | merge { PROMPT_COMMAND: $new_prompt }

    } else {
        # If prompt is disabled, ensure old prompt command is cleared if it exists
         $new_env | merge { CONDA_OLD_PROMPT_COMMAND: null }
    }

    # Load the calculated environment variables
    load-env $new_env
}

# Deactivate currently active conda environment
export def --env deactivate [] {
    # Check if CONDA_OLD_PATH exists (indicates an environment is active)
    if not (has-env CONDA_OLD_PATH) {
        print --stderr "WARN: No active conda environment detected to deactivate."
        return
    }

    # Restore the old PATH
    let path_name = if "PATH" in $env { "PATH" } else { "Path" }
    load-env { ($path_name): $env.CONDA_OLD_PATH }

    # Decrement or remove CONDA_SHLVL
    let current_shlvl = (($env.CONDA_SHLVL? | default 1) | into int)
    if $current_shlvl <= 1 {
        hide-env CONDA_SHLVL
    } else {
        load-env { CONDA_SHLVL: ($current_shlvl - 1 | into string) }
    }

    # Hide other conda variables
    hide-env CONDA_PROMPT_MODIFIER
    hide-env CONDA_PREFIX
    hide-env CONDA_DEFAULT_ENV
    hide-env CONDA_OLD_PATH

    # Restore the old prompt command if it was saved
    if (has-env CONDA_OLD_PROMPT_COMMAND) {
        if $env.CONDA_OLD_PROMPT_COMMAND == null {
             # If saved value is null, maybe hide PROMPT_COMMAND? Or leave as is?
             # Let's assume leaving it is safer if it was null.
             # hide-env PROMPT_COMMAND # Optional: uncomment to fully remove prompt if old was null
        } else {
            load-env { PROMPT_COMMAND: $env.CONDA_OLD_PROMPT_COMMAND }
        }
        hide-env CONDA_OLD_PROMPT_COMMAND # Hide the saved value itself
    }
}

# Finds the full path for a given environment name
def check-if-env-exists [ env_name: string, conda_info: record ] {
    # Get the list of base directories where envs might live
    # Ensure it's a list, default to empty list if key is missing or null
    let base_env_dirs = ($conda_info | get envs_dirs | default [])

    # Construct potential full paths for the named environment in each base directory
    let potential_env_paths = (
        $base_env_dirs | each { |dir| $dir | path join $env_name }
    )

    # Ensure $conda_info.envs is also a list, default to empty
    let known_envs = ($conda_info | get envs | default [])

    # Find which of these potential paths actually exist in the list of known environments
    let found_envs = (
        $potential_env_paths | where {|potential_path| $potential_path in $known_envs }
    )

    # --- Error Checking ---
    if ($found_envs | is-empty) {
        # Use print --stderr instead of error make to avoid stopping script execution in some contexts
        print --stderr $"Error: Could not find environment named '($env_name)' in any of the search directories: ($base_env_dirs | str join ', ')"
        return null # Return null to indicate failure
    }
    if ($found_envs | length) > 1 {
         # Removed debug print
         print --stderr $"Error: Found multiple environments named '($env_name)' in different locations: ($found_envs | str join ', ')"
         return null # Return null to indicate failure
    }

    # Return the single found path
    $found_envs | first
}

# Completer function for environment names
def 'nu-complete conda envs' [] {
    load-conda-info-env
    if (has-env CONDA_INFO) and ($env.CONDA_INFO != null) {
        $env.CONDA_INFO
        | get envs                 # Get the list of full paths
        # FIX: Pipe the path into path basename
        | each { |env_path| $env_path | path basename } # Get just the name part
        | append "base"            # Always include 'base' as an option
        | uniq                     # Remove duplicates (e.g., if base path was listed)
        | sort                     # Sort the names alphabetically
    } else {
        [] # Return empty list if info failed to load
    }
}

# Helper to create PATH string on Windows
def conda-create-path-windows [env_dir: string] {
    # Conda on Windows needs a few additional Path elements
    let env_path_parts = [
        $env_dir,
        ([$env_dir "Scripts"] | path join),
        ([$env_dir "Library" "mingw-w64" "bin"] | path join), # Added bin here
        ([$env_dir "Library" "usr" "bin"] | path join),
        ([$env_dir "Library" "bin"] | path join)
    ]

    # Prepend these parts to the existing system path
    let new_path = ([$env_path_parts (system-path | split row (char esep))]
        | flatten
        | uniq # Ensure uniqueness
        | str join (char esep))

    { Path: $new_path }
}

# Helper to create PATH string on Unix-like systems
def conda-create-path-unix [env_dir: string] {
    let env_bin_path = ([$env_dir "bin"] | path join)

    # Prepend the env bin path to the existing PATH
    let new_path = ([$env_bin_path ($env.PATH | split row (char esep))]
        | flatten
        | uniq # Ensure uniqueness
        | str join (char esep))

    { PATH: $new_path }
}

# Helper to check if running on Windows
def windows? [] {
    $nu.os-info.name == 'windows'
}

# Helper to get the system PATH variable name correctly
def system-path [] {
    if "PATH" in $env { $env.PATH } else { $env.Path }
}

# Helper to check if an environment variable exists
def has-env [name: string] {
    $name in $env
}