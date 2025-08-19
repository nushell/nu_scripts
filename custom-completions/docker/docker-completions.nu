def "nu-complete docker containers" [] {
    ^docker ps -a --format "{{.ID}} {{.Names}}" | lines 
        | parse "{value} {description}"
}

def "nu-complete docker images" [] {
    ^docker images --format "{{.ID}} {{.Repository}}" | lines 
        | parse "{value} {description}"
}

def "nu-complete docker run" [] {
    (nu-complete docker images)
    | append (nu-complete docker containers)
}

def "nu-complete docker pull" [] {
    [always, missing, never]
}

def "nu-complete docker remove image" [] {
    [local, all]
}

def "nu-complete local files" [] {
    ^ls | lines
}

def "nu-complete docker compose ps" [] {
    ^docker compose ps -a --format "{{.ID}} {{.Names}}" | lines 
        | parse "{value} {description}"
}

def "nu-complete docker compose service status" [] {
    [paused restarting removing running dead created exited]
}

def "nu-complete docker subcommands" [] {
    # ^docker --help | lines | where $it =~ '^ {2}[A-Za-z]' | parse --regex '^ {2}([^\s*]+)\*?\s+.+$'
    ^docker --help | lines | where $it =~ '^ {2}[A-Za-z]' | parse --regex '^ {2}(?P<value>[^\s*]+)\*?\s+(?P<description>.+)$'
}

# Log in to a Docker registry
export extern "docker login" [
    server?: string                                     #Docker registry URL
    --password(-p): string                              #Password
    --password-stdin                                    #Take the password from stdin
    --username(-u): string                              #Username
]

# Log out from a Docker registry
export extern "docker logout" [
    server?: string                                     #Docker registry URL
]

# Search Docker Hub for images
export extern "docker search" [
    term?: string
    --filter(-f): string                                #Filter output based on conditions provided
    --format: string                                    #Pretty-print search using a Go template
    --limit: int                                        #Max number of search results
    --no-trunc                                          #Don't truncate output
]

# Show the docker  version information
export extern "docker version" [
    --format(-f): string                                #Format the output using the given Go template
    --kubeconfig: string                                #Kubernetes config file
]

# Inspect changes to files or directories on a container's filesystem
export extern "docker system events" [
    --filter(-f): string                                #Filter output based on conditions provided
    --format: string                                    #Pretty-print images using a Go template
    --since: string                                     #Show all events created since timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)
    --until: string                                     #Stream events until this timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)
]

# Attach local standard input, output, and error streams to a running container
export extern "docker container attach" [
    container?: string@"nu-complete docker containers"                                 
    --detach-keys:string                                #Override the key sequence for detaching a container   
    --no-stdin                                          #Do not attach STDIN
    --sig-proxy                                         #Proxy all received signals to the process 
]

# Create a new image from a container's changes
export extern "docker container commit" [
    container?: string@"nu-complete docker containers"
    --author(-a): string                                #Author (e.g., "John Hannibal Smith <hannibal@a-team.com>"
    --change(-c): string                                #Apply Dockerfile instruction to the created image
    --message(-m): string                               #Commit message
    --pause(-p)                                         #Pause container during commit (default true)
]

