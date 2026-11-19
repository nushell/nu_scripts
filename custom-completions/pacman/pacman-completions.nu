# nu-version: 0.117.0
# Completions nativas: opções extraídas da ajuda da versão instalada.
def "nu-complete pacman" [token: record, place: record] {
    let operations = [
        {short: h, long: help, description: "Mostrar ajuda"}
        {short: V, long: version, description: "Mostrar versão"}
        {short: D, long: database, description: "Modificar a base de dados"}
        {short: F, long: files, description: "Consultar arquivos nos repositórios"}
        {short: Q, long: query, description: "Consultar pacotes instalados"}
        {short: R, long: remove, description: "Remover pacotes"}
        {short: S, long: sync, description: "Sincronizar e instalar pacotes"}
        {short: T, long: deptest, description: "Verificar dependências"}
        {short: U, long: upgrade, description: "Instalar arquivo de pacote"}
    ]
    let words = ($place.command | skip 1)
    let operation = ($operations | where {|op|
        $op.short not-in [h V] and ($words | any {|word|
            $word == $"--($op.long)" or (
                ($word starts-with '-') and not ($word starts-with '--')
                and ($word | str substring 1.. | str contains $op.short)
            )
        })
    } | first 1)
    let text = $token.text
    if ($operation | is-empty) {
        return ($operations | each {|op|
            [
                {value: $"-($op.short)", description: $op.description}
                {value: $"--($op.long)", description: $op.description}
            ]
        } | flatten)
    }
    if ($text | is-not-empty) and not ($text starts-with '-') { return null }
    let help = (^pacman $"-($operation.0.short)" --help | complete)
    if $help.exit_code != 0 { return null }
    let options = ($help.stdout | lines | parse --regex '^\s+(?:-(?P<short>[A-Za-z]),\s+)?--(?P<long>[a-z][a-z-]*)(?:\s+<[^>]+>)?\s+(?P<description>.+)$')
    $options | each {|option|
        let long = {value: $"--($option.long)", description: $option.description}
        if ($text starts-with '--') or ($option.short | is-empty) {
            [$long]
        } else {
            let prefix = if ($text | str length) > 1 { $text } else { "-" }
            [
                {value: $"($prefix)($option.short)", description: $option.description}
                $long
            ]
        }
    } | flatten
}

export extern pacman [
    ...args: external_arg@"nu-complete pacman"
]
