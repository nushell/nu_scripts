export def "bud img" [] {
    buildah images
    | from ssv -a
    | rename repo tag id created size
    | upsert size { |i| $i.size | into filesize }
}

export def "bud ls" [] {
    buildah list
    | from ssv -a
    | rename id builder image-id image container
}

export def "bud ps" [] {
    buildah ps
    | from ssv -a
    | rename id builder image-id image container
}

def "nu-complete bud ps" [] {
    bud ps
    | select 'CONTAINER ID' "CONTAINER NAME"
    | rename value description
}

export def "bud rm" [
    id: string@"nu-complete bud ps"
] {
    buildah rm $id
}
