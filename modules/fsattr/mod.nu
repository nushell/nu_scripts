# This module wraps the `getfattr` and `setfattr` commands (Debian package is `attr`), to allow for convenient modification of file tags, rating, and comments.

export def 'attr get' [path] {
    let output = getfattr -dm '' -- $path;

    if not ($output|is-empty) {
        $output|from toml
    } else {
        {}
    }
}

export def 'attr set' [path, name, value] {
    setfattr -n $name -v $value -- $path
}

export def 'attr remove' [path, name] {
    setfattr -x $name -- $path
}

# List all the tags in this directory
export def 'tags here' [path = '.'] {
    ls $path | reduce --fold [] {|it, acc| $acc | append (try {tags list $it.name}) }|uniq
}

# List all the tags on a file
export def 'tags list' [path] {
    let tags = attr get $path|get --optional user.xdg.tags;

    if $tags != null {
        $tags | split row ','
    } else {
        []
    }
}

# Add a tag to a file
export def 'tags add' [path, name] {
    let existing = tags list $path;
    attr set $path 'user.xdg.tags' ($existing | append $name | str join ',');
}

# Remove a tag from a file
export def 'tags remove' [path, name] {
    let existing = tags list $path;
    let indices  = ($existing|enumerate|where item == $name|get index);
    let result   = if not ($indices|is-empty) { $existing|drop nth ($indices|first) } else { $existing };
    attr set $path 'user.xdg.tags' ($result | str join ',');
}

# Get the rating for a file
export def rating [path]: nothing -> int {
    let score = attr get $path|get --optional user.baloo.rating;
    return ($score|if ($in|is-not-empty) {into int});
}

# Set the rating for a file
export def 'rating set' [
    path,
    score: int  # Must be between 1 and 10.
] {
    attr set $path 'user.baloo.rating' ($score|into string)
}

alias rate = rating set;    # FIXME: Name may clash with something

# Remove the rating from a file
export def 'rating remove' [path] {
    attr remove $path 'user.baloo.rating'
}

# Sets a file's comment if a message is provided, else gets it.
export def comment [path, message?] {
    if ($message|is-empty) {
        return (attr get $path|get --optional user.xdg.comment)
    } else {
        attr set $path 'user.xdg.comment' $message;
    }
}

# TODO: Consider adding glob support, https://www.nushell.sh/book/moving_around.html#glob-patterns-wildcards

# export def --wrapped 'ls attr' [...rest] {

# Extension that adds fs attributes to `ls` command
@example "Pipe the output of `ls` through this command" { ls | with attr }
export def 'with attr' [] {
    $in
    | insert rating  {|row| rating $row.name}
    | insert tags    {|row| tags list $row.name}
    | insert comment {|row| comment $row.name}
}
