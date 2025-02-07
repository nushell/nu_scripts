---
title: Nushell {{VERSION}}
author: The Nu Authors
author_site: https://www.nushell.sh/blog
author_image: https://www.nushell.sh/blog/images/nu_logo.png
excerpt: Today, we're releasing version {{VERSION}} of Nu. This release adds...
---

<!-- TODO: complete the excerpt above -->

<!-- NOTE: start from the TODO all the way at the bottom (and sort of work your way up) -->

# Nushell {{VERSION}}

<!-- TODO: write this excerpt -->

Today, we're releasing version {{VERSION}} of Nu. This release adds...

# Where to get it

Nu {{VERSION}} is available as [pre-built binaries](https://github.com/nushell/nushell/releases/tag/{{VERSION}}) or from [crates.io](https://crates.io/crates/nu). If you have Rust installed you can install it using `cargo install nu`.

As part of this release, we also publish a set of optional [plugins](https://www.nushell.sh/book/plugins.html) you can install and use with Nushell.

# Table of contents

<!-- TODO: once all the content below is finished and committed, `use nu_scripts/make_release/release-note/notes.nu *` and run `write-toc $this_file`. -->

# Highlights and themes of this release

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

# Changes

## Additions

## Breaking changes

## Deprecations

## Removals

## Bug fixes and other changes

# Notes for plugin developers

# Hall of fame

Thanks to all the contributors below for helping us solve issues, improve documentation, refactor code, and more! :pray:

| author                               | title | link                                                    |
| ------------------------------------ | ----- | ------------------------------------------------------- |
| [@author](https://github.com/author) | ...   | [#12345](https://github.com/nushell/nushell/pull/12345) |

# Full changelog

<!-- TODO:
    - `use nu_scripts/make_release/release-note/notes.nu *`
    - run `list-prs --milestone v{{VERSION}} | pr-table`
    - paste the output here

Afterwards, go through each PR and classify it as one of the following:
    - A user-facing change. These PRs should go into the `# Changes` section.
    - A plugin-facing change. These PRs should go in `# Notes for plugin developers`. Some plugin-facing changes might also be a user-facing change and vice versa.
    - A documentation improvement, error message improvement, refactoring PR, clippy fix, typo fix, etc. These PRs go into the `# Hall of fame`. You can just copy the table row in this section and paste it to the `# Hall of fame` section above. Note that major refactorings may warrant a section in `# Highlights`.
    - Dependabot PRs and version bumps should be ignored. They will only be mentioned in `# Full changelog`.
-->