# Create a new container
export extern "docker container create" [
    image?: string@"nu-complete docker images"          #The image to create the container from
    command?: string                                     #Command to run inside the container
    ...args: string
    --add-host: string                                  #Add a custom host-to-IP mapping (host:ip)
    --annotation: string                                #Add an annotation to the container (passed through to the OCI runtime) (default map[])
    --attach: string                                    #Attach to STDIN, STDOUT or STDERR
    --blkio-weight: int                                 #Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
    --blkio-weight-device: string                       #Block IO weight (relative device weight) (default [])
    --cap-add: string                                   #Add Linux capabilities
    --cap-drop: string                                  #Drop Linux capabilities
    --cgroup-parent: string                             #Optional parent cgroup for the container
    --cgroupns: string                                  #Cgroup namespace to use (host|private)
    --cidfile: string                                   #Write the container ID to the file
    --cpu-period: int                                   #Limit CPU CFS (Completely Fair Scheduler) period
    --cpu-quota: int                                    #Limit CPU CFS (Completely Fair Scheduler) quota
    --cpu-rt-period: int                                #Limit CPU real-time period in microseconds
    --cpu-rt-runtime: int                               #Limit CPU real-time runtime in microseconds
    --cpu-shares(-c): int                               #CPU shares (relative weight)
    --cpus: int                                         #Number of CPUs
    --cpuset-cpus: string                               #CPUs in which to allow execution (0-3, 0,1)
    --cpuset-mems: string                               #MEMs in which to allow execution (0-3, 0,1)
    --detach(-d)                                        #Run container in background and print container ID
    --detach-keys: string                               #Override the key sequence for detaching a container
    --device: string                                    #Add a host device to the container
    --device-cgroup-rule: string                        #Add a rule to the cgroup allowed devices list
    --device-read-bps: int                              #Limit read rate (bytes per second) from a device (default [])
    --device-read-iops: int                             #Limit read rate (IO per second) from a device (default [])
    --device-write-bps: int                             #Limit write rate (bytes per second) to a device (default [])
    --device-write-iops: int                            #Limit write rate (IO per second) to a device (default [])
    --disable-content-trust                             #Skip image verification (default true)
    --dns: int                                          #Set custom DNS servers
    --dns-option: string                                #Set DNS options
    --dns-search: string                                #Set custom DNS search domains
    --domainname: string                                #Container NIS domain name
    --entrypoint: string                                #Overwrite the default ENTRYPOINT of the image
    --env(-e): string                                   #Set environment variables
    --env-file: string                                  #Read in a file of environment variables
    --expose: string                                    #Expose a port or a range of ports
    --gpus: string                                      #GPU devices to add to the container ('all' to pass all GPUs)
    --group-add: string                                 #Add additional groups to join
    --health-cmd: string                                #Command to run to check health
    --health-interval: duration                         #Time between running the check (ms|s|m|h) (default 0s)
    --health-retries: int                               #Consecutive failures needed to report unhealthy
    --health-start-interval: duration                   #Time between running the check during the start period (ms|s|m|h) (default 0s)
    --health-start-period: duration                     #Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)
    --health-timeout: duration                          #Maximum time to allow one check to run (ms|s|m|h) (default 0s)
    --help                                              #Print usage
    --hostname(-h): string                              #Container host name
    --init                                              #Run an init inside the container that forwards signals and reaps processes
    --interactive(-i)                                   #Keep STDIN open even if not attached
    --ip: string                                        #IPv4 address (e.g., 172.30.100.104)
    --ip6: string                                       #IPv6 address (e.g., 2001:db8::33)
    --ipc: string                                       #IPC mode to use
    --isolation: string                                 #Container isolation technology
    --kernel-memory: int                                #Kernel memory limit
    --label(-l): string                                 #Set meta data on a container
    --label-file: string                                #Read in a line delimited file of labels
    --link: string                                      #Add link to another container
    --link-local-ip: string                             #Container IPv4/IPv6 link-local addresses
    --log-driver: string                                #Logging driver for the container
    --log-opt: string                                   #Log driver options
    --mac-address: string                               #Container MAC address (e.g., 92:d0:c6:0a:29:33)
    --memory(-m): int                                   #Memory limit
    --memory-reservation: int                           #Memory soft limit
    --memory-swap: int                                  #Swap limit equal to memory plus swap: '-1' to enable unlimited swap
    --memory-swappiness: int                            #Tune container memory swappiness (0 to 100) (default -1)
    --mount: string                                     #Attach a filesystem mount to the container
    --name: string                                      #Assign a name to the container
    --network: string                                   #Connect a container to a network
    --network-alias: string                             #Add network-scoped alias for the container
    --no-healthcheck                                    #Disable any container-specified HEALTHCHECK
    --oom-kill-disable                                  #Disable OOM Killer
    --oom-score-adj: int                                #Tune host's OOM preferences (-1000 to 1000)
    --pid: string                                       #PID namespace to use
    --pids-limit: int                                   #Tune container pids limit (set -1 for unlimited)
    --platform: string                                  #Set platform if server is multi-platform capable
    --privileged                                        #Give extended privileges to this container
    --publish(-p): string                               #Publish a container's port(s) to the host
    --publish-all(-P)                                   #Publish all exposed ports to random ports
    --pull: string@"nu-complete docker pull"            #Pull image before running ("always", "missing", "never") (default "missing")
    --quiet(-q)                                         #Suppress the pull output
    --read-only                                         #Mount the container's root filesystem as read only
    --restart: string                                   #Restart policy to apply when a container #exits (default "no")
    --rm                                                #Automatically remove the container when it exits
    --runtime: string                                   #Runtime to use for this container
    --security-opt: string                              #Security Options
    --shm-size: int                                     #Size of /dev/shm
    --sig-proxy                                         #Proxy received signals to the process (default true)
    --stop-signal: string                               #Signal to stop the container
    --stop-timeout: int                                 #Timeout (in seconds) to stop a container
    --storage-opt: string                               #Storage driver options for the container
    --sysctl: string                                    #Sysctl options (default map[])
    --tmpfs: string                                     #Mount a tmpfs directory
    --tty(-t)                                           #Allocate a pseudo-TTY
    --ulimit: int                                       #Ulimit options (default [])
    --user(-u): string                                  #Username or UID (format: <name|uid>[:<group|gid>])
    --userns: string                                    #User namespace to use
    --uts: string                                       #UTS namespace to use
    --volume(-v): string                                #Bind mount a volume
    --volume-driver: string                             #Optional volume driver for the container
    --volumes-from: string                              #Mount volumes from the specified container(s)
    --workdir(-w): string                               #Working directory inside the container
]

