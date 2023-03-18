# Background task with pueue
make nushell "support" background task feature.

# Prerequisite
Install [pueue](https://github.com/Nukesor/pueue) and make sure `pueued` is running with default config, and, `pueue` is in `PATH`
# Usage
```nushell
use job.nu

# spawn a new job in background.
> job spawn { sleep 3sec ; echo gg | save gg.txt }

# get job status
> job status

# get one job's log
> job log $job_id

# kill one job
> job kill $job_id

# clean pueued finished job
> job clean
```