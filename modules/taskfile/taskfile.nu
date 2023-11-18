export def new [filename:string = ','] {
    '
    export def main [...args:string@compos] {
        match $args.0 {

        }
    }

    def compos [context: string, offset: int] {
        let pos = ($context | str substring 0..$offset | split row -r "\\s+" | length) - 1
        match $pos {
            1 => []
            2 => []
            _ => []
        }
    }
    '
    | lines
    | range 1..-2
    | each {|x| $x | str substring 4..}
    | str join (char newline)
    | save $"($filename).nu"
}
