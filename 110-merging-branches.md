### Merging linear branches

- Let say `new-branch` is a linear descendant of `main`
- When we say we merge `new-branch` into `main`, what git does actually is to move the `main` branch pointer _forward_ to the `new-branch` pointer. This is called "Fast-forward"-ing.
  - First you need to switch to the branch you want to merge into: `git switch main`
  - Then run `git merge new-branch` to merge `new-branch` into `main`

### Merging divergent branches

- Two branches are _divergent_ if they are not direct ancestor/descendant of each other, but has a common parent commit.
- Doing `git merge` on them will result in a **new commit** that takes into the _changes_ occured in both branches since the common parent commit. The branch merged into will have its branch pointer pointing to this newly created commit.
  - This is called a _three-way merge_ as it is merging three versions together

## Merge conflicts

- If two divergent branches happen to change the same part of a file in different ways, git can't merge it smoothly.
- After `git merge` is run under such circumstances, git will _pause_ the merge and add **conflict-resolution markers** to the conflicting file, something like:

```
<<<<<<< HEAD:index.html
<div id="footer">contact : email.support@github.com</div>
=======
<div id="footer">
 please contact us at support@github.com
</div>
>>>>>>> iss53:index.html
```

- The top version (_current change_) is the change you made in THIS branch
- the bottom version (_incoming change_) is the change from the branch you try to merge from
- To resolve the conflict:

  1. Replace the whole conflict block with a final version you want it to be. Remove all the conlfict markers.
     - This can be done with any text editors. VS Code has special text highlights for that. Alternatively, run `git mergetool`
  2. `git add` the file to tell git that this file has had the conflict resolved.
  3. Repeat for all files with conflicts
  4. `git commit` all conflicting files. The new commit is the one supposed to be creating from `git merge` so it will have a default commit message filled in already something like

  ```
  Merge branch 'iss53'

  Conflicts:
  index.html
  ...
  ```

  5. The new commit is now created to merge the two branches

## Deleting a branch

- When you no longer need a branch (e.g. all changes are merged into `main`), you can delete it by `git branch -d <name>`.
  - **!!!** Deleting a branch that is NOT merged will be rejected by git.
