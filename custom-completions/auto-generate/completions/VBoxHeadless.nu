# Enable or disamble VRDE server or don't change setting
extern "VBoxHeadless on off config" [
	--vrde(-v)					# Enable or disamble VRDE server or don't change setting
	--settingspwfile					# Specify file containing setting password
	--start-paused					# Start VM in paused state
	--filename(-f)					# File name when recording
	...args
]

# Specify file containing setting password
extern "VBoxHeadless" [
	--vrde(-v)					# Enable or disamble VRDE server or don't change setting
	--settingspwfile					# Specify file containing setting password
	--start-paused					# Start VM in paused state
	--filename(-f)					# File name when recording
	...args
]