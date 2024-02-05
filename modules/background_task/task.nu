# Spawn a task to run in the background, even when the shell is closed.
#
# Note that a fresh Nushell interpreter is spawned to execute the
# given task, so it won't inherit the current scope's variables,
# custom commands and alias definitions.
#
# It will only inherit environment variables which can be converted to a string.
#
# Note that the closure can't take arguments.
#
# Example usage: task spawn { echo "Hello, World!" }
export def spawn [
  command: closure                    # The closure to run.
  --working-directory (-w): directory # Specify the working directory the task will be run in.
  --immediate (-i)                    # Immediately start the task.
  --stashed (-s)                      # Create the task in Stashed state. Useful to avoid immediate execution if the queue is empty
  --delay (-d): duration              # Queue the task for execution only after the duration.
  --group (-g): string                # The group to spawn the task under.
  --after (-a): int                   # Start the task once all specified tasks have successfully finished. As soon as one of the dependencies fails, this task will fail as well.
  --priority (-o): string             # Start this task with a higher priority. The higher the number, the faster it will be processed.
  --label (-l): string                # Label the task. This string will be shown in the `status` column of `task status`.
] -> int {
  mut args = []

  if $working_directory != null {
    $args = ($args | prepend ["--working-directory", $working_directory])
  }
  if $immediate {
    $args = ($args | prepend "--immediate")
  }
  if $stashed {
    $args = ($args | prepend "--stashed")
  }
  if $delay != null {
    $args = ($args | prepend ["--delay" ($delay | format duration sec | parse "{secs} {_}" | get 0.secs)])
  }
  if $group != null {
    $args = ($args | prepend ["--group" $group])
  }
  if $after != null {
    $args = ($args | prepend ["--after" $after])
  }
  if $priority != null {
    $args = ($args | prepend ["--priority" $priority])
  }
  if $label != null {
      $args = ($args | prepend ["--label" $label])
  }

  let source_path = mktemp --tmpdir --suffix "-nu-task"

  (
    view source $command
    | str trim --left --char "{"
    | str trim --right --char "}"
  )
  | save --force $source_path

  (pueue add --print-task-id ...$args $"nu --config '($nu.config-path)' --env-config '($nu.env-path)' ($source_path)")
}

# Remove tasks from the queue.
# Running or paused tasks need to be killed first.
export def remove [
  ...ids: int # IDs of the tasks to remove from the status list.
] {
  pueue remove ...$ids
}

# Switches the queue position of two tasks.
# Only works for queued or stashed tasks.
export def switch [
  task_id_1: int # The first task ID.
  task_id_2: int # The second task ID.
] {
  pueue switch $task_id_1 $task_id_2
}

# Stash a task that is not currently running.
#
# Stashed tasks won't be automatically started.
# You will have to queue them or start them by hand.
export def stash [
  ...ids: int # IDs of the tasks to stash.
] {
  pueue stash ...$ids
}

# Queue stashed tasks for execution.
export def queue [
  ...ids: int            # IDs of the tasks to queue.
  --delay (-d): duration # Queue only after the specified delay.
] {
  let args = if $delay != null {
    ["--delay" ($delay | format duration sec | parse '{secs} {_}' | get 0.secs)]
  } else {
    []
  }

  pueue enqueue ...$args ...$ids
}

# Resume operation of specific tasks or groups of tasks.
#
# By default, this resumes the default group and all its tasks.
# It can also be used force-start specific tasks or start whole groups.
export def start [
  ...ids: int          # IDs of the tasks to start. By default all the tasks in the default group will be started.
  --group (-g): string # Resume a specific group and all paused tasks in it. The group will be set to running and its paused tasks will be resumed.
  --all (-a)           # Resume all groups. All groups will be set to running and paused tasks will be resumed.
] {
  mut args = []

  if $group != null {
    $args = ($args | prepend ["--group" $group])
  }
  if $all {
    $args = ($args | prepend "--all")
  }

  pueue start ...$args
}

