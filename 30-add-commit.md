# Add and commit files

In git, history of editing are comprised of **commits** == **snpashots** of the file system

## Tracking and staging files, staging file modification

- When you first initialise a git repo, all files inside it are UNTRACKED.
- You can check the status of the files in `git status`
- To **track new files**, you run `git add <filename-or-directory>` to make them tracked files AND put them in the staging area
  - files in the staging area are going to be **committed**
  - only the **snpashot** of file when you run `git add` is staged, so if you modify the file after `git add`, the staging area does not know
  - `git add` a directory will add all files inside _recursively_
- If a **tracked** file is **modified**, running `git status` will show they are "modified but not staged". Run `git add` on that file will add the modified file's snpashot to the staging area.

## Diff

- `git diff` tells you the details of UNSTAGED modification line-by-line.
  - Does not tell
- In contrast, `git diff --staged` (or `--cached`) tells you what modifications are STAGED and to be added to the next commit

## Unstaging files

1. `git reset HEAD <file>` for specific file, or `git reset HEAD` for all files
2. (Since version 2.23.0) `git restore --staged <path>`

- `git restore` is an alternative to `git reset` in general; more on that in later notes

## Remove a file from git

- To both remove a file in your local system and tell git to record the file deletion in the editing history:
  1. you can simply remove the file using bash's `rm` or in the filesystem GUI and git will detect the change in the working directory. Then run `git add <filename>` or `git rm <filenmae>` to stage the change.
  2. _(Recommended)_ Alternatively, `git rm <filename>` can remove it for you AND stage the change in one go and also provide a recovery mechanism
     - !!! If you regret deleting it using `git rm`, run `git restore --staged <filename>` and then `git restore <filename>` to recover it; more on `git restore` in "Undoing changes" notes
- If you simply want to untrack the file from git but preserve it in the local file system, run `git rm --cached <filename>`. This will both stage the deletion and make the file untracked again.

## Renaming files

- You can do it in a 3-step process:

```
mv README.md README  // Or use the GUI
git rm README.md     // Stage the old file's removal
git add README       // This file is new to git so you need to add it
```

After these commands, `git status` is smart enough to detect it is renaming and will show the file as "renamed"

- _(Recommended)_ Alternatively, `git mv <old-filename> <new-filename>` will do all three steps in one go, and you can rename the file again to whatever names, or even rename it back to the original name (so equal to no modification)

## Commit

- Once you have finalised your changes, run `git commit` commits all staged files into a new commit

## Extra commands

`git status -s`: short version of `git status`:

- It will show something like this:

```
M README
MM Rakefile
A  lib/git.rb
M  lib/simplegit.rb
?? LICENSE.txt
```

- There are two columns.
  - First column = Staging area . These are the staged changes
    - "A" = newly added files, "M" = modified
  - Second column = Working directory . These are changes that are detected by git but NOT staged.
- "??" = untracked files

`git commit -a`: `add` all files automatically and then `commit`
