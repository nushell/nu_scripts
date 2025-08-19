def "twin format" [filename] {
  use std/clip
  use std-rfc/str

  {
    Authorization: $'Bearer (kv get -u OPENROUTER_API_KEY)'
  }
  | kv set headers

  $"
    Rewrite the following auto-generated changelog so it's more natural. For example, change things like 'rgwood created [Bump dependencies...' to 'rgwood [bumped dependencies...'. Keep the inline links. Make sure to keep ALL original URLs! When returning the text, do not include any explaination of the change or the surrounding backticks around the result:

    ```
    (open --raw $filename)
    ```
  "
  | str unindent
  | kv set prompt

  {
    role: 'user'
    content: (kv drop prompt)
  }
  | kv set message

  {
    model: 'deepseek/deepseek-chat-v3-0324'
    messages: [ (kv drop message) ]
  }
  | kv set body

  http post -ef -t application/json -H (kv drop headers) https://openrouter.ai/api/v1/chat/completions (kv drop body)
  | kv set rewrite

  kv drop rewrite
  | get body.choices.0.message.content
  | kv set rewrite_body

  kv drop rewrite_body
}
