def "nu-complete podman containers" [] {
    ^podman ps -a --format "{{.ID}} {{.Names}}" | lines 
        | parse "{value} {description}"
}

def "nu-complete podman images" [] {
    ^podman images --format "{{.ID}} {{.Repository}}" | lines 
        | parse "{value} {description}"
}

def "nu-complete podman run" [] {
    (nu-complete podman images)
    | append (nu-complete podman containers)
}

def "nu-complete podman pull" [] {
    [always, missing, never]
}

def "nu-complete podman remove image" [] {
    [local, all]
}

def "nu-complete local files" [] {
    ^ls | lines
}

def "nu-complete podman compose ps" [] {
    ^podman compose ps -a --format "{{.ID}} {{.Names}}" | lines 
        | parse "{value} {description}"
}

def "nu-complete podman compose service status" [] {
    [paused restarting removing running dead created exited]
}

def "nu-complete podman subcommands" [] {
    ^podman --help | lines | where $it =~ '^ {2}[A-Za-z]' | parse --regex '^ {2}(?P<value>[^\s*]+)\*?\s+(?P<description>.+)$'
}

def "nu-complete podman compose subcommands" [] {
    ^podman compose --help | lines | where $it =~ '^ {4}[A-Za-z]' | parse --regex '^ {4}(?P<value>[^\s*]+)\*?\s+(?P<description>.+)$'
}

# Log in to a container registry
export extern "podman login" [
    registry?: string                                   #Container registry URL
    --authfile: string                                  #Path of the authentication file. Use REGISTRY_AUTH_FILE environment variable to override
    --cert-dir: string                                  #Use certificates at the specified path to access the registry
    --compat-auth-file: string                          #Path of a Docker-compatible config file to update instead
    --password(-p): string                              #Password
    --password-stdin                                    #Take the password from stdin
    --username(-u): string                              #Username
    --get-login                                         #Return the current login user for the registry
    --secret: string                                    #Retrieve password from a podman secret
    --tls-verify                                        #Require HTTPS and verify certificates when contacting registries
    --verbose(-v)                                       #Write more detailed information to stdout
]

# Log out from a Podman registry
export extern "podman logout" [
    registry?: string                                   #Container registry URL
    --all(-a)                                           #Remove the cached credentials for all registries in the auth file
    --authfile: string                                  #Path of the authentication file. Use REGISTRY_AUTH_FILE environment variable to override
    --compat-auth-file: path                            #Path of a Docker-compatible config file to update instead
]

# Search registry for image
export extern "podman search" [
  --authfile: string                                    #Path of the authentication file. Use REGISTRY_AUTH_FILE environment variable to override
  --cert-dir: path                                      #Pathname of a directory containing TLS certificates and keys
  --compatible                                          #List stars, official and automated columns (Docker compatibility)
  --creds: string                                       #Credentials (USERNAME:PASSWORD) to use for authenticating to a registry
  --filter(-f): string                                  #Filter output based on conditions provided
  --format: string                                      #Change the output format to JSON or a Go template
  --limit: int                                          #Limit the number of results
  --list-tags                                           #List the tags of the input registry
  --no-trunc                                            #Do not truncate the output
  --tls-verify                                          #Require HTTPS and verify certificates when contacting registries
]

# Show the podman  version information
export extern "podman version" [
    --format(-f): string                                #Format the output using the given Go template
]

# Inspect changes to files or directories on a container's filesystem
export extern "podman system events" [
    --filter(-f): string                                #Filter output based on conditions provided
    --format: string                                    #Pretty-print images using a Go template
    --no-trunc                                          #Don't truncate output
    --since: string                                     #Show all events created since timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)
    --stream                                            #Stream events and do not exit when returning the last known event (default true)
    --until: string                                     #Stream events until this timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)
]

# Attach local standard input, output, and error streams to a running container
export extern "podman container attach" [
    container?: string@"nu-complete podman containers"
    --detach-keys:string                                #Override the key sequence for detaching a container   
    --latest(-l)                                        #Act on the latest container podman is aware of
    --no-stdin                                          #Do not attach STDIN
    --sig-proxy                                         #Proxy all received signals to the process 
]

# Create a new image from a container's changes
export extern "podman container commit" [
    container?: string@"nu-complete podman containers"
    --author(-a): string                                #Author (e.g., "John Hannibal Smith <hannibal@a-team.com>"
    --change(-c): string                                #Apply Podmanfile instruction to the created image
    --config: path                                      #File containing a container configuration to merge into the image
    --format(-f): string                                #Format of the image manifest and metadata (default "oci")
    --iidfile: string                                   #File to write the image ID to
    --include-volumes                                   #Include container volumes as image volumes
    --message(-m): string                               #Commit message
    --pause(-p)                                         #Pause container during commit (default true)
    --quiet(-q)                                         #Suppress output
    --squash(-s)                                        #Squash newly built layers into a single new layer
]

