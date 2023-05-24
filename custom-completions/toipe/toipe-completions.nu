def "nu-complete toipe wordlists" [] {[
    top250
    top500
    top1000
    top2500
    top5000
    top10000
    top25000
    commonly-misspelled
    os
]}

# external completion for toipe 0.4.1
export extern toipe [
    --file (-f): path  # Path to custom word list file. Providing this will override `-w`/`--wordlist`.
    --help (-h)  # Print help information
    --num-words (-n): int  # Number of words to show on each test [default: 30]
    --version (-V)  # Print version information
    --wordlist (-w): string@"nu-complete toipe wordlists" # Word list name [default: top250]
]