# Inspect changes to files or directories on a container's filesystem
export extern "docker container diff" [
    container?: string@"nu-complete docker containers"
]

# Run a command in a running container
export extern "docker container exec" [
    container?: string@"nu-complete docker containers"
    --detach(-d)                                        #Detached mode: run command in the background
    --env(-e): string                                   #Set environment variables
    --interactive(-i)                                   #Keep STDIN open even if not attached
    --privileged                                        #Give extended privileges to the command
    --tty(-t)                                           #Allocate a pseudo-TTY
    --user(-u): string                                  #Username or UID (format: <name|uid>[:<group|gid>])
    --workdir(-w): string                               #Working directory inside the container
]

# Export a container's filesystem as a tar archive
export extern "docker container export" [
    container?: string@"nu-complete docker containers"
    --output(-o): string                                #Write to a file, instead of STDOUT
]

# Display detailed information on one or more containers
export extern "docker container inspect" [
    container?: string@"nu-complete docker containers"
    --format(-f):string                                 #Format the output using the given Go template
    --size(-s)                                          #Display total file sizes
    --type:string                                       #Return JSON for specified type
]

# Kill one or more running containers
export extern "docker container kill" [
    container?: string@"nu-complete docker containers"
    --signal(-s):string                                 #Signal to send to the container
]

# Fetch the logs of a container
export extern "docker container logs" [
    container?: string@"nu-complete docker containers"
    --details                                           #Show extra details provided to logs
    --follow(-f)                                        #Follow log output
    --since: string                                     #Show logs since timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)
    --tail(-n): string                                  #Number of lines to show from the end of the logs
    --timestamps(-t)                                    #Show timestamps
    --until: string                                     #Show logs before a timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)
]

# List containers
export extern "docker container ls" [
    --all(-a)                                           #Show all containers (default shows just running)
    --filter: string                                    #Filter output based on conditions provided
    --format: string                                    #Pretty-print containers using a Go template
    --last(-n): int                                     #Show n last created containers (includes all states) (default -1)
    --latest(-l)                                        #Show the latest created container (includes all states)
    --no-trunc                                          #Don't truncate output
    --quiet(-q)                                         #Only display numeric IDs
    --size(-s)                                          #Display total file sizes
]

# Pause all processes within one or more containers
export extern "docker container pause" [
    container?: string@"nu-complete docker containers"
]

