#!/usr/bin/env nu

# --- Game Data ---

# Define the locations in the village
let map = {
    village_square: {
        desc: "You are in the charming village square of Humlespring. Cobblestones pave the ground. Paths lead north, east, and west. Olivia is here, looking worried."
        exits: { north: "tavern", east: "market", west: "alexander_house" }
        items: ["leaflet"]
        npcs: {
            olivia: "Olivia paces back and forth. 'Oh, Alexander... have you seen Mittens? My cat is missing! I last saw her near the old oak tree by the market.'"
        }
    },
    tavern: {
        desc: "The 'Leaky Mug' tavern. It smells faintly of ale and sawdust. The only exit is south."
        exits: { south: "village_square" }
        items: ["mug"]
        npcs: {}
    },
    market: {
        desc: "The village market area. Stalls are mostly empty now, but an old oak tree stands tall nearby. A faint 'meow' can be heard from the tree. The path leads back west."
        exits: { west: "village_square" }
        items: [] # Mittens isn't an 'item' to take, but is found here
        npcs: {}
        special: "You look up the old oak tree and see Mittens stuck on a branch! You carefully coax her down." # Add a trigger for this
    },
    alexander_house: {
        desc: "You are outside a small, tidy cottage. This must be Alexander's house. The only exit is east. Alexander is tending his small garden."
        exits: { east: "village_square" }
        items: ["watering_can"]
        npcs: {
            alexander: "'Ah, hello!' Alexander says, wiping his brow. 'Lovely day, isn't it? Though Olivia seems quite upset about her cat, Mittens. Maybe check near the big oak by the market?'"
        }
    }
}

# --- Game State ---

# Player's current status (mutable)
mut player_state = {
    location: "village_square" # Starting location ID
    inventory: []
    found_cat: false
}

# --- Helper Functions ---

# Describe the current location
def describe_location [state: record, map: record] {
    let current_loc_id = $state.location
    let loc_data = ($map | get $current_loc_id)

    # Description
    print $loc_data.desc

    # Items
    if not ($loc_data.items | is-empty) {
        print $"You see here: ($loc_data.items | str join ', ')"
    }

    # NPCs
    let npcs = ($loc_data.npcs | columns)
    if not ($npcs | is-empty) {
        print $"People here: ($npcs | str join ', ')"
    }

    # Exits
    let exits = ($loc_data.exits | columns | str join ', ')
    print $"Exits are: ($exits)"

    # Check for winning condition trigger
    if $current_loc_id == "market" and not $state.found_cat {
       print "\nHint: Maybe you should 'search tree'?"
    }
}

# Handle player actions are now inlined in the main loop below

# --- Main Game Loop ---

print "Welcome to Humlespring!"
print "-------------------------"
describe_location $player_state $map

loop {
    # Get player input
    let user_input = (input "> " | str trim)

    # Skip empty input
    if $user_input == "" { continue }

    # Parse input (simple verb-noun)
    let parts = ($user_input | split row " ")
    let verb = ($parts | get 0 | str downcase)
    # Use `get` and `default` for robust noun handling (handles commands with no noun)
    let noun = if ($parts | length) > 1 { $parts | get 1 | default "" | str downcase } else {""}

    # grab the current location once
    let loc_data = ($map | get $player_state.location)

    # Handle the action directly in the loop
    match $verb {
        "quit" | "exit" => {
            print "Goodbye!"
            exit
        }
        "look" | "l" => {
            describe_location $player_state $map
        }
        "go" | "move" => {
            if ( $noun not-in ( $loc_data.exits | columns )) {
                print "You can't go that way."
            } else {
                let new_loc = ($loc_data.exits | get $noun)
                $player_state.location = $new_loc
                print $"You go ($noun)."
                print ""  # line break
                describe_location $player_state $map
            }
        }
        "inventory" | "i" => {
            if ($player_state.inventory | is-empty) {
                print "Your inventory is empty."
            } else {
                print $"You are carrying: ($player_state.inventory | str join ', ')"
            }
        }
        "take" | "get" => {
            if ($loc_data.items | find -r $noun).0? != null {
                # Just add to inventory
                $player_state.inventory = ($player_state.inventory | append $noun)
                print $"You take the ($noun)."
            } else {
                print $"There is no '($noun)' here to take."
            }
        }
        "talk" => {
            if ( $noun not-in ( $loc_data.npcs | columns )) {
            print $"You cannot talk to ($noun) " } else {
                if ($loc_data.npcs | get $noun) == null {
                    print $"There is no one called '($noun)' here to talk to."
                } else {
                    print ($loc_data.npcs | get $noun)
                }
            }
        }
        "search" => {
            if $noun == "tree" and $player_state.location == "market" {
                if $player_state.found_cat {
                    print "You already found Mittens!"
                } else {
                    print ($loc_data | get special)
                    $player_state.found_cat = true
                    print "\nMittens purrs happily in your arms. You should return her to Olivia!"
                }
            } else {
                print "You search around, but find nothing special."
            }
        }
        "give" => {
            if $noun == "cat" and $player_state.location == "village_square" and $player_state.found_cat {
                if ('olivia' in ($loc_data.npcs | columns)) {
                    print "\nYou give Mittens back to Olivia. She is overjoyed!"
                    print "'Oh, thank you, thank you!' she cries, hugging her cat. 'You saved her!'"
                    print "\n*** Congratulations! You completed the adventure! ***"
                    exit
                } else {
                    print "Olivia isn't here right now."
                }
            } else if $player_state.found_cat and $noun == "cat" {
                print "You need to be in the village square to give the cat back to Olivia."
            } else {
                print "You don't have that to give, or you can't give it here/now."
            }
        }
        _ => {
            print "I don't understand that command. Try: go, look, take, inventory, talk, search, give, quit."
        }
    }
    print "" # Add a newline for better readability
}