# Create a new container
export extern "podman container create" [
    image?: string@"nu-complete podman images"          #The image to create the container from
    command?: string                                    #Command to run inside the container
    ...args: string
    --add-host: string                                  #Add a custom host-to-IP mapping (host:ip)
    --annotation: string                                #Add an annotation to the container (passed through to the OCI runtime) (default map[])
    --attach: string                                    #Attach to STDIN, STDOUT or STDERR
    --arch: string                                      #Use ARCH instead of the architecture of the machine for choosing images
    --blkio-weight: int                                 #Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
    --blkio-weight-device: string                       #Block IO weight (relative device weight) (default [])
    --cap-add: string                                   #Add Linux capabilities
    --cap-drop: string                                  #Drop Linux capabilities
    --cert-dir: string                                  #Pathname of a directory containing TLS certificates and keys
    --cgroup-conf: string                               #Configure cgroup v2 (key=value)
    --cgroup-parent: string                             #Optional parent cgroup for the container
    --cgroupns: string                                  #Cgroup namespace to use (host|private)
    --cgroups: string                                   #Control container cgroup configuration ("enabled"|"disabled"|"no-conmon"|"split") (default "enabled")
    --chrootdirs: string                                #Chroot directories inside the container
    --cidfile: string                                   #Write the container ID to the file
    --conmon-pidfile: string                            #Path to the file that will receive the PID of conmon
    --cpu-period: int                                   #Limit CPU CFS (Completely Fair Scheduler) period
    --cpu-quota: int                                    #Limit CPU CFS (Completely Fair Scheduler) quota
    --cpu-rt-period: int                                #Limit CPU real-time period in microseconds
    --cpu-rt-runtime: int                               #Limit CPU real-time runtime in microseconds
    --cpu-shares(-c): int                               #CPU shares (relative weight)
    --cpus: int                                         #Number of CPUs
    --cpuset-cpus: string                               #CPUs in which to allow execution (0-3, 0,1)
    --cpuset-mems: string                               #MEMs in which to allow execution (0-3, 0,1)
    --creds: string                                     #Credentials (USERNAME:PASSWORD) to use for authenticating to a registry
    --decryption-key: string                            #Key needed to decrypt the image (e.g. /path/to/key.pem)
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
    --entrypoint: string                                #Overwrite the default ENTRYPOINT of the image
    --env(-e): string                                   #Set environment variables
    --env-file: string                                  #Read in a file of environment variables
    --env-host                                          #Use all current host environment variables in container
    --env-merge: string                                 #Preprocess environment variables from image before injecting them into the container
    --expose: string                                    #Expose a port or a range of ports
    --gidmap: string                                    #GID map to use for the user namespace
    --gpus: string                                      #GPU devices to add to the container ('all' to pass all GPUs)
    --group-add: string                                 #Add additional groups to join
    --group-entry: string                               #Entry to write to /etc/group
    --health-cmd: string                                #Command to run to check health
    --health-interval: duration                         #Time between running the check (ms|s|m|h) (default 0s)
    --health-log-destination: string                    #Set the destination of the HealthCheck log. Directory path, local or events_logger (local use container state file)  (default "local")
    --health-max-log-count: int                         #Set maximum number of attempts in the HealthCheck log file. ('0' value means an infinite number of attempts in the log file) (default 5)
    --health-max-log-size: int                          #Set maximum length in characters of stored HealthCheck log. ('0' value means an infinite log length) (default 500)
    --health-on-failure: string                         #Action to take once the container turns unhealthy (default "none")
    --health-retries: int                               #Consecutive failures needed to report unhealthy
    --health-startup-cmd: string                        #Set a startup healthcheck command for the container
    --health-start-interval: duration                   #Time between running the check during the start period (ms|s|m|h) (default 0s)
    --health-start-period: duration                     #Start period for the container to initialize before starting health-retries countdown (ms|s|m|h) (default 0s)
    --health-startup-retries: int                       #Set the maximum number of retries before the startup healthcheck will restart the container
    --health-startup-success: int                       #Set the number of consecutive successes before the startup healthcheck is marked as successful and the normal healthcheck begins (0 indicates any success will start the regular healthcheck)
    --health-startup-timeout: string                    #Set the maximum amount of time that the startup healthcheck may take before it is considered failed (default "30s")
    --health-timeout: duration                          #Maximum time to allow one check to run (ms|s|m|h) (default 0s)
    --hostname(-h): string                              #Container host name
    --hosts-file: string                                #Base file to create the /etc/hosts file inside the container, or one of the special values. ("image"|"none")
    --hostuser: string                                  #Host user account to add to /etc/passwd within container
    --http-proxy                                        #Set proxy environment variables in the container based on the host proxy vars (default true)
    --image-volume: string                              #Tells podman how to handle the builtin image volumes ("bind"|"tmpfs"|"ignore") (default "anonymous")
    --init                                              #Run an init inside the container that forwards signals and reaps processes
    --init-ctr: string                                  #Make this a pod init container.
    --init-path: string                                 #Path to the container-init binary
    --interactive(-i)                                   #Keep STDIN open even if not attached
    --ip: string                                        #IPv4 address (e.g., 172.30.100.104)
    --ip6: string                                       #IPv6 address (e.g., 2001:db8::33)
    --ipc: string                                       #IPC mode to use
    --label(-l): string                                 #Set meta data on a container
    --label-file: string                                #Read in a line delimited file of labels
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
    --no-hostname                                       #Do not create /etc/hostname within the container, instead use the version from the image
    --no-hosts                                          #Do not create /etc/hosts within the container, instead use the version from the image
    --oom-kill-disable                                  #Disable OOM Killer
    --oom-score-adj: int                                #Tune host's OOM preferences (-1000 to 1000)
    --os: string                                        #Use OS instead of the running OS for choosing images
    --passwd-entry: string                              #Entry to write to /etc/passwd
    --personality: string                               #Configure execution domain using personality (e.g., LINUX/LINUX32)
    --pid: string                                       #PID namespace to use
    --pidfile: string                                   #Write the container process ID to the file
    --pids-limit: int                                   #Tune container pids limit (set -1 for unlimited)
    --platform: string                                  #Set platform if server is multi-platform capable
    --pod: string                                       #Run container in an existing pod
    --pod-id-file: string                               #Read the pod ID from the file
    --privileged                                        #Give extended privileges to this container
    --publish(-p): string                               #Publish a container's port(s) to the host
    --publish-all(-P)                                   #Publish all exposed ports to random ports
    --pull: string@"nu-complete podman pull"            #Pull image before running ("always", "missing", "never") (default "missing")
    --quiet(-q)                                         #Suppress the pull output
    --rdt-class: string                                 #Class of Service (COS) that the container should be assigned to
    --read-only                                         #Mount the container's root filesystem as read only
    --read-only-tmpfs                                   #When running --read-only containers mount read-write tmpfs on /dev, /dev/shm, /run, /tmp and /var/tmp (default true)
    --replace                                           #If a container with the same name exists, replace it
    --requires: string                                  #Add one or more requirement containers that must be started before this container will start
    --restart: string                                   #Restart policy to apply when a container #exits (default "no")
    --retry: int                                        #number of times to retry in case of failure when performing pull (default 3)
    --retry-delay: string                               #Delay between retries in case of pull failures
    --rm                                                #Automatically remove the container when it exits
    --rootfs                                            #The first argument is not an image but the rootfs to the exploded container
    --sdnotify: string                                  #Control sd-notify behavior ("container"|"conmon"|"healthy"|"ignore") (default "container")
    --seccomp-policy: string                            #Policy for selecting a seccomp profile (experimental) (default "default")
    --secret: string                                    #Add secret to container
    --security-opt: string                              #Security Options
    --shm-size: int                                     #Size of /dev/shm
    --shm-size-systemd: int                             #Size of systemd specific tmpfs mounts (/run, /run/lock) (format: <number>[<unit>], where unit = b (bytes), k (kibibytes), m (mebibytes), or g (gibibytes))
    --stop-signal: string                               #Signal to stop the container
    --stop-timeout: int                                 #Timeout (in seconds) to stop a container
    --subgidname: string                                #Name of range listed in /etc/subgid for use in user namespace
    --subuidname: string                                #Name of range listed in /etc/subuid for use in user namespace
    --storage-opt: string                               #Storage driver options for the container
    --sysctl: string                                    #Sysctl options (default map[])
    --systemd: string                                   #Run container in systemd mode ("true"|"false"|"always") (default "true")
    --timeout: int                                      #Maximum length of time a container is allowed to run. The container will be killed automatically after the time expires.
    --tls-verify                                        #Require HTTPS and verify certificates when contacting registries for pulling images
    --tmpfs: string                                     #Mount a tmpfs directory
    --tty(-t)                                           #Allocate a pseudo-TTY
    --tz: string                                        #Set timezone in container
    --uidmap: string                                    #UID map to use for the user namespace
    --ulimit: string                                    #Ulimit options
    --umask: string                                     #Set umask in container (default "0022")
    --unsetenv: string                                  #Unset environment default variables in container
    --unsetenv-all                                      #Unset all default environment variables in container
    --ulimit: int                                       #Ulimit options (default [])
    --user(-u): string                                  #Username or UID (format: <name|uid>[:<group|gid>])
    --userns: string                                    #User namespace to use
    --uts: string                                       #UTS namespace to use
    --variant: string                                   #Use VARIANT instead of the running architecture variant for choosing images
    --volume(-v): string                                #Bind mount a volume
    --volumes-from: string                              #Mount volumes from the specified container(s)
    --workdir(-w): string                               #Working directory inside the container
]

