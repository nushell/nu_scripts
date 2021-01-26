def my-ls [x] {
    ls $x | where size > 10kb
}

my-ls .
