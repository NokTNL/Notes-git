## Changing the last commit

If you want to change the content in your last commit, or simply change the commit message:

1. do all the content changes you need (Modifying files, `git add`, `git rm`, `git rm --cached`, etc.)
2. `git commit --amend` will show up the commit window for the last commit
   - You can choose to not edit the commit message by running `git commit --amend --no-edit`

## Changing commits that are further down

- To do that, we need to rely on `rebase`. Run:
  `git rebase -i <commit>`

  - `-i` = interactive mode
  - `<commit> = HEAD~3` means you want to go back to HEAD - 3 commits == you want to edit the last 3 commits (that come after this commit)
    - **`HEAD~3`** means "first parent, 3 generation back" from HEAD
    - **`HEAD^1` == `HEAD^`** means "first parent", **`HEAD^2`** means "second parent", etc.
    - `HEAD~3` == `HEAD^1^1^1` == `HEAD^^^`
  - `git rebase -i --root` if you want all commits to be included

- It will then show up a window like this:

```
pick f7f3f6d Change my name a bit
pick 310154e Update README formatting and add blame
pick a5f4a0d Add cat-file
...
```

It will start from the commit you specified (`HEAD~3`), then apply the commits one by one, from top to bottom.

- If you want to edit a specific commit, change `pick` to `edit` on that commit. The reabse process will pause at that commit and you can `git commit --amend` until you are satisfied. The untouched commits will simply be applied and skipped.

## Squashing commits

Change a commit from `pick` to `squash` in `git rebase -i`. It will be squshed into the commit right above it.

## Splitting commits

1. You need to set that commit to `edit` in `git rebase -i`
2. When the rebase pause at that commit, you **undo** that commit by resetting to the last commit: `git reset HEAD^`
3. Now you `git add` and `commit` into multiple commits consecutively
4. When you are done, you can run `git rebase --continue`