# Inspect changes to files or directories on a container's filesystem
export extern "podman container diff" [
    container?: string@"nu-complete podman containers"
    --format: string                                    #Change the output format (json)
    --latest(-l)                                        #Act on the latest container podman is aware of Not supported with the "--remote" flag
]

# Run a command in a running container
export extern "podman container exec" [
    container?: string@"nu-complete podman containers"
    --cidfile: string                                   #File to read the container ID from
    --detach(-d)                                        #Detached mode: run command in the background
    --detach-keys: string                               #Select the key sequence for detaching a container. Format is a single character [a-Z] or ctrl-<value> where <value> is one of: a-z, @, ^, [, , or _ (default "ctrl-p,ctrl-q")
    --env(-e): string                                   #Set environment variables
    --env-file: string                                  #Read in a file of environment variables
    --interactive(-i)                                   #Keep STDIN open even if not attached
    --latest(-l)                                        #Act on the latest container podman is aware of Not supported with the "--remote" flag
    --preserve-fd: int                                  #Pass a list of additional file descriptors to the container (default [])
    --preserve-fds: int                                 #Pass N additional file descriptors to the container
    --privileged                                        #Give the process extended Linux capabilities inside the container.  The default is false
    --tty(-t)                                           #Allocate a pseudo-TTY
    --user(-u): string                                  #Username or UID (format: <name|uid>[:<group|gid>])
    --workdir(-w): string                               #Working directory inside the container
]

# Export a container's filesystem as a tar archive
export extern "podman container export" [
    container?: string@"nu-complete podman containers"
    --output(-o): string                                #Write to a file, instead of STDOUT
]

# Display detailed information on one or more containers
export extern "podman container inspect" [
    container?: string@"nu-complete podman containers"
    --format(-f):string                                 #Format the output using the given Go template
    --latest(-l)                                        #Act on the latest container podman is aware of. Not supported with the "--remote" flag
    --size(-s)                                          #Display total file sizes
]

# Kill one or more running containers
export extern "podman container kill" [
    container?: string@"nu-complete podman containers"
    --all(-a)                                           #Signal all running containers
    --cidfile: string                                   #Read the container ID from the file
    --latest(-l)                                        #Act on the latest container podman is aware of. Not supported with the "--remote" flag
    --signal(-s):string                                 #Signal to send to the container
]

# Fetch the logs of a container
export extern "podman container logs" [
    container?: string@"nu-complete podman containers"
    --color                                             #Output the containers with different colors in the log.
    --follow(-f)                                        #Follow log output
    --latest(-l)                                        #Act on the latest container podman is aware of. Not supported with the "--remote" flag
    --names(-n)                                         #Output the container name in the log
    --since: string                                     #Show logs since timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)
    --tail(-n): int                                     #Number of lines to show from the end of the logs
    --timestamps(-t)                                    #Show timestamps
    --until: string                                     #Show logs before a timestamp (e.g. 2013-01-02T13:23:37) or relative (e.g. 42m for 42 minutes)
]

# List containers
export extern "podman container ls" [
    --all(-a)                                           #Show all containers (default shows just running)
    --external                                          #Show containers in storage not controlled by Podman
    --filter: string                                    #Filter output based on conditions provided
    --format: string                                    #Pretty-print containers using a Go template
    --last(-n): int                                     #Show n last created containers (includes all states) (default -1)
    --latest(-l)                                        #Show the latest created container (includes all states)
    --no-trunc                                          #Don't truncate output
    --noheading                                         #Do not print headers
    --ns                                                #Display namespace information
    --quiet(-q)                                         #Only display numeric IDs
    --size(-s)                                          #Display total file sizes
    --sort: string                                      #Sort output by: command, created, id, image, names, runningfor, size, status
    --sync                                              #Sync container state with OCI runtime
    --watch(-w): int                                    #Watch the ps output on an interval in seconds
]

# Pause all processes within one or more containers
export extern "podman container pause" [
    container?: string@"nu-complete podman containers"
    --all(-a)                                           #Pause all running containers
    --cidfile: string                                   #Read the container ID from the file
    --filter(-f): string                                #Filter output based on conditions given
    --latest(-l)                                        #Act on the latest container podman is aware of. Not supported with the "--remote" flag
]

# Remove all stopped containers
export extern "podman container prune" [
    --filter: string                                    #Provide filter values (e.g. 'until=24h')
    --force(-f)                                         #Do not prompt for confirmation
]

# List port mappings or a specific mapping for the container
export extern "podman container port" [
    container?: string@"nu-complete podman containers"
    --all(-a)                                           #Display port information for all containers
    --latest(-l)                                        #Act on the latest container podman is aware of. Not supported with the "--remote" flag
]

# Rename a container
export extern "podman container rename" [
    container?: string@"nu-complete podman containers"
    name?: string
]

# Restart one or more containers
export extern "podman container restart" [
    container?: string@"nu-complete podman containers"
    --all(-a)                                           #Restart all running containers
    --cidfile: string                                   #Read the container ID from the file
    --filter(-f): string                                #Filter output based on conditions given
    --latest(-l)                                        #Act on the latest container podman is aware of. Not supported with the "--remote" flag
    --running                                           #Restart only running containers
    --time(-t): int                                     #Seconds to wait for stop before killing the container
]

# Remove one or more containers
export extern "podman container rm" [
    container?: string@"nu-complete podman containers"
    --all(-a)                                           #Remove all running containers
    --cidfile: string                                   #Read the container ID from the file
    --depend                                            #Remove container and all containers that depend on the selected container
    --filter: string                                    #Filter output based on conditions given
    --force(-f)                                         #Force removal of a running or unusable container
    --ignore(-i)                                        #Ignore errors when a specified container is missing
    --latest(-l)                                        #Act on the latest container podman is aware of. Not supported with the "--remote" flag
    --time(-t): int                                     #Seconds to wait for stop before killing the container
]

