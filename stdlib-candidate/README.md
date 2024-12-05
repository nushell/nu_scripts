# std-lib candidate

## Overview and Requirements

This module includes potential candidate commands (and other definitions) for inclusion in the Standard Library (`std`) that is built in to Nushell. As a general guideline, candidates should:

* Be general purpose
* Have broad appeal to other users
* Include doc comments for definitions and parameters that can be used with `help <command>`
* Include tests

The last two (doc and tests) do not need to be in place at the time of the initial inclusion in `stdlib-candidate`, but are, of course, required in order to promote to `std`.

## Showcase and Discussion

While primary feedback should take place in the PR, we have also established a [Drawing Board Discord Showcase](https://discord.gg/C3eMKV58MQ) which can be used for several purposes:

* Ideation before a PR is submitted
* Raise awareness of the PR
* Short-term questions and discussion

Note: The Drawing Board is not just for stdlib-candidate. Please tag your topic with `std-library` if it is about a Standard Library idea.

## Promotion Evaluation

In general, PRs will be evaluated after they have been trialed for a sufficient period, expected to be around 2 months. After that period, the feature may be:

* Promoted to `std`
* Removed from `stdlib-candidate`
* Or changes may be requested and then reevaluated later

## NUPM Note

When submitting a PR, please bump the module's `nupm.nuon`.

# Previous Repo

Note: As of December 2024, the candidate module has been "reset" to start fresh. The previous version has been moved to https://github.com/nushell/nu_scripts/tree/main/stdlib-candidate-old


