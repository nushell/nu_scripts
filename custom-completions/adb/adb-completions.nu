def "nu-complete adb one-device-args" [] {
    [SERIAL USB]
}

def "nu-complete adb compression-algorithm" [] {
    [any none brotli lz4 zstd]
}

def "nu-complete adb sync-partations" [] {
    [all data odm oem product system system_ext vendor]
}

def "nu-complete adb wait-for-state" [] {
    [-device -recovery -rescue -sideload -bootloader -disconnect]
}

def "nu-complete adb wait-for-transport" [] {
    [-usb -local -any]
}

def "nu-complete adb reboot-type" [] {
    [
        bootloader 
        recovery 
        edl 
        sideload # Reboots into recovery and automatically starts sideload mode.
        sideload-auto-reboot
        " "
    ]
}

export extern "adb" [
    -a                                                        # listen on all network interfaces, not just localhost
    -d                                                        # use USB device (error if multiple devices connected)
    -e                                                        # use TCP/IP device (error if multiple TCP/IP devices available)
    -s: string                                                # use device with given serial (overrides $ANDROID_SERIAL)
    -t: string                                                # use device with given transport id
    -H: string                                                # name of adb server host [default=localhost]
    -P: int                                                   # port of adb server [default=5037]
    -L: string                                                #  listen on given socket for adb server [default=tcp:localhost:5037]
    
    --exit-on-write-error                                     # exit if stdout is closed
]

#  Show this help message.
export extern "adb help" []

#  Show version number.
export extern "adb version" []

# Connect to a device via TCP/IP [default PORT=5555].
export extern "adb connect" [
    host_port: string #  Connect to a device via TCP/IP [default PORT=5555].
]

# Disconnect from given TCP/IP device [default PORT=5555], or all.
export extern "adb disconnect" [
    host_port?: string #  Disconnect device via TCP/IP [default PORT=5555] (disconnec all if no ip given).
]

# Pair with a device for secure TCP/IP communication.
export extern "adb pair" [
    host_port: string #  Connect to a device via TCP/IP [default PORT=5555].
    PAIRING_CODE: string
]

export extern "adb forward" [
    --list  #     List all forward socket connections.
    --no-rebind
    LOCAL_REMOTE: string # Forward socket connection using one of the followings.   tcp:PORT (local may be “tcp:0” to pick any open port.     localreserved:UNIX_DOMAIN_SOCKET_NAME.     localfilesystem:UNIX_DOMAIN_SOCKET_NAME.     jdwp:PROCESS PID (remote only).     vsock:CID:PORT (remote only).     acceptfd:FD (listen only).     dev:DEVICE_NAME.     dev-raw:DEVICE_NAME. (open device in raw mode)**.
    --remove: string # Remove specific forward socket connection.
    --remove-all # Remove all forward socket connections.
]

export extern "adb reverse" [
    --list  #     List all forward socket connections.
    --no-rebind
    LOCAL_REMOTE: string # Forward socket connection using one of the followings.   tcp:PORT (local may be “tcp:0” to pick any open port.     localreserved:UNIX_DOMAIN_SOCKET_NAME.     localfilesystem:UNIX_DOMAIN_SOCKET_NAME.     jdwp:PROCESS PID (remote only).     vsock:CID:PORT (remote only).     acceptfd:FD (listen only).     dev:DEVICE_NAME.     dev-raw:DEVICE_NAME. (open device in raw mode)**.
    --remove: string # Remove specific forward socket connection.
    --remove-all # Remove all forward socket connections.
]

export extern "adb mdns" [
    check    # Check if mdns discovery is available.
    services # List all discovered services.
]


# List connected devices.
export extern "adb devices" [
    -l #  Use long output.
]


# Push a single package to the device and install it
export extern "adb install" [
    Package: string
    -r                      # Replace existing application.
    -t                      # Allow test packages.
    -d                      # Allow version code downgrade (debuggable packages only).
    -p                      # Partial application install (install-multiple only).
    -g                      # Grant all runtime permissions.
    --abi:string            # Override platform's default ABI.
    --instant               # Cause the app to be installed as an ephemeral install app.
    --no-streaming          # Always push APK to device and invoke Package Manager as separate steps.
    --streaming             # Force streaming APK directly into Package Manager.
    --fastdeploy            # Use fast deploy.
    --no-fastdeploy         # Prevent use of fast deploy.
    --force-agent           # Force update of deployment agent when using fast deploy.
    --date-check-agent      # Update deployment agent when local version is newer and using fast deploy.
    --version-check-agent   # Update deployment agent when local version has different version code and using fast deploy.
    --local-agent           # Locate agent files from local source build (instead of SDK location). See also adb shell pm help for more options.
]



# Push one or more packages to the device and install them atomically
export extern "adb install-multiple" [
    Package: string
    -r                      # Replace existing application.
    -t                      # Allow test packages.
    -d                      # Allow version code downgrade (debuggable packages only).
    -p                      # Partial application install (install-multiple only).
    -g                      # Grant all runtime permissions.
    --abi:string            # Override platform's default ABI.
    --instant               # Cause the app to be installed as an ephemeral install app.
    --no-streaming          # Always push APK to device and invoke Package Manager as separate steps.
    --streaming             # Force streaming APK directly into Package Manager.
    --fastdeploy            # Use fast deploy.
    --no-fastdeploy         # Prevent use of fast deploy.
    --force-agent           # Force update of deployment agent when using fast deploy.
    --date-check-agent      # Update deployment agent when local version is newer and using fast deploy.
    --version-check-agent   # Update deployment agent when local version has different version code and using fast deploy.
    --local-agent           # Locate agent files from local source build (instead of SDK location). See also adb shell pm help for more options.
]

