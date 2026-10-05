# FXMacroData API wrapper
#
# Economic indicator releases, release calendars and FX spot rates from
# https://api.fxmacrodata.com, returned as Nushell tables.
#
# USD data works without an API key. Other currencies and the FX endpoint need
# a key, which is read from `$env.FXMACRODATA_API_KEY` and sent in the
# `X-API-Key` header.

const BASE_URL = "https://api.fxmacrodata.com/v1"

def "nu-complete fxmacrodata currencies" [] {
    [
        aud brl cad chf cnh cny dkk eur gbp huf ils
        jpy krw myr ngn nok nzd pen sek thb twd usd
    ]
}

def api-headers []: nothing -> record {
    let key = $env.FXMACRODATA_API_KEY? | default "" | str trim
    if ($key | is-empty) { {} } else { {X-API-Key: $key} }
}

# GET a path under /v1, dropping null query parameters
def api-get [path: string, query: record = {}]: nothing -> any {
    let params = $query
        | transpose key value
        | where value != null
        | each {|p| {key: $p.key, value: ($p.value | into string)} }
    let url = if ($params | is-empty) {
        $"($BASE_URL)($path)"
    } else {
        $"($BASE_URL)($path)?($params | transpose -r -d | url build-query)"
    }

    # never follow redirects, so the key is not re-sent to another host
    let response = http get --full --allow-errors --redirect-mode error --headers (api-headers) $url
    if $response.status >= 400 {
        let detail = if ($response.body | describe) =~ "^record" {
            $response.body.detail? | default ($response.body | to json -r)
        } else {
            $response.body | into string
        }
        error make --unspanned {
            msg: $"FXMacroData request failed with HTTP ($response.status): ($detail)"
        }
    }
    let body = $response.body
    if ($body | describe) !~ "^record" or ($body.detail? != null and $body.data? == null) {
        error make --unspanned {
            msg: "FXMacroData returned an unexpected response"
        }
    }
    $body
}

# Print free-tier notices to stderr, but only when they affected the result:
# the history window when it cut rows from this page, the release delay when
# it withheld a release
def report-free-tier [body: record] {
    let window = $body.freemium_window? | default {}
    let page = $body.pagination? | default {}
    let returned = $page.returned_count? | default ($body.data? | default [] | length)
    let trimmed = (
        ($window.applied? | default false)
        and not ($page.has_more? | default false)
        and $returned < ($page.limit? | default 0)
    )
    if $trimmed {
        print --stderr $"fxmacrodata: ($window.message? | default 'free tier history is limited')"
    }
    let delay = $body.freemium_delay? | default {}
    let withheld = $delay.withheld_count? | default 0
    if ($delay.applied? | default false) and $withheld > 0 {
        print --stderr $"fxmacrodata: ($delay.message? | default 'free tier data is delayed') \(($withheld) release\(s\) withheld\)"
    }
}

def epoch-to-datetime []: any -> any {
    if $in == null { null } else { $in * 1_000_000_000 | into datetime }
}

def date-to-datetime []: any -> any {
    if ($in | is-empty) { null } else { $"($in)T00:00:00+00:00" | into datetime }
}

# List the indicators published for a currency
#
# Each row is one indicator slug that can be passed to `fxmacrodata announcements`.
@example "USD indicators that have recent data" { fxmacrodata catalogue usd | where has_recent_data }
export def catalogue [
    currency: string@"nu-complete fxmacrodata currencies" = "usd" # three-letter currency code
    --raw # return the unmodified JSON response
]: nothing -> any {
    let body = api-get $"/data_catalogue/($currency | str lowercase)"
    if $raw { return $body }

    $body
    | transpose indicator meta
    | each {|row|
        let cov = $row.meta.coverage? | default {}
        {
            indicator: $row.indicator
            name: $row.meta.name?
            unit: $row.meta.unit?
            frequency: $row.meta.frequency?
            source: $row.meta.source?
            earliest: ($cov.earliest_available_date? | date-to-datetime)
            latest: ($cov.latest_available_date? | date-to-datetime)
            latest_release: ($cov.latest_release_date? | date-to-datetime)
            has_recent_data: $cov.has_recent_data?
            requires_api_key: $cov.requires_api_key?
        }
    }
}

# Get release history for one indicator, most recent first
#
# `date` is the reference period and `released` is when the figure was
# published. Without an API key, USD history covers roughly the last 90 days
# and new releases appear after a short delay; a notice is printed to stderr
# when either of those changes the result.
@example "Last 12 US CPI releases" { fxmacrodata announcements usd inflation --limit 12 }
@example "US payrolls since the start of 2025 (older history needs an API key)" { fxmacrodata announcements usd non_farm_payrolls --start 2025-01-01 }
export def announcements [
    currency: string@"nu-complete fxmacrodata currencies" # three-letter currency code
    indicator: string # indicator slug, see `fxmacrodata catalogue`
    --start: string # first period date, YYYY-MM-DD
    --end: string # last period date, YYYY-MM-DD
    --limit: int # maximum number of rows (1-100)
    --raw # return the unmodified JSON response
]: nothing -> any {
    let body = api-get $"/announcements/($currency | str lowercase)/($indicator)" {
        start_date: $start
        end_date: $end
        limit: $limit
    }
    report-free-tier $body
    if $raw { return $body }

    $body.data
    | each {|row|
        {
            date: ($row.date | date-to-datetime)
            value: $row.val
            previous: $row.previous_value?
            released: ($row.announcement_datetime? | epoch-to-datetime)
            source: $row.source?
        }
    }
}

# Get upcoming scheduled releases for a currency
@example "Upcoming US releases" { fxmacrodata calendar usd }
@example "Next US CPI releases" { fxmacrodata calendar usd --indicator inflation }
export def calendar [
    currency: string@"nu-complete fxmacrodata currencies" = "usd" # three-letter currency code
    --indicator: string # only show releases for this indicator slug
    --raw # return the unmodified JSON response
]: nothing -> any {
    let body = api-get $"/calendar/($currency | str lowercase)" {indicator: $indicator}
    if $raw { return $body }

    $body.data
    | each {|row|
        {
            release_time: ($row.announcement_datetime | epoch-to-datetime)
            indicator: $row.release
            name: $row.name?
            importance: $row.event_importance?
            confirmed: $row.release_date_confirmed?
        }
    }
}

# Get daily FX spot rates for a currency pair, most recent first
#
# Requires an API key in `$env.FXMACRODATA_API_KEY`.
@example "Last 30 EUR/USD fixes" { fxmacrodata forex eur usd --limit 30 }
export def forex [
    base: string@"nu-complete fxmacrodata currencies" # base currency code
    quote: string@"nu-complete fxmacrodata currencies" # quote currency code
    --start: string # first date, YYYY-MM-DD
    --end: string # last date, YYYY-MM-DD
    --limit: int # maximum number of rows (1-100)
    --raw # return the unmodified JSON response
]: nothing -> any {
    if ($env.FXMACRODATA_API_KEY? | is-empty) {
        error make --unspanned {
            msg: "fxmacrodata forex needs an API key: set $env.FXMACRODATA_API_KEY"
        }
    }
    let body = api-get $"/forex/($base | str lowercase)/($quote | str lowercase)" {
        start_date: $start
        end_date: $end
        limit: $limit
    }
    if $raw { return $body }

    $body.data
    | each {|row|
        {
            date: ($row.date | date-to-datetime)
            rate: $row.val
        }
    }
}
