# Notes

- `title` properties are generated from input property names converting all
  capital letters to lowercase with space before them like:
  `someImportantKey` -> `some important key`
- `description` properties are generated from input property names converting all
  capital letters to lowercase with space before them and appended doc urls like:
  `someImportantKey` -> `some important key\nhttps://some/documentation`
- `type` properties are generated from input property values
- `minimum` properties are generated for input properties containing `width`/
  `height`/`size` word
- `default` properties are generated for input properties not starting with
  `my`/`sample`/`example` words
- `example` properties are generated for input properties starting with
  `my`/`sample`/`example` words

# Example

Input JSON:

```json
{
    "size": "normal",
    "myInput": 1,
    "width": 21,
    "files": ["test.blend", "test.blend"]
}
```

Output JSON schema:

```json
{
  "$schema": "http://json-schema.org/draft-07/schema",
  "title": "config",
  "description": "A config",
  "type": "object",
  "properties": {
    "size": {
      "title": "size",
      "description": "size\nhttps://my-doc",
      "type": "string",
      "minimum": 0,
      "default": "normal"
    },
    "myInput": {
      "title": "my input",
      "description": "my input\nhttps://my-doc",
      "type": "number",
      "examples": [
        1
      ]
    },
    "width": {
      "title": "width",
      "description": "width\nhttps://my-doc",
      "type": "number",
      "minimum": 0,
      "default": 21
    },
    "files": {
      "title": "files",
      "description": "files\nhttps://my-doc",
      "type": "array",
      "uniqueItems": true,
      "items": {
        "description": "A file\nhttps://my-doc",
        "type": "string"
      },
      "default": [
        "test.blend",
        "test.blend"
      ]
    }
  }
}
```