# Remove all stopped containers
export extern "docker container prune" [
    --filter: string                                    #Provide filter values (e.g. 'until=24h')
    --force(-f)                                         #Do not prompt for confirmation
]

# List port mappings or a specific mapping for the container
export extern "docker container port" [
    container?: string@"nu-complete docker containers"
]

# Rename a container
export extern "docker container rename" [
    container?: string@"nu-complete docker containers"
    name?: string
]

# Restart one or more containers
export extern "docker container restart" [
    container?: string@"nu-complete docker containers"
    --time(-t): int                                     #Seconds to wait for stop before killing the container
    --signal(-s): string                                #Signal to stop the container
]

# Remove one or more containers
export extern "docker container rm" [
    container?: string@"nu-complete docker containers"
]

# Run a command in a new container
export extern "docker container run" [
    image?: string@"nu-complete docker run"             #The image to create the container from
    command?: string                                    #Command to run inside the container
    ...args: string
    --add-host: string                                  #Add a custom host-to-IP mapping (host:ip)
    --annotation: string                                #Add an annotation to the container (passed through to the OCI runtime) (default map[])
    --attach: string                                    #Attach to STDIN, STDOUT or STDERR
    --blkio-weight: int                                 #Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
    --blkio-weight-device: string                       #Block IO weight (relative device weight) (default [])
    --cap-add: string                                   #Add Linux capabilities
    --cap-drop: string                                  #Drop Linux capabilities
    --cgroup-parent: string                             #Optional parent cgroup for the container
    --cgroupns: string                                  #Cgroup namespace to use (host|private)
    --cidfile: string                                   #Write the container ID to the file
    --cpu-period: int                                   #Limit CPU CFS (Completely Fair Scheduler) period
    --cpu-quota: int                                    #Limit CPU CFS (Completely Fair Scheduler) quota
    --cpu-rt-period: int                                #Limit CPU real-time period in microseconds
    --cpu-rt-runtime: int                               #Limit CPU real-time runtime in microseconds
    --cpu-shares(-c): int                               #CPU shares (relative weight)
    --cpus: int                                         #Number of CPUs
    --cpuset-cpus: string                               #CPUs in which to allow execution (0-3, 0,1)
    --cpuset-mems: string                               #MEMs in which to allow execution (0-3, 0,1)
    --detach(-d)                                        #Run container in background and print container ID
    --detach-keys: string                               #Override the key sequence for detaching a container
    --device: string                                    #Add a host device to the container
    --device-cgroup-rule: string                        #Add a rule to the cgroup allowed devices int
    --device-read-bps: int                              #Limit read rate (bytes per second) from a device (default [])
    --device-read-iops: int                             #Limit read rate (IO per second) from a device (default [])
    --device-write-bps: int                             #Limit write rate (bytes per second) to a device (default [])
    --device-write-iops: int                            #Limit write rate (IO per second) to a device (default [])
    --disable-content-trust                             #Skip image verification (default true)
    --dns: int                                          #Set custom DNS servers
    --dns-option: string                                #Set DNS options
    --dns-search: string                                #Set custom DNS search domains
    --domainname: string                                #Container NIS domain name
    --entrypoint: string                                #Overwrite the default ENTRYPOINT of the image
    --env(-e): string                                   #Set environment variables
    --env-file: string                                  #Read in a file of environment variables
    --expose: string                                    #Expose a port or a range of ports
    --gpus: string                                      #GPU devices to add to the container ('all' to pass all GPUs)
    --group-add: string                                 #Add additional groups to join
    --health-cmd: string                                #Command to run to check health
    --health-interval: duration                         #Time between running the check (ms|s|m|h) (default 0s)
    --health-retries: int                               #Consecutive failures needed to report unhealthy
    --health-start-interval: duration                   #Time between running the check during the start period (ms|s|m|h) (default 0s)
    --health-start-period: duration                     #Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)
    --health-timeout: duration                          #Maximum time to allow one check to run (ms|s|m|h) (default 0s)
    --help                                              #Print usage
    --hostname(-h): string                              #Container host name
    --init                                              #Run an init inside the container that forwards signals and reaps processes
    --interactive(-i)                                   #Keep STDIN open even if not attached
    --ip: string                                        #IPv4 address (e.g., 172.30.100.104)
    --ip6: string                                       #IPv6 address (e.g., 2001:db8::33)
    --ipc: string                                       #IPC mode to use
    --isolation: string                                 #Container isolation technology
    --kernel-memory: int                                #Kernel memory limit
    --label(-l): string                                 #Set meta data on a container
    --label-file: string                                #Read in a line delimited file of labels
    --link: string                                      #Add link to another container
    --link-local-ip: string                             #Container IPv4/IPv6 link-local addresses
    --log-driver: string                                #Logging driver for the container
    --log-opt: string                                   #Log driver options
    --mac-address: string                               #Container MAC address (e.g., 92:d0:c6:0a:29:33)
    --memory(-m): int                                   #Memory limit
    --memory-reservation: int                           #Memory soft limit
    --memory-swap: int                                  #Swap limit equal to memory plus swap: '-1' to enable unlimited swap
    --memory-swappiness: int                            #Tune container memory swappiness (0 to 100) (default -1)
    --mount: string                                     #Attach a filesystem mount to the container
    --name: string                                      #Assign a name to the container
    --network: string                                   #Connect a container to a network
    --network-alias: string                             #Add network-scoped alias for the container
    --no-healthcheck                                    #Disable any container-specified HEALTHCHECK
    --oom-kill-disable                                  #Disable OOM Killer
    --oom-score-adj: int                                #Tune host's OOM preferences (-1000 to 1000)
    --pid: string                                       #PID namespace to use
    --pids-limit: int                                   #Tune container pids limit (set -1 for unlimited)
    --platform: string                                  #Set platform if server is multi-platform capable
    --privileged                                        #Give extended privileges to this container
    --publish(-p): string                               #Publish a container's port(s) to the host
    --publish-all(-P)                                   #Publish all exposed ports to random ports
    --pull: string@"nu-complete docker pull"            #Pull image before running ("always", "missing", "never") (default "missing")
    --quiet(-q)                                         #Suppress the pull output
    --read-only                                         #Mount the container's root filesystem as read only
    --restart: string                                   #Restart policy to apply when a container #exits (default "no")
    --rm                                                #Automatically remove the container when it exits
    --runtime: string                                   #Runtime to use for this container
    --security-opt: string                              #Security Options
    --shm-size: int                                     #Size of /dev/shm
    --sig-proxy                                         #Proxy received signals to the process (default true)
    --stop-signal: string                               #Signal to stop the container
    --stop-timeout: int                                 #Timeout (in seconds) to stop a container
    --storage-opt: string                               #Storage driver options for the container
    --sysctl: string                                    #Sysctl options (default map[])
    --tmpfs: string                                     #Mount a tmpfs directory
    --tty(-t)                                           #Allocate a pseudo-TTY
    --ulimit: int                                       #Ulimit options (default [])
    --user(-u): string                                  #Username or UID (format: <name|uid>[:<group|gid>])
    --userns: string                                    #User namespace to use
    --uts: string                                       #UTS namespace to use
    --volume(-v): string                                #Bind mount a volume
    --volume-driver: string                             #Optional volume driver for the container
    --volumes-from: string                              #Mount volumes from the specified container(s)
    --workdir(-w): string                               #Working directory inside the container
]