# Run a command in a new container
export extern "podman container run" [
    image?: string@"nu-complete podman run"             #The image to create the container from
    command?: string                                    #Command to run inside the container
    ...args: string
    --add-host: string                                  #Add a custom host-to-IP mapping (host:ip)
    --annotation: string                                #Add an annotation to the container (passed through to the OCI runtime) (default map[])
    --attach: string                                    #Attach to STDIN, STDOUT or STDERR
    --authfile: path                                    #Path of the authentication file. Use REGISTRY_AUTH_FILE environment variable to override
    --blkio-weight: int                                 #Block IO (relative weight), between 10 and 1000, or 0 to disable (default 0)
    --blkio-weight-device: string                       #Block IO weight (relative device weight) (default [])
    --cap-add: string                                   #Add Linux capabilities
    --cap-drop: string                                  #Drop Linux capabilities
    --cert-dir: string                                  #Pathname of a directory containing TLS certificates and keys
    --cgroup-conf: string                               #Configure cgroup v2 (key=value)
    --cgroup-parent: string                             #Optional parent cgroup for the container
    --cgroupns: string                                  #Cgroup namespace to use (host|private)
    --cgroups: string                                   #Control container cgroup configuration ("enabled"|"disabled"|"no-conmon"|"split") (default "enabled")
    --chrootdirs: string                                #Chroot directories inside the container
    --cidfile: string                                   #Write the container ID to the file
    --conmon-pidfile: path                              #Path to the file that will receive the PID of conmon
    --cpu-period: int                                   #Limit CPU CFS (Completely Fair Scheduler) period
    --cpu-quota: int                                    #Limit CPU CFS (Completely Fair Scheduler) quota
    --cpu-rt-period: int                                #Limit CPU real-time period in microseconds
    --cpu-rt-runtime: int                               #Limit CPU real-time runtime in microseconds
    --cpu-shares(-c): int                               #CPU shares (relative weight)
    --cpus: int                                         #Number of CPUs
    --cpuset-cpus: string                               #CPUs in which to allow execution (0-3, 0,1)
    --cpuset-mems: string                               #MEMs in which to allow execution (0-3, 0,1)
    --creds: string                                     #Credentials (USERNAME:PASSWORD) to use for authenticating to a registry
    --decryption-key: string                            #Key needed to decrypt the image (e.g. /path/to/key.pem)
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
    --env-host                                          #Use all current host environment variables in container
    --expose: string                                    #Expose a port or a range of ports
    --gidmap: string                                    #GID map to use for the user namespace
    --gpus: string                                      #GPU devices to add to the container ('all' to pass all GPUs)
    --group-add: string                                 #Add additional groups to join
    --health-cmd: string                                #Command to run to check health
    --health-interval: duration                         #Time between running the check (ms|s|m|h) (default 0s)
    --health-log-destination: string                    #Set the destination of the HealthCheck log. Directory path, local or events_logger (local use container state file)  (default "local")
    --health-max-log-count: int                         #Set maximum number of attempts in the HealthCheck log file. ('0' value means an infinite number of attempts in the log file) (default 5)
    --health-max-log-size: int                          #Set maximum length in characters of stored HealthCheck log. ('0' value means an infinite log length) (default 500)
    --health-on-failure: string                         #Action to take once the container turns unhealthy (default "none")
    --health-retries: int                               #Consecutive failures needed to report unhealthy
    --health-start-period: duration                     #Time between running the check during the start period (ms|s|m|h) (default 0s)
    --health-startup-cmd: string                        #Set a startup healthcheck command for the container
    --health-startup-interval: string                   #Set an interval for the startup healthcheck.  (default "30s")
    --health-startup-retries: int                       #Set the maximum number of retries before the startup healthcheck will restart the container
    --health-startup-success: int                       #Set the number of consecutive successes before the startup healthcheck is marked as successful and the normal healthcheck begins (0 indicates any success will start the regular healthcheck)
    --health-startup-timeout: string                    #Set the maximum amount of time that the startup healthcheck may take before it is considered failed (default "30s")
    --health-timeout: duration                          #Maximum time to allow one check to run (ms|s|m|h) (default 0s)
    --hostname(-h): string                              #Container host name
    --hosts-file: string                                #Base file to create the /etc/hosts file inside the container, or one of the special values. ("image"|"none")
    --hostuser: string                                  #Host user account to add to /etc/passwd within container
    --http-proxy                                        #Set proxy environment variables in the container based on the host proxy vars (default true)
    --image-volume: string                              #Tells podman how to handle the builtin image volumes ("bind"|"tmpfs"|"ignore") (default "anonymous")
    --init                                              #Run an init inside the container that forwards signals and reaps processes
    --init-path: path                                   #Path to the container-init binary
    --interactive(-i)                                   #Keep STDIN open even if not attached
    --ip: string                                        #IPv4 address (e.g., 172.30.100.104)
    --ip6: string                                       #IPv6 address (e.g., 2001:db8::33)
    --ipc: string                                       #IPC mode to use
    --label(-l): string                                 #Set meta data on a container
    --label-file: string                                #Read in a line delimited file of labels
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
    --os: string                                        #Use OS instead of the running OS for choosing images
    --passwd                                            #Add entries to /etc/passwd and /etc/group (default true)
    --passwd-entry: string                              #Entry to write to /etc/passwd
    --personality: string                               #Configure execution domain using personality (e.g., LINUX/LINUX32)
    --pid: string                                       #PID namespace to use
    --pidfile: string                                   #Write the container process ID to the file
    --pids-limit: int                                   #Tune container pids limit (set -1 for unlimited)
    --platform: string                                  #Set platform if server is multi-platform capable
    --pod: string                                       #Run container in an existing pod
    --pod-id-file: string                               #Read the pod ID from the file
    --preserve-fd: int                                  #Pass a file descriptor into the container (default [])
    --preserve-fds: int                                 #Pass a number of additional file descriptors into the container
    --privileged                                        #Give extended privileges to this container
    --publish(-p): string                               #Publish a container's port(s) to the host
    --publish-all(-P)                                   #Publish all exposed ports to random ports
    --pull: string@"nu-complete podman pull"            #Pull image before running ("always", "missing", "never") (default "missing")
    --quiet(-q)                                         #Suppress the pull output
    --rdt-class: string                                 #Class of Service (COS) that the container should be assigned to
    --read-only                                         #Mount the container's root filesystem as read only
    --read-only-tmpfs                                   #When running --read-only containers mount read-write tmpfs on /dev, /dev/shm, /run, /tmp and /var/tmp (default true)
    --replace                                           #If a container with the same name exists, replace it
    --requires: string                                  #Add one or more requirement containers that must be started before this container will start
    --restart: string                                   #Restart policy to apply when a container #exits (default "no")
    --retry: int                                        #Number of times to retry in case of failure when performing pull (default 3)
    --retry-delay: string                               #Delay between retries in case of pull failures
    --rm                                                #Automatically remove the container when it exits
    --rmi                                               #Remove image unless used by other containers, implies --rm
    --rootfs                                            #The first argument is not an image but the rootfs to the exploded container
    --sdnotify: string                                  #control sd-notify behavior ("container"|"conmon"|"healthy"|"ignore") (default "container")
    --seccomp-policy: string                            #Policy for selecting a seccomp profile (experimental) (default "default")
    --secret: string                                    #Add secret to container
    --security-opt: string                              #Security Options
    --shm-size: int                                     #Size of /dev/shm
    --shm-size-systemd: int                             #Size of systemd specific tmpfs mounts (/run, /run/lock) (format: <number>[<unit>], where unit = b (bytes), k (kibibytes), m (mebibytes), or g (gibibytes))
    --sig-proxy                                         #Proxy received signals to the process (default true)
    --stop-signal: string                               #Signal to stop the container
    --stop-timeout: int                                 #Timeout (in seconds) to stop a container
    --subgidname: string                                #Name of range listed in /etc/subgid for use in user namespace
    --subuidname: string                                #Name of range listed in /etc/subuid for use in user namespace
    --sysctl: string                                    #Sysctl options (default map[])
    --systemd: string                                   #Run container in systemd mode ("true"|"false"|"always") (default "true")
    --timeout: int                                      #Maximum length of time a container is allowed to run. The container will be killed automatically after the time expires.
    --tls-verify                                        #Require HTTPS and verify certificates when contacting registries for pulling images
    --tmpfs: string                                     #Mount a tmpfs directory
    --tty(-t)                                           #Allocate a pseudo-TTY
    --tz: string                                        #Set timezone in container
    --uidmap: string                                    #UID map to use for the user namespace
    --ulimit: int                                       #Ulimit options (default [])
    --umask: string                                     #Set umask in container (default "0022")
    --unsetenv: string                                  #Unset environment default variables in container
    --unsetenv-all                                      #Unset all default environment variables in container
    --user(-u): string                                  #Username or UID (format: <name|uid>[:<group|gid>])
    --userns: string                                    #User namespace to use
    --uts: string                                       #UTS namespace to use
    --variant: string                                   #Use VARIANT instead of the running architecture variant for choosing images
    --volume(-v): string                                #Bind mount a volume
    --volume-driver: string                             #Optional volume driver for the container
    --volumes-from: string                              #Mount volumes from the specified container(s)
    --workdir(-w): string                               #Working directory inside the container
]

