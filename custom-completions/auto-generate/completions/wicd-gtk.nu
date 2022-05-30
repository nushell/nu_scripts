# Run the wicd tray icon only.
extern "wicd-gtk" [
	--tray(-t)					# Run the wicd tray icon only.
	--no-tray(-n)					# Run wicd without the tray icon.
	--help(-h)					# Print this help information.
	--no-animate(-a)					# Run the tray without network traffic tray animations.
	--only-notifications(-o)					# Dont display anything except notifications.
	...args
]