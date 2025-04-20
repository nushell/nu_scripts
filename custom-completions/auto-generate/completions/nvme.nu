# List all NVMe devices and namespaces on machine
extern "nvme list" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Increase verbosity
extern "nvme" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# List nvme subsystems
extern "nvme list-subsys" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Controller
extern "nvme id-ctrl" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Namespace
extern "nvme id-ns" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Namespace Granularity List
extern "nvme id-ns-granularity" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Namespace for the specified LBA Format index
extern "nvme id-ns-lba-format" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify List
extern "nvme list-ns" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Controller List
extern "nvme list-ctrl" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Controller NVM Command Set
extern "nvme nvm-id-ctrl" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Namespace NVM Command Set
extern "nvme nvm-id-ns" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Namespace NVM Command Set for the specified LBA Format index
extern "nvme nvm-id-ns-lba-format" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Primary Controller Capabilities
extern "nvme primary-ctrl-caps" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# List Secondary Controllers associated with a Primary Controller
extern "nvme list-secondary" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# I/O Command Set Independent Identify Namespace
extern "nvme cmdset-ind-id-ns" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Namespace Descriptor List
extern "nvme ns-descs" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify NVM Set List
extern "nvme id-nvmset" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify UUID List
extern "nvme id-uuid" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify I/O Command Set
extern "nvme id-iocs" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Domain List
extern "nvme id-domain" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send NVMe Identify Endurance Group List
extern "nvme list-endgrp" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Creates a namespace with the provided parameters
extern "nvme create-ns" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Deletes a namespace from the controller
extern "nvme delete-ns" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Attaches a namespace to requested controller(s)
extern "nvme attach-ns" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Detaches a namespace from requested controller(s)
extern "nvme detach-ns" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve the namespace ID of opened block device
extern "nvme get-ns-id" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Generic NVMe get log, returns log in raw format
extern "nvme get-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve FW Telemetry log write to file
extern "nvme telemetry-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve FW Log
extern "nvme fw-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Changed Namespace List
extern "nvme changed-ns-list-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve SMART Log
extern "nvme smart-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve ANA Log
extern "nvme ana-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Error Log
extern "nvme error-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Command Effects Log
extern "nvme effects-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Endurance Group Log
extern "nvme endurance-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Predictable Latency per Nvmset Log
extern "nvme predictable-lat-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Predictable Latency Event Aggregate Log
extern "nvme pred-lat-event-agg-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Persistent Event Log
extern "nvme persistent-event-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Endurance Group Event Aggregate Log
extern "nvme endurance-event-agg-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve LBA Status Information Log
extern "nvme lba-status-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Reservation Notification Log
extern "nvme resv-notif-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve Boot Partition Log
extern "nvme boot-part-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Get feature and show the resulting value
extern "nvme get-feature" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Perform the necessary tests to observe the performance
extern "nvme device-self-test" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve the SELF-TEST Log
extern "nvme self-test-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve the Supported Log pages details
extern "nvme supported-log-pages" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve FID Support and Effects log
extern "nvme fid-support-effects-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve MI Command Support and Effects log
extern "nvme mi-cmd-support-effects-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve the configuration and wear of media units
extern "nvme media-unit-stat-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve the list of Supported Capacity Configuration Descriptors
extern "nvme supported-cap-config-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Set a feature and show the resulting value
extern "nvme set-feature" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Set a property and show the resulting value
extern "nvme set-property" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Get a property and show the resulting value
extern "nvme get-property" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Format namespace with new block format
extern "nvme format" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Verify and commit firmware to a specific slot
extern "nvme fw-commit" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Download new firmware
extern "nvme fw-download" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit an arbitrary admin command
extern "nvme admin-passthru" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit an arbitrary IO command
extern "nvme io-passthru" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Security Send command
extern "nvme security-send" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Security Receive command
extern "nvme security-recv" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Get LBA Status command
extern "nvme get-lba-status" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit Capacity Management Command
extern "nvme capacity-mgmt" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Reservation Acquire
extern "nvme resv-acquire" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Reservation Register
extern "nvme resv-register" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Reservation Release
extern "nvme resv-release" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Reservation Report
extern "nvme resv-report" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Data Set Management command
extern "nvme dsm" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Simple Copy command
extern "nvme copy" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Flush command
extern "nvme flush" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Compare command
extern "nvme compare" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a read command
extern "nvme read" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a write command
extern "nvme write" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a write zeroes command
extern "nvme write-zeroes" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a write uncorrectable command
extern "nvme write-uncor" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a verify command
extern "nvme verify" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a sanitize command
extern "nvme sanitize" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Retrieve sanitize log
extern "nvme sanitize-log" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Resets the controller
extern "nvme reset" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Resets the subsystem
extern "nvme subsystem-reset" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Rescans the NVME namespaces
extern "nvme ns-rescan" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Shows the controller registers or properties
extern "nvme show-regs" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Discover NVMeoF subsystems
extern "nvme discover" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Discover and Connect to NVMeoF subsystems
extern "nvme connect-all" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Connect to NVMeoF subsystem
extern "nvme connect" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Disconnect from NVMeoF subsystem
extern "nvme disconnect" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Disconnect from all connected NVMeoF subsystems
extern "nvme disconnect-all" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Configuration of NVMeoF subsystems
extern "nvme config" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Generate NVMeoF host NQN
extern "nvme gen-hostnqn" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Show NVMeoF host NQN
extern "nvme show-hostnqn" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Generate NVMeoF DH-HMAC-CHAP host key
extern "nvme gen-dhchap-key" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Validate NVMeoF DH-HMAC-CHAP host key
extern "nvme check-dhchap-key" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Generate NVMeoF TLS PSK
extern "nvme gen-tls-key" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Validate NVMeoF TLS PSK
extern "nvme check-tls-key" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Directive Receive command
extern "nvme dir-receive" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit a Directive Send command
extern "nvme dir-send" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Manage Flexible Resources between Primary and Secondary Controller 
extern "nvme virt-mgmt" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Replay Protection Memory Block commands
extern "nvme rpmb" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Submit Lockdown command
extern "nvme lockdown" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Send Discovery Information Management command to a Discovery Controller
extern "nvme dim" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Show  version
extern "nvme version" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]

# Display help
extern "nvme help" [
	--verbose(-v)					# Increase verbosity
	--help(-h)					# Display help
	...args
]