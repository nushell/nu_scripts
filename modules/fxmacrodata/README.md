# fxmacrodata

Commands for the [FXMacroData](https://fxmacrodata.com/?utm_source=github&utm_medium=referral&utm_campaign=nu_scripts&utm_content=readme) REST API: economic indicator releases (CPI, payrolls, GDP, policy rates, ...), release calendars and FX spot rates, returned as Nushell tables with `datetime` columns.

```nushell
use modules/fxmacrodata
```

| Command | Description |
|---------|-------------|
| `fxmacrodata catalogue [currency]` | indicators available for a currency (default `usd`) |
| `fxmacrodata announcements <currency> <indicator>` | release history for one indicator, most recent first. `--start`, `--end` (YYYY-MM-DD), `--limit` |
| `fxmacrodata calendar [currency]` | upcoming scheduled releases. `--indicator` to filter |
| `fxmacrodata forex <base> <quote>` | daily FX spot rates. `--start`, `--end`, `--limit` (needs an API key) |

Every command accepts `--raw` to return the unmodified JSON response instead of a table.

## API key

USD indicators and the USD calendar work without a key. Keyless history covers roughly the last 90 days and new releases show up after a short delay; when either of those changes what you get back, a notice is printed to stderr. Other currencies and `forex` need a key:

```nushell
$env.FXMACRODATA_API_KEY = "..."
```

The key is only ever sent in the `X-API-Key` request header.

## Examples

```nushell
> fxmacrodata announcements usd inflation --limit 5 | update date { format date "%Y-%m-%d" }
fxmacrodata: Anonymous access returns the most recent 90 days. Supply an API key for the full history.
╭───┬────────────┬───────┬──────────┬──────────────┬────────╮
│ # │    date    │ value │ previous │   released   │ source │
├───┼────────────┼───────┼──────────┼──────────────┼────────┤
│ 0 │ 2026-08-31 │  3.40 │     3.40 │ 3 weeks ago  │ BLS    │
│ 1 │ 2026-07-31 │  3.40 │          │ 2 months ago │ BLS    │
╰───┴────────────┴───────┴──────────┴──────────────┴────────╯

> fxmacrodata calendar usd --indicator inflation
╭───┬──────────────┬───────────┬─────────────────┬────────────┬───────────╮
│ # │ release_time │ indicator │      name       │ importance │ confirmed │
├───┼──────────────┼───────────┼─────────────────┼────────────┼───────────┤
│ 0 │ in a week    │ inflation │ Inflation (CPI) │ high       │ true      │
│ 1 │ in a month   │ inflation │ Inflation (CPI) │ high       │ true      │
│ 2 │ in 2 months  │ inflation │ Inflation (CPI) │ high       │ true      │
╰───┴──────────────┴───────────┴─────────────────┴────────────┴───────────╯

# high-importance US releases in the next two weeks
> fxmacrodata calendar usd | where importance == high and release_time < ((date now) + 2wk)
```
