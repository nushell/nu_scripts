#!/usr/bin/nu

# /etc/hosts update handler
module hosts {
    def display_heads [old, new] {
        echo "Current file:"
        echo $old
        echo "New file:"
        echo $new
        print ""
    }

    def are_the_same [old_head, new_head] {
        (($old_head | first) == ($new_head | first))
    }

    # Updater function for /etc/hosts
    export def update [
    --force (-f) # force replace /etc/hosts
    ] {
        # just sample values, feel free to change it but note that it works for StevenBlack files
        let LINK = "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/gambling-porn/hosts"
        let WHITELIST = ["multipasko"]
        let BLACKLIST = ["0.0.0.0 tiktok.com"]

        let whitelisted = "(" + ($WHITELIST | str join "|") + ")"
        let pattern = ($"0.0.0.0.*($whitelisted).*$")
        let OLD_FILE = "/etc/hosts"
        let TMP_FILE = (http get $LINK | lines)

        if ($env.LAST_EXIT_CODE == 0) {
            let OLD_HEAD = (open $OLD_FILE --raw | lines | first 8 | last 3)
            let TMP_HEAD = ($TMP_FILE | first 8 | last 3)

            display_heads $OLD_HEAD $TMP_HEAD
            if (not ((are_the_same $OLD_HEAD $TMP_HEAD) and (not $force))) {
                echo "Do you want to update the /etc/hosts file? [Y/n]"
                let choice = (input)
                if $choice in ["" "Y" "y"] {
                    let TMP_FILE = if ($WHITELIST|is-empty) {
                        ($TMP_FILE)
                        } else {
                        ($TMP_FILE | where {|line| $line !~ $pattern})
                    }

                    let TMP_FILE = ($TMP_FILE | append $BLACKLIST)

                    $TMP_FILE | save /tmp/temphostsfile
                    if ($env.LAST_EXIT_CODE == 0) {
			sudo mv /tmp/temphostsfile $OLD_FILE
                        echo "Done!"
                    } else {
                        error make -u {msg: "Something went wrong while overwriting the /etc/hosts file"}
                    }
                }
            } else {
                echo "No updates available."
            }
        } else {
            error make -u {msg: "Failed downloading the hosts file, try again."}
        }
    }
}
