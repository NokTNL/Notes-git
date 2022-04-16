## `git reset`

- Remember `git status` shows the _difference_ between the HEAD, index and working directory

`git reset <commit>` perform three steps:

1. Move the branch + HEAD to the specified commit

- `git reset --soft` will only do this and then stop here
- e.g. `git reset --soft HEAD~` will move the HEAD + branch back to the first parent commit. The index and the WD have not changed.
- If there was no modifications prior to the reset, it is equivalent to undoing a commit but all changes in that commit are staged. `git status` will show changes are to be commited.

2. Propagate the content in HEAD to the INDEX

- `git reset` (w/o --options = `--mixed`) will stop here. **This is the default**
- If there was no modifications prior to the reset, it is equivalent to undoing the commit + unstaging everything. However the WD is untouched, so all changes are still there, just not staged.

3. Propagate the content in INDEX to the WD
   **!! This can potentially wipe out all unstaged changes in the WD! Stashing highly recommended**

- This is the case for `git reset --hard <commit>`
- This is equivalent to reverting to that state of that commit
- Changes committed before can still be recovered by running `git reset --hard <commit>` again back to the commit with that change

## Reset with a path

`git reset <commit> <path>`: only reset for a certain file

- First of all, it does not make sense to move the branch + HEAD pointer to only a certain file. So the this first step is **skipped** if you reset with a path.

- So what it does is to just copy the status of that file from HEAD to the INDEX.
- So in this situation where a new change of a file is staged: (v == file version)

```
HEAD     Index    WD
v2       v3       v3
```

- Run `git reset HEAD <filename>` and it will become this:

```
HEAD     Index    WD
v2  -->  v2       v3
```

which is essentailly _unstaging_ the file.

## Squashing consecutive commits by reset

- What you need to do is to just take the first commit you want to squashed into, and:
  `git reset --soft <oldest-commit>`
- Now all the changes (incl. those only in the WD and not yet staged) can be added and comitted in one go --> squashed

## `git checkout <commit>`

It is more preferred than `reset` if you want to

- switch between branches (as `reset` will move the branch)
- just want to look into a past snapshot (will warn you against uncomitted changes)

It is smiliar to the effect of `git reset --hard <commit>`, BUT:

- It checks whether doing this will wiped out **uncomitted changes** and will _fail_ if it will
- It only move the HEAD to that commit, not HEAD + branch pointer

That's why it is useful for _switching branches_, like `git checkout <branch>` as `<branch>` is just a pointer to a specific commit

- Alternatively, if you want to go back to a certain commit and create a new branch there:

```
git checkout <old-commit>
```

Git will warn you that the HEAD is now _detached_ from a branch. So you create a new branch by `git checkout -b <branch>` or `git switch -c <branch>`

## Reversing past changes by `git revert`

- `git revert <commit>` restore the system back to the state of a past commit, _BUT_ it creates a _new commit_ to do so.
  - **!!** requires working tree to be clean == no modifications compared to the HEAD. Make sense because `revert` will wipe out those changes
  - It retrieves what difference was introduced in that commit, then _invert_ that change and stage it
  - Then a new commit window will pop up with a default "Revert ...." commit message