# Start one or more stopped containers
export extern "docker container start" [
    container?: string@"nu-complete docker containers"
    --attach(-a)                                        #Attach STDOUT/STDERR and forward signals
    --interactive(-i)                                   #Attach container's STDIN
    --detach-keys: string                               #Override the key sequence for detaching a container
]

# Display a live stream of container(s) resource usage statistics
export extern "docker container stats" [
    container?: string@"nu-complete docker containers"
    --all(-a)                                           #Show all containers (default shows just running)
    --format: string                                    #Pretty-print images using a Go template
    --no-stream                                         #Disable streaming stats and only pull the first result
    --no-trunc                                          #Do not truncate output
]

# Stop one or more running containers
export extern "docker container stop" [
    container?: string@"nu-complete docker containers"
    --time(-t): int                                     #Seconds to wait for stop before killing the container
    --signal(-s): int                                   #Signal to stop the container
]

# Display the running processes of a container
export extern "docker container top" [
    container?: string@"nu-complete docker containers"
]

# Unpause all processes within one or more containers
export extern "docker container unpause" [
    container?: string@"nu-complete docker containers"
]

# Update configuration of one or more containers
export extern "docker container update" [
    container?: string@"nu-complete docker containers"
    --blkio-weight: int                                 #Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
    --cpu-period: int                                   #Limit CPU CFS (Completely Fair Scheduler) period
    --cpu-quota: int                                    #Limit CPU CFS (Completely Fair Scheduler) quota
    --cpu-rt-period: int                                #Limit CPU real-time period in microseconds
    --cpu-rt-runtime: int                               #Limit CPU real-time runtime in microseconds
    --cpu-shares(-c): int                               #CPU shares (relative weight)
    --cpus: float                                       #Number of CPUs
    --cpuset-cpus: string                               #CPUs in which to allow execution (0-3, 0,1)
    --cpuset-mems: string                               #MEMs in which to allow execution (0-3, 0,1)
    --memory(-m): binary                                #Memory limit
    --memory-reservation: binary                        #Memory soft limit
    --memory-swap: binary                               #Swap limit equal to memory plus swap: '-1' to enable unlimited swap
    --pids-limit: int                                   #Tune container pids limit (set -1 for unlimited)
    --restart: string                                   #Restart policy to apply when a container #exits (default "no")
]

