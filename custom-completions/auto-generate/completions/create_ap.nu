# Show help
extern "create_ap" [
	--help(-h)					# Show help
	--version					# Print version number
	--psk					# Use 64 hex digits pre-shared-key
	--hidden					# Make the Access Point hidden
	--mac-filter					# Enable MAC address filtering
	--mac-filter-accept					# Location of MAC address filter list
	--redirect-to-localhost					# Redirect every web request to localhost
	--isolate-clients					# Disable communication between clients
	--ieee80211n					# Enable IEEE 802.11n
	--ieee80211ac					# Enable IEEE 802.11ac
	--driver					# Choose your WiFi adapter driver
	--no-virt					# Do not create virtual interface
	--no-haveged					# Do not run haveged automatically when needed
	--fix-unmanaged					# Fix NetworkManager showing interface as unmanaged
	--daemon					# Run create_ap in the background
	--list-running					# Show already running create_ap processes
	--no-dns					# Disable dnsmasq DNS server
	--no-dnsmasq					# Disable dnsmasq server completely
	...args
]