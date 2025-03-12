#!/usr/bin/env nu

const aspm = {
    DISABLED: 0b00
    L0s: 0b01
    L1: 0b10
    L0sL1: 0b11
}

def get-bytes-for-device [
    device: string
]: nothing -> binary {
    lspci -s $device -xxx
    | lines
    | skip
    | compact -e
    | split column -c ':'
    | get column2
    | split row ' '
    | compact -e
    | str join
    | decode hex
    | if ($in|bytes length) < 256 {
        print $"Invalid byte length detected for device ($device) aborting"
        exit
    } else {
        $in
    }
}

def find-bytes [
    bytes: binary
    pos: int
]: nothing -> int {
    # absolute black magic
    let result = ($bytes|bytes at $pos..$pos|into int)
    if $result != 0x10 {
        find-bytes $bytes ($result + 0x1)
    } else {
        return ($result + 0x10)
    }
}

def patch-device [
    device: string
    aspm_value: string
] {
    let bytes = (get-bytes-for-device $device)
    let byte_position = (find-bytes $bytes 0x34) #no one really knows where this value comes from
    let byte_to_patch = (
        $bytes
        | bytes at $byte_position..$byte_position
        | into int
    )
    # no idea
    if ($byte_to_patch| bits and 0b11) == ($aspm|get $aspm_value) {
        print $"($device) already has ASPM ($aspm_value) enabled"
    } else {
        print $"Enabling ASPM ($aspm_value) for device ($device)"
        let new_byte_value = (
            $byte_to_patch
            | bits shr 2 #no idea why we bitshift right and left
            | bits shl 2
            | bits or ($aspm|get $aspm_value)
        )
        patch-byte $device $byte_position $new_byte_value
        print $"Enabled ASPM ($aspm_value) for device ($device)"
    }
}

def patch-byte [
    device: string
    position: int
    value: int
] {
    setpci -s $device $"($position|format number|get upperhex).B=($value|format number|get upperhex)"
}

def get-supported-devices []: nothing -> table<address: string, supported_aspm: string> {
    lspci -vv
    | lines
    | split list ''
    | each {|device|

        let address = (
            $device
            | first
            | split row ' '
            | first
        )

        let params = ($device|skip)

        if ($params|find "ASPM"|is-empty) or ($params|find "ASPM not supported"|is-not-empty) {
            null
        } else {
            let supported_aspm = (
                $params
                | parse -r "ASPM (L[L0-1s ]*),"
                | get capture0.0
                | str replace " " ""
            )
            {address: $address, supported_aspm: $supported_aspm}
        }
    }
}

if not (is-admin) {
    error make -u {
        msg: "This script needs to be run as root"
    }
}
if $nu.os-info.name != "linux" {
    error make -u {
        msg: "This script needs to run under Linux"
    }
}
if (which lspci setpci|length) < 2 {
    error make -u {
        msg: "lspci and setpci need to be available in PATH"
    }
}

for device in (get-supported-devices) {
    patch-device $device.address $device.supported_aspm
}
