---
title: Nushell {{VERSION}}
author: The Nu Authors
author_site: https://twitter.com/nu_shell
author_image: https://www.nushell.sh/blog/images/nu_logo.png
excerpt: Today, we're releasing version {{VERSION}} of Nu. This release adds...
---
<!-- TODO: complete the excerpt above -->

# Nushell {{VERSION}}

Nushell, or Nu for short, is a new shell that takes a modern, structured approach to your command line. It works seamlessly with the data from your filesystem, operating system, and a growing number of file formats to make it easy to build powerful command line pipelines.

<!-- TODO: write this excerpt -->
Today, we're releasing version {{VERSION}} of Nu. This release adds...

# Where to get it

Nu {{VERSION}} is available as [pre-built binaries](https://github.com/nushell/nushell/releases/tag/{{VERSION}}) or from [crates.io](https://crates.io/crates/nu). If you have Rust installed you can install it using `cargo install nu`.

As part of this release, we also publish a set of optional plugins you can install and use with Nu. To install, use `cargo install nu_plugin_<plugin name>`.

# Table of content
- [_Highlights and themes of this release_](#highlights-and-themes-of-this-release-toc)
- [_Changes to commands_](#changes-to-commands-toc)
  - [_Additions_](#additions-toc)
  - [_Breaking changes_](#breaking-changes-toc)
  - [_Deprecations_](#deprecations-toc)
  - [_Removals_](#removals-toc)
  - [_Bug fixes and other changes_](#bug-fixes-and-other-changes-toc)
- [_All breaking changes_](#all-breaking-changes-toc)
- [_Notes for plugin developers_](#notes-for-plugin-developers-toc)
- [_Hall of fame_](#hall-of-fame-toc)
- [_Full changelog_](#full-changelog-toc)
<!-- TODO: please add links to the other sections here

    the following command should help pre-generate a great deal of the table of content.
    be careful with the format and false-positives :wink:
    ```nushell
    rg '^#+ ' blog/...
        | lines
        | each {
            str replace '# ' '- '
                | str replace --all '#' '    '
                | str replace --regex '- (.*)' '- [_$1_](#$1-toc)'
        }
        | to text
    ```
-->

# Highlights and themes of this release [[toc](#table-of-content)]
<!-- NOTE: if you wanna write a section about a breaking change, when it's a very important one,
    please add the following snippet to have a "warning" banner :)
    > see [an example](https://www.nushell.sh/blog/2023-09-19-nushell_0_85_0.html#pythonesque-operators-removal)

    ```md
    ::: warning Breaking change
    See a full overview of the [breaking changes](#breaking-changes)
    :::
    ```
-->
<!-- NOTE: see https://vuepress.github.io/reference/default-theme/markdown.html#custom-containers
    for the list of available *containers*
-->

# Changes to commands [[toc](#table-of-content)]

## Additions [[toc](#table-of-content)]

## Breaking changes [[toc](#table-of-content)]

## Deprecations [[toc](#table-of-content)]

## Removals [[toc](#table-of-content)]

## Bug fixes and other changes [[toc](#table-of-content)]

<!-- NOTE: to start investigating the contributions of last release, i like to list them all in a raw table.
    to achieve this, one can use the [`list-merged-prs` script from `nu_scripts`](https://github.com/nushell/nu_scripts/blob/main/make_release/release-note/list-merged-prs)
    as follows:

    ```nushell
    use ./make_release/release-note/list-merged-prs
    use std clip

    let last_release_date = ^gh api /repos/nushell/nushell/releases
        | from json
        | into datetime published_at
        | get published_at
        | sort
        | last

    let prs = list-merged-prs nushell/nushell $last_release_date
        | sort-by mergedAt
        | update url {|it| $"[#($it.number)]\(($it.url)\)" }
        | update author { $"[@($in)]\(https://github.com/($in)\)" }
        | select author title url
        | rename -c {url: pr}
        | to md --pretty

    $prs | to md --pretty | clip
    ```
-->

# All breaking changes [[toc](#table-of-content)]
<!-- TODO:
    paste the output of
    ```nu
    ./make_release/release-note/list-merged-prs nushell/nushell --label pr:breaking-change --pretty --no-author
    ```
    here
-->

# Notes for plugin developers [[toc](#table-of-content)]

# Hall of fame [[toc](#table-of-content)]

Thanks to all the contributors below for helping us solve issues and improve documentation :pray:

| author                               | title       | url                                                     |
| ------------------------------------ | ----------- | ------------------------------------------------------- |
| [@author](https://github.com/author) | ...         | [#12345](https://github.com/nushell/nushell/pull/12345) |

# Full changelog [[toc](#table-of-content)]
<!-- TODO:
    paste the output of
    ```nu
    ./make_release/release-note/get-full-changelog
    ```
    here
-->
