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

# Q&A
## How can I pass data to background job?

The easiest way to do is pass it by environment variable, and you can use these variables in job.

So don't do this, it doesn't work:
```nushell
let a = 3
job spawn {
    echo $a
}
```

Instead, doing this:
```nushell
let a = 3
with-env {"a": 3} {
    job spawn {
        echo $env.a
    }
}
```

But what if I want to pass nushell's structure data to background job?

You can serialize it to env variable, and then deserialize it in background job.

```nushell
let a = [1, 2, 3]
with-env {"a": ($a | to json)} {
    job spawn {
        let a = ($env.a | from json)
        echo $a
    }
}
```

## How can I reuse custom commands in background job?

You can defined these custom commands in a module, then you can use the module inside the job.

So don't do this, it won't work:
```nushell
def custom [] { echo 3 }
job spawn {
    custom      # custom is not defined
}
```

Instead, do this:
```nushell
# a.nu
export def custom [] { echo 3 }

# main.nu
job spawn {
    use a.nu
    a custom
}
```