# Block until one or more containers stop, then print their exit codes
export extern "docker container wait" [
    container?: string@"nu-complete docker containers"
]

# Build an image from a Dockerfile
export extern "docker image build" [
    --add-host: string                                  #Add a custom host-to-IP mapping (host:ip)
    --build-arg: string                                 #Set build-time variables
    --cache-from: string                                #Images to consider as cache sources
    --cgroup-parent: string                             #Optional parent cgroup for the container
    --compress                                          #Compress the build context using gzip
    --file(-f): string@"nu-complete local files"        #Name of the Dockerfile (Default is 'PATH/Dockerfile')
    --iidfile: string                                   #Write the image ID to the file
    --isolation: string                                 #Container isolation technology
    --label: string                                     #Set metadata for an image
    --network: string                                   #Set the networking mode for the RUN instructions during build (default "default")
    --no-cache                                          #Do not use cache when building the image
    --platform: string                                  #Set platform if server is multi-platform capable
    --progress: string                                  #Set type of progress output (auto, plain, tty). Use plain to show container output
    --pull                                              #Always attempt to pull a newer version of the image
    --quiet(-q)                                         #Suppress the build output and print image ID on success
    --secret: string                                     #Secret file to expose to the build (only if BuildKit enabled): id=mysecret,src=/local/secret
    --ssh: string                                       #SSH agent socket or keys to expose to the build (only if BuildKit enabled)
    --tag(-t): string                                   #Name and optionally a tag in the 'name:tag' format
    --target: string                                    #Set the target build stage to build
    --ulimit: string                                    #Ulimit options (default [])
]

# Show the history of an images
export extern "docker image history" [
    image?: string@"nu-complete docker images"
    --format: string                                    #Pretty-print images using a Go template
    --no-trunc                                          #Don't truncate output
    --quiet(-q)                                         #Only show numeric IDs
]

# Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
export extern "docker image tag" [
    source?: string@"nu-complete docker images"
    target?: string@"nu-complete docker images"
]

# List images
export extern "docker image ls" [
    --all(-a)                                           #Show all images (default hides intermediate images)
    --digests                                           #Show digests
    --filter: string                                    #Filter output based on conditions provided
    --format: string                                    #Pretty-print images using a Go template
    --no-trunc                                          #Don't truncate output
    --quiet(-q)                                         #Only show numeric IDs
]

# Download an image from a registry
export extern "docker image pull" [
    image?: string@"nu-complete docker images"
    --all-tags(-a)                                      #Push all tags of the specified image
    --disable-content-trust                             #Skip image verification (default true)
    --plataform: string                                 #Set platform if server is multi-platform capable
    --quiet(-q)                                         #Suppress the push output
]

