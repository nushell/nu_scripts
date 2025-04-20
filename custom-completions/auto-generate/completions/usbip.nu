# 
extern "usbip" [
	--remote(-r)					# The machine with exported USB devices
	--busid(-b)					# Busid of the device on <host>
	--device(-d)					# Id of the virtual UDB on <host>
	--port(-p)					# Vhci_hcd port the device is on
	--parsable(-p)					# Parsable list format
	--remote(-r)					# List the exportable USB devices on <host>
	--local(-l)					# List the local USB devices
	--device(-d)					# List the local USB gadgets bound to usbip-vudc
	--busid(-b)					# Bind usbip-host.ko to device on <busid>
	--busid(-b)					# Unbind usbip-host.ko to device on <busid>
	...args
]

# Attach a USB device to the host
extern "usbip attach" [
	--remote(-r)					# The machine with exported USB devices
	--busid(-b)					# Busid of the device on <host>
	--device(-d)					# Id of the virtual UDB on <host>
	--port(-p)					# Vhci_hcd port the device is on
	--parsable(-p)					# Parsable list format
	--remote(-r)					# List the exportable USB devices on <host>
	--local(-l)					# List the local USB devices
	--device(-d)					# List the local USB gadgets bound to usbip-vudc
	--busid(-b)					# Bind usbip-host.ko to device on <busid>
	--busid(-b)					# Unbind usbip-host.ko to device on <busid>
	...args
]

# Detach a USB device from the host
extern "usbip detach" [
	--remote(-r)					# The machine with exported USB devices
	--busid(-b)					# Busid of the device on <host>
	--device(-d)					# Id of the virtual UDB on <host>
	--port(-p)					# Vhci_hcd port the device is on
	--parsable(-p)					# Parsable list format
	--remote(-r)					# List the exportable USB devices on <host>
	--local(-l)					# List the local USB devices
	--device(-d)					# List the local USB gadgets bound to usbip-vudc
	--busid(-b)					# Bind usbip-host.ko to device on <busid>
	--busid(-b)					# Unbind usbip-host.ko to device on <busid>
	...args
]

# List USB devices on the host
extern "usbip list" [
	--remote(-r)					# The machine with exported USB devices
	--busid(-b)					# Busid of the device on <host>
	--device(-d)					# Id of the virtual UDB on <host>
	--port(-p)					# Vhci_hcd port the device is on
	--parsable(-p)					# Parsable list format
	--remote(-r)					# List the exportable USB devices on <host>
	--local(-l)					# List the local USB devices
	--device(-d)					# List the local USB gadgets bound to usbip-vudc
	--busid(-b)					# Bind usbip-host.ko to device on <busid>
	--busid(-b)					# Unbind usbip-host.ko to device on <busid>
	...args
]

# Bind a USB device to a driver
extern "usbip bind" [
	--remote(-r)					# The machine with exported USB devices
	--busid(-b)					# Busid of the device on <host>
	--device(-d)					# Id of the virtual UDB on <host>
	--port(-p)					# Vhci_hcd port the device is on
	--parsable(-p)					# Parsable list format
	--remote(-r)					# List the exportable USB devices on <host>
	--local(-l)					# List the local USB devices
	--device(-d)					# List the local USB gadgets bound to usbip-vudc
	--busid(-b)					# Bind usbip-host.ko to device on <busid>
	--busid(-b)					# Unbind usbip-host.ko to device on <busid>
	...args
]

# Unbind a USB device from a driver
extern "usbip unbind" [
	--remote(-r)					# The machine with exported USB devices
	--busid(-b)					# Busid of the device on <host>
	--device(-d)					# Id of the virtual UDB on <host>
	--port(-p)					# Vhci_hcd port the device is on
	--parsable(-p)					# Parsable list format
	--remote(-r)					# List the exportable USB devices on <host>
	--local(-l)					# List the local USB devices
	--device(-d)					# List the local USB gadgets bound to usbip-vudc
	--busid(-b)					# Bind usbip-host.ko to device on <busid>
	--busid(-b)					# Unbind usbip-host.ko to device on <busid>
	...args
]

# List USB ports on the host
extern "usbip port" [
	--remote(-r)					# The machine with exported USB devices
	--busid(-b)					# Busid of the device on <host>
	--device(-d)					# Id of the virtual UDB on <host>
	--port(-p)					# Vhci_hcd port the device is on
	--parsable(-p)					# Parsable list format
	--remote(-r)					# List the exportable USB devices on <host>
	--local(-l)					# List the local USB devices
	--device(-d)					# List the local USB gadgets bound to usbip-vudc
	--busid(-b)					# Bind usbip-host.ko to device on <busid>
	--busid(-b)					# Unbind usbip-host.ko to device on <busid>
	...args
]