# Start one or more stopped containers
export extern "podman container start" [
    container?: string@"nu-complete podman containers"
    --all                                               #Start all containers regardless of their state or configuration
    --attach(-a)                                        #Attach STDOUT/STDERR and forward signals
    --detach-keys: string                               #Override the key sequence for detaching a container
    
    --filter(-f): string                                #Filter output based on conditions provided
    --interactive(-i)                                   #Attach container's STDIN
    --latest(-l)                                        #Act on the latest container podman is aware of
    --sig-proxy                                         #Proxy received signals to the process (default true if attaching, false otherwise)
]

# Display a live stream of container(s) resource usage statistics
export extern "podman container stats" [
    container?: string@"nu-complete podman containers"
    --all(-a)                                           #Show all containers (default shows just running)
    --format: string                                    #Pretty-print images using a Go template
    --interval(-i): int                                 #Time in seconds between stats reports (default 5) 
    --latest(-l)                                        #Act on the latest container podman is aware of
    --no-reset                                          #Disable resetting the screen between intervals
    --no-stream                                         #Disable streaming stats and only pull the first result
    --no-trunc                                          #Do not truncate output
]

# Stop one or more running containers
export extern "podman container stop" [
    container?: string@"nu-complete podman containers"
    --all(-a)                                           #Stop all containers (default shows just running)
    --cidfile: string                                   #Read the container ID from the file
    --filter(-f): string                                #Filter output based on conditions provided
    --ignore(-i)                                        #Ignore errors when a specified container is missing
    --latest(-l)                                        #Act on the latest container podman is aware of
    --time(-t): int                                     #Seconds to wait for stop before killing the container
    --signal(-s): int                                   #Signal to stop the container
]

# Display the running processes of a container
export extern "podman container top" [
    container?: string@"nu-complete podman containers"
    --latest(-l)                                        #Act on the latest container podman is aware of
]

# Unpause all processes within one or more containers
export extern "podman container unpause" [
    container?: string@"nu-complete podman containers"
    --all(-a)                                           #Unpause all containers (default shows just running)
    --cidfile: string                                   #Read the container ID from the file
    --filter(-f): string                                #Filter output based on conditions provided
    --latest(-l)                                        #Act on the latest container podman is aware of
]

# Update configuration of one or more containers
export extern "podman container update" [
    container?: string@"nu-complete podman containers"
    --blkio-weight: string                              #Block IO weight (10–1000)
    --blkio-weight-device: string                       #DEVICE_NAME:WEIGHT
    --cpu-period: int                                   #Limit the CPU CFS period
    --cpu-quota: int                                    #Limit the CPU CFS quota
    --cpu-rt-period: int                                #CPU real-time period (microseconds)
    --cpu-rt-runtime: int                               #CPU real-time runtime (microseconds)
    --cpu-shares(-c): int                               #CPU shares (relative weight)
    --cpus: float                                       #Number of CPUs
    --cpuset-cpus: string                               #CPUs to allow execution (0-3, 0,1)
    --cpuset-mems: string                               #Memory nodes (NUMA only)
    --device-read-bps: string                           #Limit read rate (bytes/sec)
    --device-read-iops: string                          #Limit read rate (IOPS)
    --device-write-bps: string                          #Limit write rate (bytes/sec)
    --device-write-iops: string                         #Limit write rate (IOPS)
    --env(-e): string                                   #Set environment variables
    --health-cmd: string                                #Set healthcheck command
    --health-interval: string                           #Healthcheck interval
    --health-log-destination: string                    #Healthcheck log destination
    --health-max-log-count: int                         #Max healthcheck log entries
    --health-max-log-size: int                          #Max healthcheck log size
    --health-on-failure: string                         #Action on unhealthy
    --health-retries: int                               #Healthcheck retries
    --health-start-period: string                       #Container bootstrap time
    --health-startup-cmd: string                        #Startup healthcheck command
    --health-startup-interval: string                   #Startup healthcheck interval
    --health-startup-retries: int                       #Startup healthcheck retries
    --health-startup-success: int                       #Startup success threshold
    --health-startup-timeout: string                    #Startup healthcheck timeout
    --health-timeout: string                            #Healthcheck timeout
    --latest(-l)                                        #Act on the latest container
    --memory(-m): string                                #Memory limit <number>[unit]
    --memory-reservation: string                        #Memory soft limit
    --memory-swap: string                               #Swap limit
    --memory-swappiness: int                            #Memory swappiness
    --no-healthcheck                                    #Disable healthchecks
    --pids-limit: int                                   #PIDs limit
    --restart: string                                   #Restart policy
    --unsetenv: string                                  #Unset environment variables
]

# Block until one or more containers stop, then print their exit codes
export extern "podman container wait" [
    container?: string@"nu-complete podman containers"
    --condition: string                                 #Condition to wait on
    --exit-first-match                                  #Wait for exit of first container which matches conditions
    --ignore                                            #Ignore if a container does not exist
    --interval(-i): string                              #Time interval before polling (default 250ms)
    --latest(-l)                                        #Act on the latest container (not supported with --remote)
]

