- Every commit in git is a **commit object**. Each of them has a **pointer** that points to its parent(s), i.e. the immediate commit(s) come before it.
  - zero parents for initial commit
  - one parent for normal commits
  - one or more parents for commit merged from two branches
- By linking the parent pointers, we can infer the whole commit history

- A **branch** in git is simply a pointer tha points to one of the commits.
  - By default we only have the `main` branch. The `main` branch pointer will always move to the **latest commit** whenever we make a new commit

### Creating a branch

- You create a new branch by running `git branch <name>`. This _creates_ a new branch pointer that points to the latest commit as well.
- However, you are not switched to the new branch yet. Git has yet another pointer called `HEAD` that points to a **branch pointer** to indicate what branch we are on.

- Shortcut: `git checkout -b <name>` to create a new branch and then switch to it
  - (from ver. 2.23) you can use `git switch -c <name>` for the same purpose

### Switching to a branch

- To switch into a branch, run `git checkout <branch-name>`, which moves the `HEAD` to pointing the branch pointer we specified
  - (from ver. 2.23) you can use `git switch <name>` for switching branch too
  - Note: switching branches may point to a diffrent commit and will have immediate effect on the work directory shown
- When making a commit in a branch, _both the HEAD and the branch pointer will move to new newest commit_ while other branch pointers remains unchanged.
- **!!!** Switching to another branch when there are uncomitted changes in the current branch will be rejected in git. You can work around it with e.g. stashing; more on that later.
