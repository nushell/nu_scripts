# Output a brief synopsis of command options then quit
extern "totem" [
	--usage					# Output a brief synopsis of command options then quit
	--help(-?)					# Output  a longer help message then quit
	--version					# Output version information then quit
	--play-pause					# Tell any running totem instance: Toggle between play and pause
	--play					# Tell any running totem instance: Play
	--pause					# Tell any running totem instance: Pause
	--next					# Tell any running totem instance: Skip to next
	--previous					# Tell any running totem instance: Skip to previous
	--seek-fwd					# Tell any running totem instance: Seek forwards 15 sec
	--seek-bwd					# Tell any running totem instance: Seek backwards 15 sec
	--volume-up					# Tell any running totem instance: Raise volume by 8%
	--volume-down					# Tell any running totem instance: Lower volume by 8%
	--fullscreen					# Tell any running totem instance: Toggle fullscreen
	--quit					# Tell any running totem instance: Quit
	...args
]