# Upload an image to a registry
export extern "docker image push" [
    image?: string@"nu-complete docker images"
    --all-tags(-a)                                      #Push all tags of the specified image
    --disable-content-trust                             #Skip image verification (default true)
    --quiet(-q)                                         #Suppress the push output
]

# Save one or more images to a tar archive (streamed to STDOUT by default)
export extern "docker image save" [
    image?: string@"nu-complete docker images"
    --output(-o): string                                #Write to a file, instead of STDOUT
]

# Delete one or more docker image
export extern "docker image rm" [
    ...image: string@"nu-complete docker images"
    --force(-f)                                         #Force removal of the image
    --no-prune                                          #Do not delete untagged parents
]

# Extended build capabilities with BuildKit
export extern "docker buildx" [
    --builder: string                                   #Override the configured builder instance (default "default")
]

# Stop and remove containers, networks
export extern "docker compose down" [
    --dry-run                                           #Execute command in dry run mode
    --remove-orphans                                    #Remove containers for services not defined in the Compose file
    --rmi: string@"nu-complete docker remove image"     #Remove images used by services. "local" remove only images that don't have a custom tag ("local"|"all")
    --timeout(-t): int                                  #Specify a shutdown timeout in seconds
    --volumes(-v)                                       #Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers
]

# List containers
export extern "docker compose ps" [
    --all(-a)                                           #Show all stopped containers (including those created by the run command)
    --dry-run                                           #Execute command in dry run mode
    --filter: string                                    #Filter services by a property (supported filters: status)
    --format: string                                    #Format output using a custom template: 'table': Print output in table; format with column headers (default) 'table TEMPLATE': Print output in table; format using the given Go template 'json': Print in JSON format; 'TEMPLATE': Print output using the given Go template; Refer to https://docs.docker.com/go/formatting/ for more information about formatting output with templates (default "table")
    --no-truncate                                       #Don't truncate output
    --orphans                                           #Include orphaned services (not declared by project) (default true)
    --quite(-q)                                         #Only display IDs
    --services                                          #Display services
    --status: string@"nu-complete docker compose service status" #Filter services by status. Values: [paused | restarting | removing | running | dead | created | exited]
]

# Stop containers
export extern "docker compose stop" [
    --dry-run                                           #Execute command in dry run mode
    --timeout(-t): int                                  #Specify a shutdown timeout in seconds
]

# Restart service containers
export extern "docker compose restart" [
    --dry-run                                           #Execute command in dry run mode
    --no-deps                                           #Don't restart dependent services
    --timeout(-t): int                                  #Specify a shutdown timeout in seconds
]

# Create and start containers
export extern "docker compose up" [
    --abort-on-container-exit                           #Stops all containers if any container was stopped. Incompatible with -d/--detach
    --abort-on-container-failure                        #Stops all containers if any container had a non-zero exit code. Incompatible with -d/--detach
    --always-recreate-deps                              #Recreate dependent containers. Incompatible with --no-recreate
    --attach: string                                    #Restrict attaching to the specified services. Incompatible with --attach-dependencies
    --attach-dependencies                               #Automatically attach to log output of all dependent services
    --build                                             #Build images before starting containers
    --detach(-d)                                        #Detached mode: Run containers in the background
    --dry-run                                           #Execute command in dry run mode
    --exit-code-from: string                            #Return the exit code of the selected service container. Implies --abort-on-container-exit
    --force-recreate                                    #Recreate containers even if their configuration and image haven't changed
    --menu                                              #Enable interactive shortcuts when running attached. Incompatible with --detach. Can also be enable/disable
    --no-attach: string                                 #Do not attach (stream logs) to the specified services
    --no-build                                          #Don't build an image, even if it's policy
    --no-color                                          #Produce monochrome output
    --no-deps                                           #Don't start linked services
    --no-log-prefix                                     #Don't print prefix in logs
    --no-recreate                                       #If containers already exist, don't recreate them. Incompatible with --force-recreate
    --no-start                                          #Don't start the services after creating them
    --pull: string@"nu-complete docker pull"            #Pull image before running ("always"|"missing"|"never") (default "policy")
    --quite-pull                                        #Pull without printing progress information
    --remove-orphans                                    #Remove containers for services not defined in the Compose file
    --renew-anon-volumes(-V)                            #Recreate anonymous volumes instead of retrieving data from the previous containers
    # --scale: scale                                      #Scale SERVICE to NUM instances. Overrides the scale setting in the Compose file if present
    --timeout(-t): int                                  #Use this timeout in seconds for container shutdown when attached or when containers are already running
    --timestamps                                        #Show timestamps
    --wait                                              #Wait for services to be running|healthy. Implies detached mode
    --wait-timeout: int                                 #Maximum duration to wait for the project to be running|healthy
    --watch(-w)                                         #Watch source code and rebuild|refresh containers when files are updated
]

