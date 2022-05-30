# Log to standard error as well as files
extern "minikube" [

	...args
]

# Disable the addon w/ADDON_NAME within minikube
extern "minikube disable" [

	...args
]

# Enable the addon w/ADDON_NAME within minikube
extern "minikube enable" [

	...args
]

# List all available minikube addons as well as their current status
extern "minikube list" [

	...args
]

# Open the addon w/ADDON_NAME within minikube
extern "minikube open" [
	--format					# Format to output addons URL in (default http://{{.IP}}:{{.Port}}
	--https					# Open the addons URL with https instead of http
	--url					# Display the kubernetes addons URL instead of opening it
	...args
]

# Shell
extern "minikube bash" [

	...args
]

# Gets the value of PROPERTY_NAME from the minikube config file
extern "minikube get" [

	...args
]

# Sets an individual value in a minikube config file
extern "minikube set" [

	...args
]

# Unsets an individual value in a minikube config file
extern "minikube unset" [

	...args
]

# Display values currently set in the minikube config file
extern "minikube view" [
	--format					# Go template format string for the config view output
	...args
]

# Shell
extern "minikube fish cmd powershell tcsh bash zsh" [

	...args
]

# VM driver
extern "minikube virtualbox kvm hyperv" [

	...args
]