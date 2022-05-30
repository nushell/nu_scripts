# Path to client helper on local machine (default: "mosh-client")
extern "mosh" [
	--client					# Path to client helper on local machine (default: "mosh-client")
	--server					# Command to run server helper on remote machine (default: "mosh-server")
	--ssh					# SSH command to run when setting up session (example: "ssh -p 2222") (default: "ssh")
	--predict					# Controls use of speculative local echo
	--port(-p)					# Use a particular server-side UDP port or port range
	...args
]

# Controls use of speculative local echo
extern "mosh adaptive always never experimental" [
	--client					# Path to client helper on local machine (default: "mosh-client")
	--server					# Command to run server helper on remote machine (default: "mosh-server")
	--ssh					# SSH command to run when setting up session (example: "ssh -p 2222") (default: "ssh")
	--predict					# Controls use of speculative local echo
	--port(-p)					# Use a particular server-side UDP port or port range
	...args
]