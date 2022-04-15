## `git stash`

Temporarily store changes in in a _stack_ to give you a clean working directory
**!!** By default, it only stash _tracked_ files. See below for stashing untracked files

- To inspect the stash stack: `git stash list`
  - `stash{0}` is the _latest_!!!
- To add a change back:
  - `git stash apply stash@{2}` to apply `stash@{2}` as seen in the stash stack
  - `git stash apply` for the lastest stash
  - If need to apply the staging status too, use the option `git stash apply --index` (index === the staging area)
- When a stash is no longer needed, run `git stash drop <stash>`
- `git stash pop` applies the stash _AND_ drops it

### Stashing untracked and gitignore-ed files

- Typical git operations won't wipe out untracked & gitignore-ed files as it is not of git's intereset. But in case you want to clean them away for some purpose:
  - `git stash -u` to include untracked files (but not gitignore-ed files)
  - `git stash -a` for ALL files, including gitignore-ed ones

### Creating a branch from a stash

- If after stashing, you happenned to changed the files included in the stash, applying the stash may give you merge conflicts
- To avoid such conflicts, you may want to try `git stash branch <branch-name> [<stash>]`. It goes back to the commit when you stashed your changes and checkout a new branch there.

## Extra commands

- `git stash -p` or `--patch`: patch mode == interative. Decide each file whether they should be stashed.