# Build an image from a Podmanfile
export extern "podman image build" [
    --add-host: string                                  #Add a custom host-to-IP mapping (host:ip)
    --all-platforms                                     #Attempt to build for all base image platforms
    --annotation: string                                #Set metadata for an image
    --arch: string                                      #Set the ARCH of the image (default: amd64)
    --authfile: string                                  #Path of the authentication file
    --build-arg: string                                 #Argument=value to supply to the builder
    --build-arg-file: string                            #Argfile.conf containing argument=value lines
    --build-context: string                             #Additional build context (argument=value)
    --cache-from: string                                #Remote repositories used as cache sources
    --cache-to: string                                  #Remote repositories used as cache destinations
    --cache-ttl: string                                 #Only consider cache images under this duration
    --cap-add: string                                   #Add the specified Linux capability
    --cap-drop: string                                  #Drop the specified Linux capability
    --cert-dir: string                                  #Certificates directory for registry access
    --cgroup-parent: string                             #Optional parent cgroup for the container
    --cgroupns: string                                  #Cgroup namespace ('private' or 'host')
    --compat-volumes                                    #Preserve VOLUME contents during RUN
    --compress                                          #Legacy option, no effect
    --cpp-flag: string                                  #Additional flags for the C preprocessor
    --cpu-period: int                                   #Limit the CPU CFS period
    --cpu-quota: int                                    #Limit the CPU CFS quota
    --cpu-shares(-c): int                               #CPU shares (relative weight)
    --cpuset-cpus: string                               #CPUs allowed to execute (e.g. 0-3, 0,1)
    --cpuset-mems: string                               #NUMA memory nodes to use
    --created-annotation                                #Set image created annotation
    --creds: string                                     #Registry credentials [username[:password]]
    --cw: string                                        #Confidential workload options
    --decryption-key: string                            #Key needed to decrypt the image
    --device: string                                    #Additional devices to provide
    --disable-compression(-D)                           #Do not compress layers by default
    --disable-content-trust                             #Docker-specific NOOP option
    --dns: string                                       #Custom DNS servers or 'none'
    --dns-option: string                                #Custom DNS options
    --dns-search: string                                #Custom DNS search domains
    --env: string                                       #Set environment variables for the image
    --file(-f): string                                  #Pathname or URL of a Dockerfile
    --force-rm                                          #Always remove intermediate containers
    --format: string                                    #Image manifest format (default: oci)
    --from: string                                      #Override first FROM image
    --group-add: string                                 #Add additional groups to container process
    --hooks-dir: string                                 #OCI hooks directory (repeatable)
    --http-proxy                                        #Pass through HTTP proxy env vars
    --identity-label                                    #Add default identity label
    --ignorefile: string                                #Alternate .dockerignore file path
    --iidfile: string                                   #File to write image ID to
    --inherit-annotations                               #Inherit annotations from base image
    --inherit-labels                                    #Inherit labels from base image
    --ipc: string                                       #IPC namespace ('private', 'host', or path)
    --isolation: string                                 #Process isolation type
    --jobs: int                                         #Number of parallel build stages
    --label: string                                     #Set metadata labels for the image
    --layer-label: string                               #Metadata labels for intermediate images
    --layers                                            #Use intermediate layers during build
    --logfile: string                                   #Log output to file
    --logsplit                                          #Split logfile per platform
    --manifest: string                                  #Add image to manifest list
    --memory(-m): string                                #Memory limit (<number>[<unit>])
    --memory-swap: string                               #Memory + swap limit
    --network: string                                   #Network mode or namespace
    --no-cache                                          #Do not use cached images
    --no-hostname                                       #Do not create /etc/hostname
    --no-hosts                                          #Do not create /etc/hosts
    --omit-history                                      #Omit build history from image
    --os: string                                        #Override target OS (default: linux)
    --os-feature: string                                #Required OS feature
    --os-version: string                                #Required OS version
    --output(-o): string                                #Output destination (type=local,dest=path)
    --pid: string                                       #PID namespace ('private', 'host', or path)
    --platform: string                                  #Target platform OS/ARCH[/VARIANT]
    --pull: string                                      #Image pull policy
    --quiet(-q)                                         #Suppress build output
    --retry: int                                        #Number of push/pull retries
    --retry-delay: string                               #Delay between retries
    --rewrite-timestamp                                 #Rewrite layer timestamps
    --rm                                                #Remove intermediate containers on success
    --runtime-flag: string                              #Global flags for container runtime
    --sbom: string                                      #SBOM preset configuration
    --sbom-image-output: string                         #Add SBOM results to image path
    --sbom-image-purl-output: string                    #Add SBOM purl results to image path
    --sbom-merge-strategy: string                       #Merge SBOM results strategy
    --sbom-output: string                               #Write SBOM results to file
    --sbom-purl-output: string                          #Write SBOM purl results to file
    --sbom-scanner-command: string                      #Scanner command inside scanner image
    --sbom-scanner-image: string                        #Scanner image to use
    --secret: string                                    #Secret file exposed to the build
    --security-opt: string                              #Security options
    --shm-size: string                                  #Size of /dev/shm
    --sign-by: string                                   #Sign image with GPG fingerprint
    --skip-unused-stages                                #Skip unused build stages
    --source-date-epoch: int                            #Set timestamps relative to epoch
    --squash                                            #Squash image layers into one
    --squash-all                                        #Squash all layers into one
    --ssh: string                                       #SSH agent socket or keys
    --stdin                                             #Pass stdin into containers
    --tag(-t): string                                   #Tag name for the built image
    --target: string                                    #Target build stage
    --timestamp: int                                    #Set timestamps in image and layers
    --tls-verify                                        #Require HTTPS and verify certificates
    --ulimit: string                                    #Ulimit options
    --unsetannotation: string                           #Unset inherited annotations
    --unsetenv: string                                  #Unset environment variables
    --unsetlabel: string                                #Unset inherited labels
    --userns: string                                    #User namespace mode or path
    --userns-gid-map: string                            #GID mapping for user namespace
    --userns-gid-map-group: string                      #Subgid group name
    --userns-uid-map: string                            #UID mapping for user namespace
    --userns-uid-map-user: string                       #Subuid user name
    --uts: string                                       #UTS namespace mode or path
    --variant: string                                   #Override image variant
    --volume(-v): string                                #Bind mount a volume into container
]

# Inspect changes to the image's file systems
export extern "podman image diff" [
    image: string@"nu-complete podman images"
    image2?: string@"nu-complete podman images"
    --format: string                                    #Change the output format (json)
]

# Check if an image exists in local storage
export extern "podman image exists" [
    image: string@"nu-complete podman images"
]

# Show the history of an images
export extern "podman image history" [
    image?: string@"nu-complete podman images"
    --format: string                                    #Pretty-print images using a Go template
    --human(-H)                                         #Display sizes and dates in human readable format (default true)
    --no-trunc                                          #Don't truncate output
    --quiet(-q)                                         #Only show numeric IDs
]

# Import a tarball to create a filesystem image
export extern "podman image import" [
    path: string                                        #Import path
    --arch: string                                      #Set the architecture of the imported image
    --change(-c): string                                #Apply the following possible instructions to the created image (default []): CMD | ENTRYPOINT | ENV | EXPOSE | LABEL | ONBUILD | STOPSIGNAL | USER | VOLUME | WORKDIR
    --message(-m): string                               #Set commit message for imported image
    --os: string                                        #Set the OS of the imported image
    --quiet(-q)                                         #Suppress output
    --variant: string                                   #Set the variant of the imported image
]

# Displays the low-level information of an image identified by name or ID.
export extern "podman image inspect" [
    image: string@"nu-complete podman images"
    --format: string                                    #Format the output to a Go template or json (default "json")
]

# List images in local storage
export extern "podman image list" [
    --all                                               #Show all images (default hides intermediate images)
    --digests                                           #Show digests
    --filter(-f): string                                #Filter output based on conditions provided (default [])
    --format: string                                    #Change the output format to JSON or a Go template
    --history                                           #Display the image name history
    --no-trunc                                          #Do not truncate output
    --noheading(-n)                                     #Do not print column headings
    --quiet(-q)                                         #Display only image IDs
    --sort: string                                      #Sort by created, id, repository, size, tag (default created)
]

# Load image(s) from a tar archive
export extern "podman image load" [
    --input(-i): string                                 #Read from specified archive file (default: stdin)
    --quiet(-q)                                         #Display only image IDs
]

