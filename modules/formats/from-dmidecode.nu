# Convert from output of dmidecode to structured data
export def "from dmidecode" [] {
    lines
    | skip until {|x|
        $x starts-with 'Handle'
    }
    | split list ''
    | each {|entry|
        let parsed_entry = (
            $entry
            | get 0
            | parse 'Handle {handle}, DMI type {type}, {bytes} bytes'
            | get 0
            | insert description ($entry|get 1)
            | insert values {
                if ($entry|length) > 2 {
                    if ($entry|get 2|str trim) == 'Header and Data:' {
                        {'header_and_data': ($entry|skip 3|str trim)}
                    } else {
                        $entry
                        | skip 2
                        | split column ':'
                        | str trim
                        | str downcase column1
                        | str replace -a ' ' '_' column1
                        | transpose -r -d
                    }
                } else {
                    {}
                }
            }
        )

        $parsed_entry
    }
}