export extern "adb install-multi-package" [
    Package: string
    -r                      # Replace existing application.
    -t                      # Allow test packages.
    -d                      # Allow version code downgrade (debuggable packages only).
    -p                      # Partial application install (install-multiple only).
    -g                      # Grant all runtime permissions.
    --abi:string            # Override platform's default ABI.
    --instant               # Cause the app to be installed as an ephemeral install app.
    --no-streaming          # Always push APK to device and invoke Package Manager as separate steps.
    --streaming             # Force streaming APK directly into Package Manager.
    --fastdeploy            # Use fast deploy.
    --no-fastdeploy         # Prevent use of fast deploy.
    --force-agent           # Force update of deployment agent when using fast deploy.
    --date-check-agent      # Update deployment agent when local version is newer and using fast deploy.
    --version-check-agent   # Update deployment agent when local version has different version code and using fast deploy.
    --local-agent           # Locate agent files from local source build (instead of SDK location). See also adb shell pm help for more options.
]


# Remove specified application from the device
export extern "adb uninstall" [
    APPLICATION_ID: string # Remove this APPLICATION_ID from the device.
    -k      
]

# Run remote shell command (interactive shell if no command given)
export extern "adb shell" [
    -e               # Choose escape character, or “none”; default ‘~’.
    -n               # Don't read from stdin
    -T               # Disable pty allocation.
    -t               # Allocate a pty if on a tty (-tt force pty allocation).
    -x               # Disable remote exit codes and stdout/stderr separation.
    COMMAND?:string  #   Run emulator console COMMAND
]


# Copy local files/directories to device.
export extern "adb push" [
    --sync    # Only push files that are newer on the host than the device.
    -n        # Dry run, push files to device without storing to the filesystem.
    -z:string@"nu-complete adb compression-algorithm"        # enable compression with a specified algorithm (any/none/brotli/lz4/zstd).
    -Z        # Disable compression.

]

# Copy files/dirs from device
export extern "adb pull" [
    -a    #  preserve file timestamp and mode.
    --sync    # Only push files that are newer on the host than the device.
    -n        # Dry run. Push files to device without storing to the filesystem.
    -z:string@"nu-complete adb compression-algorithm"        # enable compression with a specified algorithm (any/none/brotli/lz4/zstd).
    -Z        # Disable compression.
    ...remote: string
    local: string
]


# Sync a local build from $ANDROID_PRODUCT_OUT to the device (default all)
export extern "adb sync" [
    parations: string@"nu-complete adb sync-partations"
    -n        # Dry run. Push files to device without storing to the filesystem.
    -z:string@"nu-complete adb compression-algorithm"        # enable compression with a specified algorithm (any/none/brotli/lz4/zstd).
    -Z        # Disable compression.
    -l          # List files that would be copied, but don't copy them.
]

# Ensure that there is a server running.
export extern "adb start-server" [ #  only allowed with 'start-server' or 'server nodaemon', 
    --one-device: string@"nu-complete adb one-device-args"    #server will only connect to one USB device, specified by a serial number or USB device address.
]

#  Kill the server if it is running.
export extern "adb kill-server" []

# Close connection from host or device side to force reconnect.
export extern "adb reconnect" [
    device?: string
]

# Close connection from device side to force reconnect.
export extern "adb reconnect device" []

# Reset offline/unauthorized devices to force reconnect.
export extern "adb reconnect offline" []

# Attach a detached USB device identified by its SERIAL number.
export extern "adb attach" [
    SERIAL: string
]

# Detach from a USB device identified by its SERIAL to allow use by other processes.
export extern "adb detach" [
    SERIAL: string
]

# list features supported by adb server.
export extern "adb host-features" []

# list features supported by both adb server and device.
export extern "adb features" []

# Write bugreport
export extern "adb bugreport" [
    PATH: string # PATH [default=bugreport.zip]; if PATH is a directory, the bug report is saved in that directory. devices that don't support zipped bug reports output to stdout.

]

# List pids of processes hosting a JDWP transport.
export extern "adb jdwp" []

# Show device log (logcat --help for more).
export extern "adb logcat" []

# Disable dm-verity checking on userdebug builds.
export extern "adb disable-verity" []

#  Re-enable dm-verity checking on userdebug builds.
export extern "adb enable-verity" []

# Generate adb public/private key; private key stored in FILE.
export extern "adb keygen" [
    FILE: string
]

# Wait for device to be in a given state.
export extern "adb wait-for" [
    STATE: string@"nu-complete adb wait-for-state"
    TRANSPORT: string@"nu-complete adb wait-for-transport"
]

# Print offline | bootloader | device.
export extern "adb get-state" []

#  Print SERIAL_NUMBER.
export extern "adb get-serialno" []

# Print DEVICE_PATH.
export extern "adb get-devpath" []

# Remount partitions read-write.
export extern "adb remount" [
    -R # Automatically reboot the device.
]

#  Reboot the device; defaults to booting system image but supports bootloader and recovery too.
export extern "adb reboot" [
    type:string@"nu-complete adb reboot-type"                 
]

#  Sideload the given full OTA package
export extern "adb sideload" [
    OTAPACKAGE: string
]

# Restart adbd with root permissions.
export extern "adb root" []

# Restart adbd without root permissions.
export extern "adb unroot" []

# Restart adbd listening on USB.
export extern "adb usb" []

# Restart adbd listening on TCP on PORT.
export extern "adb tcpip" [
    PORT:string
]  