# Restart failed or successful task(s).
#
# By default, identical tasks will be created and
# enqueued, but it's possible to restart in-place.
#
# You can also edit a few properties, such as
# the path and the command of the task, before restarting.
export def restart [
  ...ids: int                    # IDs of the tasks to restart.
  --all-failed (-a)              # Restart all failed tasks across all groups. Nice to use in combination with `--in-place/i`.
  --failed-in-group (-g): string # Like `--all-failed`, but only restart tasks failed tasks of a specific group. The group will be set to running and its paused tasks will be resumed.
  --start-immediately (-k)       # Immediately start the tasks, no matter how many open slots there are. This will ignore any dependencies tasks may have.
  --stashed (-s)                 # Set the restarted task to a "Stashed" state. Useful to avoid immediate execution.
  --in-place (-i)                # Restart the tasks by reusing the already existing tasks.
  --not-in-place (-n)            # Opposite of `--in-place`. This is already the default unless you have `restart_in_place` set to true.
  --edit (-e)                    # Edit the tasks' commands before restarting
  --edit-path (-p)               # Edit the tasks' paths before restarting
  --edit-label (-l)              # Edit the tasks' labels before restarting
] {
  mut args = []

  if $all_failed {
    $args = ($args | prepend "--all-failed")
  }
  if $failed_in_group != null {
    $args = ($args | prepend "--failed-in-group")
  }
  if $start_immediately {
    $args = ($args | prepend "--start-immediately")
  }
  if $stashed {
    $args = ($args | prepend "--stashed")
  }
  if $in_place {
    $args = ($args | prepend "--in-place")
  }
  if $not_in_place {
    $args = ($args | prepend "--not-in-place")
  }
  if $edit {
    $args = ($args | prepend "--edit")
  }
  if $edit_path {
    $args = ($args | prepend "--edit-path")
  }
  if $edit_label {
    $args = ($args | prepend "--edit-label")
  }

  pueue restart ...$args ...$ids
}

# Either pause a running tasks or a specific groups of tasks.
#
# By default, pauses the default group and all its tasks.
#
# A paused group won't start any new tasks automatically.
export def pause [
  ...ids: int  # IDs of the tasks to pause.
  --group (-g) # Pause a specific group
  --all (-a)   # Pause all groups.
  --wait (-w)  # Only pause the specified group and let already running tasks finish by themselves
] {
  mut args = []

  if $group != null {
    $args = ($args | prepend "--group")
  }
  if $all != null {
    $args = ($args | prepend "--all")
  }
  if $wait != null {
    $args = ($args | prepend "--wait")
  }

  pueue pause ...$args ...$ids
}

# Kill specific running tasks or whole task groups.
#
# Kills all tasks of the default group when no ids or a specific group are provided.
export def kill [
  ...ids: int           # IDs of the tasks to kill.
  --group (-g): string  # Kill all running tasks in a group. This also pauses the group.
  --all (-a)            # Kill all running tasks across ALL groups. This also pauses all groups.
  --signal (-s): string # Send a UNIX signal instead of simply killing the process. DISCLAIMER: This bypasses Pueue's process handling logic! You might enter weird invalid states, use at your own descretion.
] {
  mut args = []

  if $group != null {
    $args = ($args | prepend ["--group" $group])
  }
  if $all {
    $args = ($args | prepend "--all")
  }
  if $signal != null {
    $args = ($args | prepend ["--signal" $signal])
  }

  pueue kill ...$args ...$ids
}

# Send something to a task. Useful for sending confirmations such as "y\n".
export def send [
  id: int # ID of the task to send something to.
  input: string # The input that should be sent to the process.
] {
  pueue send $id $input
}

# Edit the command, path or label of a stashed or queued task.
#
# By default only the command is edited.
#
# Multiple properties can be added in one go.
export def edit [
  id: int        # ID of the task to edit.
  --command (-c) # Edit the task's command
  --path (-p)    # Edit the task's path
  --label (-l)   # Edit the task's label
] {
  mut args = []

  if $command {
    $args = ($args | prepend "--command")
  }
  if $path {
    $args = ($args | prepend "--path")
  }
  if $label {
    $args = ($args | prepend "--label")
  }

  pueue edit ...$args $id
}

