# Nushell Data Analysis Reference

## Format Conversion

Nushell unifies structured data formats. `open` auto-detects by extension:
csv, eml, ics, ini, json, nuon, ods, ssv, toml, tsv, url, vcf, xlsx/xls, xml, yaml/yml, SQLite

```nu
# Auto-detect
open data.json                  # parsed JSON -> table/record
open data.csv                   # parsed CSV -> table
open data.toml                  # parsed TOML -> record
open data.db                    # SQLite -> tables

# Explicit parsing from strings
'{"a":1}' | from json
"a,b\n1,2" | from csv
$toml_string | from toml
$yaml_string | from yaml

# Serialization
{a: 1} | to json
$table | to csv
{a: 1} | to toml
{a: 1} | to yaml
{a: 1} | to nuon               # Nushell Object Notation

# Raw text (skip parsing)
open --raw file.json            # byte stream, not parsed
```

## Leveraging External JSON Output

**If a CLI tool supports `--json` or similar structured output, prefer running it in Nushell** over Bash. The JSON is parsed automatically and queryable immediately:

```nu
# External tool with JSON output -> instant structured data
^cargo metadata --format-version 1 | from json | get packages | select name version
^gh pr list --json title,state | from json | where state == "OPEN"
^docker ps --format json | lines | each { from json } | select Names State
^kubectl get pods -o json | from json | get items | select metadata.name status.phase
```

This eliminates the need for `jq`, `grep`, or `awk` pipelines. Any tool that outputs JSON becomes a first-class data source in Nushell.

## HTTP Requests

```nu
# GET - result is auto-parsed from JSON
http get https://api.example.com/data
http get https://api.example.com/data | get field

# POST with JSON body
http post --content-type application/json https://api.example.com/endpoint {key: "val"}

# POST with headers
http post https://api.example.com/sync -H {X-API-Key: "secret"} (bytes build)

# POST with headers and body
http post --content-type application/json https://api.example.com/data -H {Authorization: "Bearer token"} {key: "value"}
```

## Data Manipulation Patterns

### Grouping and Aggregation
```nu
# group-by with --to-table for aggregation
# Note: the group column is named after the grouper (e.g. "category"), not "group"
$data | group-by category --to-table | each {|g|
    {
        category: $g.category
        count: ($g.items | length)
        total: ($g.items | get price | math sum)
        avg: ($g.items | get price | math avg)
    }
}
```

### Pivoting Data
```nu
# Record to table
{name: "test", age: 30, city: "NYC"} | transpose key value

# Table to record
[[key value]; [a 1] [b 2]] | into record
```

### Structured Log Parsing
```nu
# parse extracts named fields from text, returns a table (not a record)
"2025-01-15 ERROR auth: timeout" | parse "{date} {level} {service}: {message}"
# => table with one row: [{date: "2025-01-15", level: "ERROR", service: "auth", message: "timeout"}]
# Access first match: ... | parse "..." | first

# Multi-line logs
open server.log | lines | parse "{date} [{level}] {msg}" | where level == "ERROR"
```

### Joining and Merging
```nu
# Horizontal merge (add columns)
$table1 | merge $table2

# Vertical append (add rows)
$table1 | append $table2
$table1 ++ $table2

# Spread records
{...$base, ...$overrides, extra: "field"}
```

## SQLite

```nu
open database.db                         # lists tables
open database.db | get table_name        # get table data
open database.db | query db "SELECT * FROM users WHERE age > 25"
```

## Polars Plugin (Large Datasets)

For datasets too large for Nushell's built-in table handling:

```nu
plugin use polars

# Open file formats efficiently
polars open large.parquet | polars select name status | polars collect
polars open data.csv | polars first 5 | polars into-nu

# Convert Nushell table to DataFrame
ps | polars into-df | polars filter (polars col cpu > 50) | polars into-nu

# Aggregation
polars open sales.csv
    | polars group-by category
    | polars agg (polars col price | polars sum)
    | polars collect

# Summary statistics
$data | polars into-df | polars summary

# Save results
polars open input.parquet | polars select name status | polars save output.parquet
```

## Math/Statistics

```nu
[1 2 3 4 5] | math sum       # 15
[1 2 3 4 5] | math avg       # 3
[1 2 3 4 5] | math min       # 1
[1 2 3 4 5] | math max       # 5
[1 2 3 4 5] | math median    # 3
[1.5 2.7] | math round       # [2, 3]
[1.5 2.7] | math floor       # [1, 2]
[1.5 2.7] | math ceil        # [2, 3]
[-5 3] | math abs             # [5, 3]
```

## NUON (Nushell Object Notation)

A JSON superset supporting comments, optional commas, and Nushell literals:

```nuon
{
    name: "project"     # no quotes needed for simple keys
    created: 2025-01-15
    timeout: 5sec
    size: 1.5mb
    data: [1 2 3]       # commas optional
}
```
