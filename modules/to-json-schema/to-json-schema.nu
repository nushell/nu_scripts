# Converts specific JSON to JSON schema.
def to-json-schema [schema: int, url: string, json: string] {
    if ($schema != 4 or $schema != 7) {
        error make { msg: $"'http://json-schema.org/draft-0($schema)/schema' is not supported yet." }
    }
    if url == "" {
        error make { msg: "Documentation url can't be empty." }
    }

    let schema = $"http://json-schema.org/draft-0($schema)/schema"

    $json | jq 'def to_title: . | gsub("(?<x>[A-Z])"; " \(.x)") | ascii_downcase;
    def to_description: . | to_title + "\n" + $url;
    
    def to_singular:
        if . | test("^[aeiouy]"; "i") then
            . | sub("^(?<x>.*?)s\n"; "An \(.x)\n")
        else
            . | sub("^(?<x>.*?)s\n"; "A \(.x)\n")
        end;
    
    def wrap: {
        type: "object",
        properties: with_entries(
            if .value | type != "object" then
                {
                    key,
                    value: ({
                        title: .key | to_title,
                        description: .key | to_description,
                        type: (.value | type),
                        
                    } +
                    if .key | test("width|height|size") then
                        { minimum: 0 }
                    else
                        {}
                    end +
                    if .value | type == "array" then
                        {
                            uniqueItems: true,
                            items: {
                                description: .key | to_description | to_singular
                            }
                        } *
                        if .value | length > 0 then
                            {
                                items: {
                                    type: .value[0] | type
                                }    
                            }
                        else
                            {}
                        end
                    else
                        {}
                    end +
                    if .key | test("^([Mm]y|[Ss]ample|[Ee]xample)[A-Z]") then
                        { examples: [.value] }
                    else
                        { default: .value }
                    end)
                }
            else
                .value = {
                    title: .key | to_title,
                    description: .key | to_description
                } + (.value | wrap) + {
                    additionalProperties: false
                }
            end)
        };
    
    {
        "$schema": $schema,
        title: "config",
        description: "A config"
    } + (. | wrap)' --arg url $url --arg schema $schema
}