# Use this to add or remove groups.
#
# By default, this will simply display all known groups.
export def group [] {
  pueue group --json | from json
}

# Create a new group with a name.
export def "group add" [
  name: string # The name of the new group.
  --parallel (-p): int # The amount of parallel tasks the group can run at one time.
] {
  let args = if $parallel != null {
    ["--parallel" $parallel]
  } else {
    []
  }

  pueue group add ...$args $name
}

# Remove a group with a name.
export def "group remove" [
  name: string # The name of the group to be removed.
] {
  pueue group remove $name
}

# Display the current status of all tasks.
export def status [
  --detailed (-d) # Return a table with more detailed information.
] {
  let output = (
    pueue status --json
    | from json
    | get tasks
    | transpose --ignore-titles status
    | flatten
  )

  # TODO: Rename the Done column to done.
  if not $detailed {
      $output | select id label group Done? status? start? end?
  } else {
      $output
  }
}

# Display the output of tasks.
#
# Only the last few lines will be shown by default for multiple tasks.
# If you want to follow the output, use `--tail/-t`.
export def log [
  ...ids: int      # The tasks to check the outputs of.
  --last (-l): int # Only print the last N lines of each task's output. This is done by default if you're looking at multiple tasks.
  --tail (-t)      # Follow the output as it is printing. Only works with 1 task. When used in conjunction with `--last`, the last N lines will be printed before starting to wait for output.
  --detailed (-d)  # Include all fields, don't simplify output.
] {
  def process_raw [raw: string] {
    let full = (
      $raw
      | from json
      | transpose -i info
      | flatten --all
      | flatten --all
    )

    if $detailed {
      $full
    } else {
      $full | select id label group Done? status? start? end?
    }
  }

  if (($ids | length) == 1) {
    if $tail {
      let args = if $last != null {
        ["--lines" $last]
      } else {
        []
      }

      pueue follow ...$ids
    } else {
      let args = if $last != null {
        ["--lines" $last]
      } else {
        []
      }

      process_raw (pueue log --full --json ...$args ...$ids)
      | first
    }
  } else {
    if $tail {
      echo $"(ansi red)--tail can only be used with one task.(ansi reset)"
      return
    }

    let args = if $last != null {
      ["--lines" $last]
    } else {
      []
    }

    process_raw (pueue log --full --json ...$args ...$ids)
  }
}

# Wait until the provided tasks are finished.
#
# This is like join() or await in many languages.
export def wait [
  ...ids: int           # IDs of the tasks to wait for.
  --group (-g): string  # Wait for all tasks in a specific group.
  --all (-a)            # Wait for all tasks across all groups and the default group.
  --quiet (-q)          # Don't show any log output while waiting.
  --status (-s): string # Wait for tasks to reach a specific task status.
] {
  mut args = []

  if $group != null {
    $args = ($args | prepend ["--group" $group])
  }
  if $all {
    $args = ($args | prepend $all)
  }
  if $quiet {
    $args = ($args | prepend $quiet)
  }
  if $status != null {
    $args = ($args | prepend ["--status" $status])
  }

  pueue wait ...$args ...$ids
}

# Remove tasks from the status list.
export def clean [
  --successful-only (-s) # Only clean tasks that finished successfully
  --group (-g): string   # Only clean tasks of a specific group
] {
  mut args = []

  if $successful_only {
    $args = ($args | prepend "--successful-only")
  }
  if $group != null {
    $args = ($args | prepend ["--group" $group])
  }

  pueue clean ...$args
}

# Shutdown pueue and thus this module.
export def shutdown [] {
  pueue shutdown
}

# Set the maximum parallel tasks for a group.
#
# Note that no tasks will be stopped if the number is lowered.
# The limit only applies when schelduing.
export def set-parallel-limit [
  max: int             # The maximum parallel tasks allowed for a group when schelduing.
  --group (-g): string # The group to set the limit for. By default this is `default`.
] {
  let args = if $group != null {
    ["--group" $group]
  } else {
    []
  }

  pueue parallel ...$args $max
}
