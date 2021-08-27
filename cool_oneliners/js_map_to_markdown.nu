# Ingest JavaScript Map JSON into nu then to markdown
open ../sample_data/js_map.json | each { echo [[Español English]; [ $it.0 $it.1]] } | to md
