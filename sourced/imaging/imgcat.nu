# https://iterm2.com/documentation-images.html

def print_osc [] {
    if $env.TERM == screen* {
        "\ePtmux;\e\e]"
    } else {
        "\e]"
    }
}

def print_st [] {
    if $env.TERM == screen* {
        "\a\e\\"
    } else {
        "\a"
    }
}

def --env b64_encode [fn] {
    open $fn | encode base64
}

def --env b64_decode [fn] {
    $fn | decode base64 -b
}

def print_image [
    filename # Filename to convey to client
    inline # 0 or 1
    base64contents # Base64-encoded contents
    print_filename # If non-empty, print the filename before outputting the image
] {
    let a = (print_osc)
    let b = "1337;File="
    let c = (if ($filename | length) > 0 {
        let b64_enc_data = (b64_encode $filename)
        $"name=($b64_enc_data);"
    })
    let b64_dec_data = (b64_decode $base64contents)
    let d = $"size=($b64_dec_data | bytes length)"
    let e = $";inline=($inline)"
    let f = ":"
    let g = $base64contents
    let h = print_st
    let i = "\n"
    let j = (if ($print_filename | length) > 0 {
        print -n $filename
    })

    [ $a $b $c $d $e $f $g $h $i $j ] | str join
}

def error [] {
    print "Error: ($env.LAST_EXIT_CODE)"
}

def show_help [] {
    print "Usage: imgcat [-p] filename ..."
    print "   or: cat filename | imgcat"
}

# imgcat.nu shows images in your terminal if your terminal supports it
def imgcat [
    --help(-h) # Help/Usage message
    --print(-p) # Print filename
    --url(-u) # Use a URL
    filename # The filename to show
] {
    if $help {
        show_help
    }

    let print_filename = (
        if $print {
            1
        }
    )

    let url_img = (
        if $url {
            let encoded_image = (b64_encode (http get $url))
            print_image $url 1 $encoded_image $print_filename
        }
    )

    if ($filename | path exists) {
        print_image $filename 1 (b64_encode $filename) $print_filename
    } else {
        print $"imgcat: ($filename): No such file or directory"
    }
}
