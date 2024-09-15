export-env {
    $env.OPENAI_PROMPT = {
        'json-to-jsonschema': {
            prompt: [
                "Analyze the following JSON data to convert it into a jsonschema:"
                "```{}```"
            ]
            model: '',
            description: 'Analyze JSON content, converting it into a jsonschema'
        }
        'json-to-sql': {
            prompt: [
                "Analyze the following JSON data to convert it into a SQL statement for creating a table:"
                "```"
                "{}"
                "```"
            ],
            model: 'qwen2:1.5b',
            description: 'Analyze JSON content, converting it into a SQL create table statement'
        }
        'git-diff-summary': {
            prompt: [
                "Extract commit logs from git differences, summarizing only the content changes in files while ignoring hash changes."
                "```"
                "{}"
                "```"
            ]
            description: 'Summarize from git differences'
        }
        'trans-to-en': {
            prompt: [
                "Translate the following text into English:"
                "```"
                "{}"
                "```"
            ],
            model: 'qwen2:1.5b',
            description: 'Translation to English'
        }
    }
}