# An open-source container management platform.
export extern "docker" [
    command?: string@"nu-complete docker subcommands"   #Subcommands
    --config: string                                    #Location of client config files (default "/root/.docker")
    --context(-c): string                               #Name of the context to use to connect to the daemon (overrides DOCKER_HOST env var and default context set with "docker context use")
    --debug(-D)                                         #Enable debug mode
    --host(-H): string                                  #Daemon socket(s) to connect to
    --log-level(-l): string                             #Set the logging level ("debug"|"info"|"warn"|"error"|"fatal")
    --tls                                               #Use TLS; implied by --tlsverify
    --tlscacert: string                                 #Trust certs signed only by this CA
    --tlscert: string                                   #Path to TLS certificate file
    --tlskey: string                                    #Path to TLS key file
    --tlsverify                                         #Use TLS and verify the remote
    --version(-v)                                       #Print version information and quit
]

# Attach local standard input, output, and error streams to a running container
export alias "docker attach" = docker container attach
# Create a new image from a container's changes
export alias "docker commit" = docker container commit
export alias "docker cp" = docker container cp
# Create a new container
export alias "docker create" = docker container create
# Inspect changes to files or directories on a container's filesystem
export alias "docker diff" = docker container diff
# Execute a command in a running container
export alias "docker exec" = docker container exec
# Export a container's filesystem as a tar archive
export alias "docker export" = docker container export
# Display detailed information on one or more containers
export alias "docker inspect" = docker container inspect
# Kill one or more running containers
export alias "docker kill" = docker container kill
# Fetch the logs of a container
export alias "docker logs" = docker container logs
# Pause all processes within one or more containers
export alias "docker pause" = docker container pause
# List port mappings or a specific mapping for the container
export alias "docker port" = docker container port
# Rename a container
export alias "docker rename" = docker container rename
# Restart one or more containers
export alias "docker restart" = docker container restart
# List containers
export alias "docker ps" = docker container ls
# Remove one or more containers
export alias "docker rm" = docker container rm
# Run a command in a new container
export alias "docker run" = docker container run
# Start one or more stopped containers
export alias "docker start" = docker container start
# Display a live stream of container(s) resource usage statistics
export alias "docker stats" = docker container stats
# Stop one or more running containers
export alias "docker stop" = docker container stop
# Display the running processes of a container
export alias "docker top" = docker container top
# Unpause all processes within one or more containers
export alias "docker unpause" = docker container unpause
# Update configuration of one or more containers
export alias "docker update" = docker container update
# Block until one or more containers stop, then print their exit codes
export alias "docker wait" = docker container wait

# Build an image from a Dockerfile
export alias "docker build" = docker image build
# Show the history of an image
export alias "docker history" = docker image history
# Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
export alias "docker tag" = docker image tag
# List images
export alias "docker images" = docker image ls
# Remove one or more images
export alias "docker rmi" = docker image rm
# Download an image from a registry
export alias "docker pull" = docker image pull
# Upload an image to a registry
export alias "docker push" = docker image push
# Save one or more images to a tar archive (streamed to STDOUT by default)
export alias "docker save" = docker image save

# Inspect changes to files or directories on a container's filesystem
export alias "docker events" = docker system events
