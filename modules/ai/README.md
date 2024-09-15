OpenAI and Ollama Clients

- Streaming output
- The OpenAI interface employs the `ai` prefix for user-friendly input.
- Option for controllable return values
- Supports chat context retention
- Customizable prompt functionality for `ai do`
  - Refer to [prompt.nu](prompt.nu) for definition guidelines
  - Default model can be overridden using `--model`
- Importing and exporting of Ollama models
- Connection details managed through environment variables

Control some options with the following code.
```
$env.OLLAMA_HOST = 'http://localhost:11434'
$env.OPENAI_HOST = 'http://localhost:11434'
$env.OPENAI_API_KEY = 'secret'
$env.OPENAI_PROMPT = $env.OPENAI_PROMPT
| insert 'json2rust' {
    prompt: [
        "Analyze the following JSON data to convert it into a Rust struct:"
        "```{}```"
    ]
    model: '',
    description: 'Analyze JSON content, converting it into a Rust struct'
}
```