# Mount an image's root filesystem
export extern "podman image mount" [
    image?: string@"nu-complete podman images"
    --all(-a)                                          #Mount all images
    --format: string                                   #Print the mounted images in specified format (json)
]

# Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
export extern "podman image tag" [
    source?: string@"nu-complete podman images"
    target?: string@"nu-complete podman images"
]

# Download an image from a registry
export extern "podman image pull" [
    image?: string@"nu-complete podman images"
    --all-tags(-a)                                      #All tagged images in the repository will be pulled
    --arch: string                                      #Use ARCH instead of the host architecture for choosing images
    --authfile: string                                  #Path of the authentication file (REGISTRY_AUTH_FILE overrides)
    --cert-dir: string                                  #Directory containing TLS certificates and keys
    --creds: string                                     #Credentials (USERNAME:PASSWORD) for registry authentication
    --decryption-key: string                            #Key needed to decrypt the image (e.g. /path/to/key.pem)
    --disable-content-trust                             #Docker-specific option; NOOP
    --os: string                                        #Use OS instead of the running OS for choosing images
    --platform: string                                  #Specify platform for selecting the image (conflicts with arch and os)
    --policy: string                                    #Pull image policy ("always"|"missing"|"never"|"newer")
    --quiet(-q)                                         #Suppress output information when pulling images
    --retry: int                                        #Number of pull retries (default 3)
    --retry-delay: string                               #Delay between retries on pull failure
    --tls-verify                                        #Require HTTPS and verify certificates
    --variant: string                                   #Use VARIANT instead of the running architecture variant
]

# Upload an image to a registry
export extern "podman image push" [
    image?: string@"nu-complete podman images"
    --authfile: string                                  #Path of the authentication file (REGISTRY_AUTH_FILE overrides)
    --cert-dir: string                                  #Path to a directory containing TLS certificates and keys
    --compress                                          #Compress tarball image layers when pushing to a directory using the 'dir' transport
    --compression-format: string                        #Compression format to use (default: gzip)
    --compression-level: int                            #Compression level to use
    --creds: string                                     #Credentials (USERNAME:PASSWORD) for registry authentication
    --digestfile: string                                #Write the digest of the pushed image to the specified file
    --disable-content-trust                             #Docker-specific option; NOOP
    --encrypt-layer: string                             #Layers to encrypt (0-indexed, supports negative indices)
    --encryption-key: string                            #Encryption key and protocol (e.g. jwe:/path/to/key.pem)
    --force-compression                                 #Force specified compression even if destination differs
    --format(-f): string                                #Manifest type (oci, v2s2, v2s1)
    --quiet(-q)                                         #Suppress output information when pushing images
    --remove-signatures                                 #Discard any pre-existing image signatures
    --retry: int                                        #Number of push retries (default: 3)
    --retry-delay: string                               #Delay between retries on push failure
    --sign-by: string                                   #Sign image using the specified key
    --sign-by-sigstore: string                          #Sign image using a sigstore parameter file
    --sign-by-sigstore-private-key: string              #Sign image using a sigstore private key
    --sign-by-sq-fingerprint: string                    #Sign image using a Sequoia-PGP key fingerprint
    --sign-passphrase-file: string                      #Read signing passphrase from file
    --tls-verify                                        #Require HTTPS and verify certificates
]

# Save one or more images to a tar archive (streamed to STDOUT by default)
export extern "podman image save" [
    image?: string@"nu-complete podman images"
    --compress                                          #Compress tarball image layers when saving to a directory using the 'dir' transport. (default is same compression type as source)
    --format: string                                    #Save image to oci-archive, oci-dir (directory with oci manifest type), docker-archive, docker-dir (directory with v2s2 manifest type) (default "docker-archive")
    --multi-image-archive(-m)                           #Interpret additional arguments as images not tags and create a multi-image-archive (only for docker-archive)
    --quiet(-q)                                         #Suppress output
    --output(-o): string                                #Write to a file, instead of STDOUT
    --uncompressed                                      #Accept uncompressed layers when copying OCI images
]

# Delete one or more podman image
export extern "podman image rm" [
    ...image: string@"nu-complete podman images"
    --all(-a)                                           #Remove all images
    --force(-f)                                         #Force removal of the image
    --ignore(-i)                                        #Ignore errors if a specified image does not exist
    --no-prune                                          #Do not delete untagged parents
]

# Tear down entire stack
export extern "podman compose down" [
    --dry-run                                           #Execute command in dry run mode
    --remove-orphans                                    #Remove containers for services not defined in the Compose file
    --rmi: string@"nu-complete podman remove image"     #Remove images used by services. "local" remove only images that don't have a custom tag ("local"|"all")
    --timeout(-t): int                                  #Specify a shutdown timeout in seconds
    --volumes(-v)                                       #Remove named volumes declared in the "volumes" section of the Compose file and anonymous volumes attached to containers
]

# Show status of containers
export extern "podman compose ps" [
    --all(-a)                                           #Show all stopped containers (including those created by the run command)
    --dry-run                                           #Execute command in dry run mode
    --filter: string                                    #Filter services by a property (supported filters: status)
    --format: string                                    #Format output using a custom template: 'table': Print output in table; format with column headers (default) 'table TEMPLATE': Print output in table; format using the given Go template 'json': Print in JSON format; 'TEMPLATE': Print output using the given Go template; Refer to https://docs.podman.com/go/formatting/ for more information about formatting output with templates (default "table")
    --no-truncate                                       #Don't truncate output
    --orphans                                           #Include orphaned services (not declared by project) (default true)
    --quite(-q)                                         #Only display IDs
    --services                                          #Display services
    --status: string@"nu-complete podman compose service status" #Filter services by status. Values: [paused | restarting | removing | running | dead | created | exited]
]

# Stop specific services
export extern "podman compose stop" [
    --timeout(-t): int                                  #Specify a shutdown timeout in seconds
]

# Restart service containers
export extern "podman compose restart" [
    --dry-run                                           #Execute command in dry run mode
    --no-deps                                           #Don't restart dependent services
    --timeout(-t): int                                  #Specify a shutdown timeout in seconds
]

# Create and start containers
export extern "podman compose up" [
  --help(-h)                                            #Show this help message and exit
  --detach(-d)                                          #Detached mode: run container in background; incompatible with --abort-on-container-exit and --abort-on-container-failure
  --no-color                                            #Produce monochrome output
  --quiet-pull                                          #Pull without printing progress information
  --no-deps                                             #Don't start linked services
  --force-recreate                                      #Recreate containers even if configuration and image haven't changed
  --always-recreate-deps                                #Recreate dependent containers; incompatible with --no-recreate
  --no-recreate                                         #If containers exist, don't recreate; incompatible with --force-recreate and -V
  --no-build                                            #Don't build an image even if missing
  --no-start                                            #Don't start services after creation
  --build                                               #Build images before starting containers
  --abort-on-container-exit                             #Stop all containers if any container stopped; incompatible with -d and --abort-on-container-failure
  --abort-on-container-failure                          #Stop all containers if any container stops with non-zero exit; incompatible with -d and --abort-on-container-exit
  --timeout(-t): int                                    #Timeout in seconds for container shutdown (default: 10)
  --renew-anon-volumes(-V)                              #Recreate anonymous volumes instead of using previous container data
  --remove-orphans                                      #Remove containers for services not defined in Compose file
  --scale: string                                       #Scale SERVICE to NUM instances; overrides Compose file scale setting
  --exit-code-from: string                              #Return exit code of selected service container; implies --abort-on-container-exit
  --pull                                                #Attempt to pull a newer version of the image
  --pull-always                                         #Attempt to pull newer image; raise error even if image exists locally
  --build-arg: string                                   #Set build-time variables for services
  --no-cache                                            #Do not use cache when building the image
]

