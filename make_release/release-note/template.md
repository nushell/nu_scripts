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

Nu {{VERSION}} is available as [pre-built binaries](https://github.com/nushell/nushell/releases/tag/{{VERSION}}.0) or from [crates.io](https://crates.io/crates/nu). If you have Rust installed you can install it using `cargo install nu`.

> :bulb: **Note**  
> The optional dataframe functionality is available by `cargo install nu --features=dataframe`.

As part of this release, we also publish a set of optional plugins you can install and use with Nu. To install, use `cargo install nu_plugin_<plugin name>`.

# Table of content
- [*Themes of this release / New features*](#themes-of-this-release-new-features)
    - [*Hall of fame*](#hall-of-fame)
        - [*Bug fixes*](#bug-fixes)
        - [*Enhancing the documentation*](#enhancing-the-documentation)
    - [*Our set of commands is evolving*](#our-set-of-commands-is-evolving)
        - [*New commands*](#new-commands)
        - [*Changes to existing commands*](#changes-to-existing-commands)
        - [*Deprecated commands*](#deprecated-commands)
        - [*Removed commands*](#removed-commands)
    <!-- TODO: please add links to the other sections here

        the following command should help pre-generate a great deal of the table of content.
        be careful with the format and false-positives :wink:
        ```nushell
        rg '^#+ ' blog/...
            | lines
            | each {
                str replace '# ' '- '
                    | str replace --all '#' '    '
                    | str replace --regex '- (.*)' '- [*$1*](#$1-toc)'
            }
            | to text
        ```
    -->
- [*Breaking changes*](#breaking-changes)
- [*Full changelog*](#full-changelog)

# Themes of this release / New features [[toc](#table-of-content)]
<!-- NOTE: if you wanna write a section about a breaking change, when it's a very important one,
    please add the following snippet to have a "warning" banner :)
    > see [an example](https://www.nushell.sh/blog/2023-09-19-nushell_0_85_0.html#pythonesque-operators-removal)

    ```md
    ::: warning Breaking change
    See a full overview of the [breaking changes](#breaking-changes)
    :::
    ```
-->

## Hall of fame [[toc](#table-of-content)]
### Bug fixes [[toc](#table-of-content)]
Thanks to all the contributors below for helping us solve issues and bugs :pray:
| author                               | description | url                                                     |
| ------------------------------------ | ----------- | ------------------------------------------------------- |
| [@author](https://github.com/author) | ...         | [#12345](https://github.com/nushell/nushell/pull/12345) |

### Enhancing the documentation [[toc](#table-of-content)]
Thanks to all the contributors below for helping us making the documentation of Nushell commands better :pray:
| author                               | description | url                                                     |
| ------------------------------------ | ----------- | ------------------------------------------------------- |
| [@author](https://github.com/author) | ...         | [#12345](https://github.com/nushell/nushell/pull/12345) |

## Our set of commands is evolving [[toc](#table-of-content)]
As usual, new release rhyms with changes to commands!

### New commands [[toc](#table-of-content)]
### Changes to existing commands [[toc](#table-of-content)]
### Deprecated commands [[toc](#table-of-content)]
### Removed commands [[toc](#table-of-content)]

# Breaking changes [[toc](#table-of-content)]
<!-- TODO:
    paste the output of
    ```nu
    ./make_release/release-note/list-merged-prs nushell/nushell --label breaking-change --pretty --no-author
    ```
    here
-->

# Full changelog [[toc](#table-of-content)]
<!-- TODO:
    paste the output of
    ```nu
    ./make_release/release-note/get-full-changelog
    ```
    here
-->
