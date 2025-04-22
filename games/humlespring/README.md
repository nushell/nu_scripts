# Humlespring Text Adventure

A simple text adventure game written in Nushell.

The game utilizes Nushell's functional programming capabilities in managing the game map and player state.

*   **Immutable Data Structures**: The game map (`$map`) is defined as a record, which is an immutable data structure. This means the map's contents cannot be changed directly during gameplay, promoting data integrity and predictable game behavior. Locations, exits, items, and NPCs are all defined within this structure.

*   **Data Transformation**: The `describe_location` function takes the player state and map as input and transforms this data to produce the location description. It uses the `get` command to access location data and `str join` to format the output, demonstrating functional data manipulation.

*   **State Management**: The player state (`$player_state`) is a mutable record, but updates to it are handled in a controlled manner within the main loop. Actions like "go", "take", and "search" update the state by assigning new values to the `$player_state` record.

## How to Play

1.  Make sure you have Nushell installed (`https://www.nushell.sh/`).
2.  Save the script as `script.nu`.
3.  Run the game by executing `nu script.nu` in your terminal.

## Commands

*   `look` or `l`: Describe the current location.
*   `go` or `move` [direction]: Move in the specified direction (e.g., `go north`).
*   `take` or `get` [item]: Pick up an item (e.g., `take leaflet`).
*   `inventory` or `i`: View your inventory.
*   `talk` [npc]: Talk to a non-player character (e.g., `talk alexander`).
*   `search` [object]: Search an object in the current location (e.g., `search tree`).
*   `give` [item]: Give an item to an NPC (e.g., `give cat`).
*   `quit` or `exit`: Quit the game.

## Goal

Olivia has lost her cat, Mittens. Find Mittens and return her to Olivia in the village square.