export extern "podman compose" [
    command?: string@"nu-complete podman compose subcommands"
    --help(-h)                                          # Show this help message and exit
    --version(-v)                                       # Show version
    --in-pod: string                                    # Specify pod usage ('true', 'false', or custom pod name)
    --pod-args: string                                  # Custom arguments to be passed to `podman pod`
    --env-file: string                                  # Specify an alternate environment file
    --file(-f): string                                  # Specify a compose file (default: docker-compose.yml) or '-' to read from stdin
    --profile: string                                   # Specify a profile to enable
    --project-name(-p): string                          # Specify an alternate project name (default: directory name)
    --podman-path: string                               # Specify an alternate path to podman (default: use location in $PATH)
    --podman-args: string                               # Custom global arguments to be passed to `podman`
    --podman-pull-args: string                          # Custom arguments to be passed to `podman pull`
    --podman-push-args: string                          # Custom arguments to be passed to `podman push`
    --podman-build-args: string                         # Custom arguments to be passed to `podman build`
    --podman-inspect-args: string                       # Custom arguments to be passed to `podman inspect`
    --podman-run-args: string                           # Custom arguments to be passed to `podman run`
    --podman-start-args: string                         # Custom arguments to be passed to `podman start`
    --podman-stop-args: string                          # Custom arguments to be passed to `podman stop`
    --podman-rm-args: string                            # Custom arguments to be passed to `podman rm`
    --podman-volume-args: string                        # Custom arguments to be passed to `podman volume`
    --no-ansi                                           # Do not print ANSI control characters
    --no-cleanup                                        # Do not stop and remove existing pod & containers
    --dry-run                                           # No action; perform a simulation of commands
    --parallel: string                                  # Number of parallel operations
    --verbose                                           # Print debugging output
]

# An open-source container management platform.
export extern "podman" [
    command?: string@"nu-complete podman subcommands"   #Subcommands
    --cdi-spec-dir: string                              #Set the CDI spec directory path (may be set multiple times) (default [/etc/cdi,/var/run/cdi])
    --cgroup-manager: string                            #Cgroup manager to use ("cgroupfs"|"systemd") (default "systemd")
    --config: path                                      #Location of client config files (default "/root/.podman")
    --conmon: path                                      #Path of the conmon binary
    --connection(-c): string                            #Connection to use for remote Podman service (CONTAINER_CONNECTION)
    --events-backend: string                            #Events backend to use ("file"|"journald"|"none") (default "journald")
    --hooks-dir: string                                 #Set the OCI hooks directory path (may be set multiple times) (default [/usr/share/containers/oci/hooks.d])
    --identity: string                                  #path to SSH identity file, (CONTAINER_SSHKEY)
    --imagestore: string                                #Path to the 'image store', different from 'graph root', use this to split storing the image into a separate 'image store', see 'man containers-storage.conf' for details
    --log-level: string                                 #Log messages above specified level (trace, debug, info, warn, warning, error, fatal, panic) (default "warn")
    --module: string                                    #Load the containers.conf(5) module
    --network-cmd-path: string                          #Path to the command for configuring the network
    --network-config-dir: string                        #Path of the configuration directory for networks
    --out: string                                       #Send output (stdout) from podman to a file
    --remote(-r)                                        #Access remote Podman service
    --root: string                                      #Path to the graph root directory where images, containers, etc. are stored
    --runroot: string                                   #Path to the 'run directory' where all state information is stored
    --runtime: string                                   #Path to the OCI-compatible binary used to run containers. (default "runc")
    --runtime-flag: string                              #Add global flags for the container runtime
    --ssh: string                                       #Define the ssh mode (default "golang")
    --storage-driver: string                            #Select which storage driver is used to manage storage of images and containers
    --storage-opt: string                               #Used to pass an option to the storage driver
    --syslog                                            #Output podman-internal logs to syslog as well as the console (default false)
    --tls-ca: string                                    #Trust certs signed only by this CA
    --tls-cert: string                                  #Path to TLS certificate file
    --tls-key: string                                   #Path to TLS key file
    --tmpdir: string                                    #Path to the tmp directory for libpod state content.
    --transient-store                                   #Enable transient container storage
    --url: string                                       #URL to access Podman service (CONTAINER_HOST) (default "unix:///run/user/1000/podman/podman.sock")
    --version(-v)                                       #Print version information and quit
    --volumepath: string                                #Path to the volume directory in which volume data is stored
]

# Attach local standard input, output, and error streams to a running container
export alias "podman attach" = podman container attach
# Create a new image from a container's changes
export alias "podman commit" = podman container commit
export alias "podman cp" = podman container cp
# Create a new container
export alias "podman create" = podman container create
# Inspect changes to files or directories on a container's filesystem
export alias "podman diff" = podman container diff
# Execute a command in a running container
export alias "podman exec" = podman container exec
# Export a container's filesystem as a tar archive
export alias "podman export" = podman container export
# Display detailed information on one or more containers
export alias "podman inspect" = podman container inspect
# Kill one or more running containers
export alias "podman kill" = podman container kill
# Fetch the logs of a container
export alias "podman logs" = podman container logs
# Pause all processes within one or more containers
export alias "podman pause" = podman container pause
# List port mappings or a specific mapping for the container
export alias "podman port" = podman container port
# Rename a container
export alias "podman rename" = podman container rename
# Restart one or more containers
export alias "podman restart" = podman container restart
# List containers
export alias "podman ps" = podman container ls
# Remove one or more containers
export alias "podman rm" = podman container rm
# Run a command in a new container
export alias "podman run" = podman container run
# Start one or more stopped containers
export alias "podman start" = podman container start
# Display a live stream of container(s) resource usage statistics
export alias "podman stats" = podman container stats
# Stop one or more running containers
export alias "podman stop" = podman container stop
# Display the running processes of a container
export alias "podman top" = podman container top
# Unpause all processes within one or more containers
export alias "podman unpause" = podman container unpause
# Update configuration of one or more containers
export alias "podman update" = podman container update
# Block until one or more containers stop, then print their exit codes
export alias "podman wait" = podman container wait

# Build an image from a Podmanfile
export alias "podman build" = podman image build
# Show the history of an image
export alias "podman history" = podman image history
# Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
export alias "podman tag" = podman image tag
# List images
export alias "podman images" = podman image ls
# Remove one or more images
export alias "podman rmi" = podman image rm
# Download an image from a registry
export alias "podman pull" = podman image pull
# Upload an image to a registry
export alias "podman push" = podman image push
# Save one or more images to a tar archive (streamed to STDOUT by default)
export alias "podman save" = podman image save

# Inspect changes to files or directories on a container's filesystem
export alias "podman events" = podman system events
