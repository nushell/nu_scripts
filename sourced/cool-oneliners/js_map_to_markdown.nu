# Ingest JavaScript Map JSON into nu then to markdown
open assets/js_map.json | each { echo [[Español English]; [ $in.0 $in.1]] } | flatten | to md
