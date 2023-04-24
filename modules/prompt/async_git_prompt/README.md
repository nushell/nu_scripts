This module exports commands for creating a nushell prompt that computes git status (staged and
unstaged changes) asynchronously. This can be useful in large git repos when it is slow to obtain
this information synchronously.

To use this module:

0. Place the file `async-git-prompt.nu` in the `$nu.config-path` directory (this is the directory
   containing `init.nu` and `env.nu`).

1. Use the command `async-git-prompt-string` in your own `PROMPT_COMMAND` (the file prompt.nu
   contains an example of doing this.)
   At this point, your prompt will be computing the information synchronously, because the cache
   file does not yet exist.

2. In a repo where git is slow, run the command `async-git-prompt-refresh-cache`.
   Now, your prompt will be fast, but it also won't update automatically. You could investigate a good
   way to invalidate the cache automatically, but the manual alternative is:

3. Whenever you think your prompt might be stale, re-run the command `async-git-prompt-refresh-cache`.
   Your prompt will update on one of the next times that you hit <enter>.

4. It will probably be convenient to alias this, e.g.

   ```nu
   alias r = async-git-prompt-refresh-cache
   ```

5. To go back to synchronous mode, run `async-git-prompt-delete-cache`.

### TODO

- Automatic cache invalidation
- Show untracked files (this can be very expensive in large repos)
