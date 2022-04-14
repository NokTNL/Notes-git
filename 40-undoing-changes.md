### Fixing the most recent commit

`git commit --amend`

- It will redo and overwrite the last commit but add new staged changes. Cannot remove NEW FILES added before. Will reuse old commit message

### "Undoing" unstaged modifications

**This can be dangerous!** It will revert back to the older version and is not undoable

1. `git checkout -- <file>`
2. (Since version 2.23.0) `git restore <path>`
