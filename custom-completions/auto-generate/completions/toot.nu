# Switch between accounts.
extern "toot activate" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Show logged in accounts and instances
extern "toot auth" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Display instance details
extern "toot instance" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Log in using your browser
extern "toot login" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Log in from the console
extern "toot login_cli" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Log out
extern "toot logout" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Show notifications
extern "toot notifications" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Post a status text
extern "toot post" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Search for users or hashtags
extern "toot search" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Show toot thread items
extern "toot thread" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Show recent items
extern "toot timeline" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Toot terminal user interface
extern "toot tui" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Upload a file
extern "toot upload" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Display user details
extern "toot whoami" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Display account details
extern "toot whois" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Delete a status
extern "toot delete" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Favourite a status
extern "toot favourite" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Pin a status
extern "toot pin" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Reblog a status
extern "toot reblog" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Show rebloggers of status
extern "toot reblogged_by" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Unfavourite a status
extern "toot unfavourite" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Unpin a status
extern "toot unpin" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Unreblog a status
extern "toot unreblog" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Follow an account
extern "toot follow" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Unfollow an account
extern "toot unfollow" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Mute an account
extern "toot mute" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Unmute an account
extern "toot unmute" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Block an account
extern "toot block" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# Unblock an account
extern "toot unblock" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]

# show debug log
extern "toot" [
	--debug					# show debug log
	--no-color					# no colors in output
	--quiet					# don't write to stdout on success
	--help(-h)					# show help message
	--disable-https					# disable HTTPS
	--clear					# delete all notifications
	--public(-p)					# show public timeline
	--local(-l)					# show only statuses from local instance
	--once(-1)					# do not prompt to continue
	--media(-m)					# path to the media file
	--sensitive(-s)					# mark as NSFW
	...args
]